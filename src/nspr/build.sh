#!/bin/sh
#
# Build NSPR with working 64-bit file offsets on musl.
#
# Alpine's nspr package defines _PR_NO_LARGE_FILES because _linux.h only
# detects glibc. That makes PR_Seek64 refuse offsets past 2GiB and stalls
# Firefox chunked uploads.
#
# See https://github.com/jlesage/docker-firefox/issues/285
#

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

# Set same default compilation flags as abuild.
# Keep Alpine's musl feature probes, but do not define _PR_HAVE_OFF64_T:
# that selects glibc's *64 APIs, which musl no longer exposes.
export CFLAGS="-Os -fomit-frame-pointer -D_PR_POLL_AVAILABLE -D_PR_INET6 -D_PR_HAVE_INET_NTOP -D_PR_HAVE_GETHOSTBYNAME2 -D_PR_HAVE_GETADDRINFO -D_PR_INET6_PROBE"
export CXXFLAGS="$CFLAGS"
export CPPFLAGS="$CFLAGS"
export LDFLAGS="-Wl,--strip-all -Wl,--as-needed"

export CC=xx-clang
export CXX=xx-clang++
export HOST_CC=clang
export HOST_CXX=clang++

export AR=ar
export RANLIB=ranlib
export STRIP=strip

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

log() {
    echo ">>> $*"
}

NSPR_URL="${1:-}"

if [ -z "$NSPR_URL" ]; then
    log "ERROR: URL missing."
    exit 1
fi

#
# Install required packages.
#
apk --no-cache add \
    curl \
    patch \
    clang \
    make \
    gcc \
    musl-dev \
    binutils \

xx-apk --no-cache --no-scripts add \
    musl-dev \
    gcc \
    linux-headers \

#
# Download sources.
#
log "Downloading NSPR sources..."
mkdir /tmp/nspr
curl -# -L -f "$NSPR_URL" | tar xz --strip 1 -C /tmp/nspr

#
# Compile NSPR.
#
log "Patching NSPR..."
patch -p1 -d /tmp/nspr/nspr < "$SCRIPT_DIR"/musl-largefile.patch

log "Configuring NSPR..."
conf=
case "$(xx-info arch)" in
    386|arm) ;;
    *) conf="--enable-64bit" ;;
esac

mkdir /tmp/nspr/build
(
    cd /tmp/nspr/build && ../nspr/configure \
        --build=$(TARGETPLATFORM= xx-clang --print-target-triple) \
        --host=$(xx-clang --print-target-triple) \
        --prefix=/usr \
        --disable-debug \
        --enable-optimize \
        --enable-ipv6 \
        $conf
)

log "Compiling NSPR..."
make -C /tmp/nspr/build -j$(nproc)

log "Installing NSPR..."
make DESTDIR=/tmp/nspr-install -C /tmp/nspr/build install
rm -f /tmp/nspr-install/usr/lib/*.a
