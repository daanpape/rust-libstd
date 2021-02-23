# Rust standard library for OpenWRT

## What is this

This package will install rust's `libstd` as a dynamic `*.so` library in the
`/usr/lib` folder of your OpenWRT device. This allows for very small rust 
binaries to be compiled which is required for OpenWRT use.

## Requirements

For this example to work you need to have the [`lang/rust` package](https://github.com/Itus-Shield/packages/tree/rust/lang/rust)
from Grommish. This package will build the `rustc` compiler
and the `cargo` application from source tuned for use with dynamically linked
`musl` and softfloat MIPS and MIPS64 targets.

## Compilation

To compile this minimal working example the following steps must be taken:
 1. Install and build the requirements.
 2. Clone this repository in the `package/lang` directory of the OpenWRT
    toolchain.
 3. Execute `make menuconfig` in the toolchain root and select the 
    `rust-libstd` library in the `Languages` menu either with a `*` or
    `M` selector.
 4. Build the package by executing 
    `make V=s package/rust-libstd/{clean,compile}` in the root of the
    toolchain.

When everything goes succesfull you now have an installable `ipk` in the 
`bin/packages/` directory.
