#!/usr/bin/env bash
set -euxo pipefail

sed -i 's/edition = "2018"/edition = "2024"/g' examples/*/Cargo.toml

sed -i 's|path = "../../"|version = "0.12"|g' examples/*/Cargo.toml