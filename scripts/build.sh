cargo clean
cargo build -vv --features=vendored-openssl
#cargo package

# android
# cross build -vv --features=vendored-openssl,with-lzma,with-zstd --target=aarch64-linux-android
