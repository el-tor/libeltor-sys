#!/bin/bash
set -euo pipefail

# === Configuration ===
ANDROID_NDK_VERSION=28.0.12433566
ANDROID_API=24
TARGET=aarch64-linux-android
NDK="$HOME/Library/Android/sdk/ndk/$ANDROID_NDK_VERSION"
TOOLCHAIN="$NDK/toolchains/llvm/prebuilt/darwin-x86_64"

# === Environment setup (minimal working config) ===
export NDK_HOME="$NDK"
export CC_aarch64_linux_android="$TOOLCHAIN/bin/${TARGET}${ANDROID_API}-clang"
export TARGET_AR="llvm-ar"
export RUSTFLAGS="-C panic=abort"
export CFLAGS_aarch64_linux_android="-DOPENSSL_RAND_SEED_NONE"
export PATH="$TOOLCHAIN/bin:$PATH"

# Verify NDK toolchain exists
if [ ! -d "$TOOLCHAIN" ]; then
    echo "❌ Android NDK not found at: $TOOLCHAIN"
    echo "Please install Android NDK $ANDROID_NDK_VERSION"
    exit 1
fi

# Verify Rust target is installed
if ! rustup target list --installed | grep -q "$TARGET"; then
    echo "📦 Installing Rust target: $TARGET"
    rustup target add "$TARGET"
fi

echo "🏗 Building for $TARGET (API $ANDROID_API)..."
echo "Using NDK: $NDK"
echo "Using toolchain: $TOOLCHAIN"
echo "CC: $CC_aarch64_linux_android"

# Debug build (faster for development)
# cargo build --target "$TARGET" --features=vendored-openssl

# Release build (optimized for production)
cargo build --release --target "$TARGET" --features=vendored-openssl

echo "✅ Done. Output at: target/${TARGET}/release/"