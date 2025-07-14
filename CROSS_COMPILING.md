# Android

Make sure you have the NDK toolchain in your `PATH`, i.e. add `<NDK>/toolchains/llvm/prebuilt/<host-tag>/bin/` to your `PATH` and then run the build with one of the `android` cargo targets like this:

```
cargo build -vv --features=vendored-openssl --target=aarch64-linux-android
```
# iOS

If you are on macOS and you have the `Xcode Command Line Tools` installed everything should work out of the box, both for `iphone` and `iphonesim`. You can start the build with:

```
cargo build -vv --features=vendored-openssl --target=aarch64-apple-ios
```

# Windows

To cross-compile for Windows from Linux install `mingw32` and/or `mingw64` and compile for the relevant cargo target, like:

```
cargo build -vv --features=vendored-openssl --target=x86_64-pc-windows-gnu
```

# Mac ARM Android

```
rustup target add aarch64-linux-android
rustup target add armv7-linux-androideabi
rustup target add i686-linux-android
# Emulator
rustup target add x86_64-linux-android

cargo install cargo-ndk

./scripts/android.sh

# All platforms (auto-detects host OS and architecture):

# Default build (aarch64-linux-android)
./scripts/android.sh

# Specific Android targets:
./scripts/android.sh aarch64-linux-android    # Android ARM64
./scripts/android.sh armv7-linux-androideabi  # Android ARMv7
./scripts/android.sh i686-linux-android       # Android x86
./scripts/android.sh x86_64-linux-android     # Android x86_64 (emulator)

# Debug builds (faster compilation):
./scripts/android-debug.sh
./scripts/android-debug.sh armv7-linux-androideabi

# Target selection: Choose based on what Android device/emulator you're targeting:
    # aarch64-linux-android - Modern Android devices (ARM64)
    # armv7-linux-androideabi - Older Android devices (ARMv7)
    # x86_64-linux-android - Android emulator on x86_64
    # i686-linux-android - Android emulator on x86


```