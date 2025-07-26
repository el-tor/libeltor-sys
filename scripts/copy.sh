# copy el-tor src
rm -rf libtor-src/tor-src
git clone https://github.com/el-tor/eltor libtor-src/tor-src
# git clone ../eltor libtor-src/tor-src
find libtor-src/tor-src -type f -name Cargo.toml -exec rm -vf '{}' \;
rm -rf libtor-src/tor-src/.git
# git apply libtor-src/patches/*.patch