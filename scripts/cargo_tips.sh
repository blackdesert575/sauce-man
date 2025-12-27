#!/usr/bin/env bash
set -euxo pipefail

cargo check --workspace

cargo help new
cargo help init

cargo new v2/api --bin
cargo new v2/bot --bin

cargo init v2/api
cargo init v2/bot

cargo metadata --format-version 1
cargo check