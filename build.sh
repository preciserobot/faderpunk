#!/usr/bin/env bash
set -e

export PATH="$HOME/.rustup/toolchains/nightly-aarch64-apple-darwin/bin:$PATH"

cd faderpunk
cargo build --release
cd ..

ELF=target/thumbv8m.main-none-eabihf/release/faderpunk
cp "$ELF" "$ELF.elf"
picotool uf2 convert "$ELF.elf" "$ELF.uf2"

echo "Built: $ELF.uf2"
