# Repository Guidelines

## Project Structure & Module Organization
- `v2/`: active Rust workspace members.
  - `v2/bot/`: Discord bot (Poise/Serenity).
  - `v2/api/`: API service scaffold.
- `v1/`: archived Python bot/api implementation.
- `serenity/` and `poise/`: upstream example sources referenced for experiments.
- `dist/` and `target/`: build outputs; avoid committing changes here.
- Top-level `Cargo.toml` defines the Rust workspace.

## Build, Test, and Development Commands
- `cargo build`: build all Rust workspace members.
- `cargo run -p bot`: run the Discord bot from workspace root.
- `cargo run -p api`: run the API binary (currently a stub).
- `cargo test`: run Rust tests across the workspace (add tests as needed).
- `cd v1/bot && uv run main.py`: run the legacy Python bot (see `v1/README.md`).

## Coding Style & Naming Conventions
- Rust: follow existing module layout; keep file and module names in `snake_case`.
- Formatting: use rustfmt defaults (`cargo fmt`) if you touch Rust code.
- Python (v1): follow existing style in `v1/` and keep modules in `snake_case`.

## Testing Guidelines
- Rust tests are expected to be run via `cargo test`.
- No dedicated test suite is checked in yet; add tests alongside new functionality.
- Name tests descriptively (e.g., `test_vote_counts` in Rust or Python).

## Commit & Pull Request Guidelines
- Commit messages are short, imperative, and describe the change (e.g., "Update README.md").
- PRs should include:
  - A clear description of affected area (`v2/bot`, `v2/api`, or `v1`).
  - Steps to run or validate the change.
  - Screenshots/log snippets when behavior changes are user-visible.

## Security & Configuration Tips
- The bot expects `DISCORD_TOKEN` in the environment (see `v2/bot/src/main.rs`).
- Keep secrets out of the repo; use `.env` or shell exports locally.
