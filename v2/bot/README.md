# v2/bot

* A Discord bot written in Rust.
* bot is a discord bot to make discord app bertter to:
    * advanced search features for who want make some records or fix the broken preview from some outside URLs.
    * Fix Links Previews

## Architecture (Rust code layout)

```
v2/bot/
├─ Cargo.toml            # crate deps (poise/serenity/tokio)
├─ src/
│  ├─ main.rs            # entrypoint, framework setup, client start
│  └─ commands.rs        # command handlers (help/vote/getvotes)
└─ README.md
```

## Runtime flow (high level)

```
main.rs
  ├─ build FrameworkOptions
  ├─ register slash commands in setup()
  ├─ read DISCORD_TOKEN
  └─ start Serenity client
```

## Usage

### Setup

```shell
export DISCORD_TOKEN=your-discord-token
```

### Run from workspace root

```shell
cargo run -p bot
```

### Command examples

```
~help
~vote pumpkin
~getvotes
~getvotes pumpkin
```

## Adding a new command

1) Add a new command in `v2/bot/src/commands.rs`:

```rust
#[poise::command(prefix_command, slash_command)]
pub async fn ping(ctx: Context<'_>) -> Result<(), Error> {
    ctx.say("pong").await?;
    Ok(())
}
```

2) Register it in `v2/bot/src/main.rs`:

```rust
let options = poise::FrameworkOptions {
    commands: vec![commands::help(), commands::vote(), commands::getvotes(), commands::ping()],
    ..Default::default()
};
```

Note: Slash commands are registered in `setup()` via `register_globally`, so you need to restart the bot to push updates.
Tip: For faster iteration, switch to guild-only registration during development (e.g., `register_in_guild`) to avoid global command propagation delays.

```rust
use poise::serenity_prelude::GuildId;

// In setup():
let guild_id = GuildId::new(123456789012345678);
poise::builtins::register_in_guild(ctx, &framework.options().commands, guild_id).await?;
```

## To-do-list

* Refactoring v1/bot to v2/bot
    * slash commands
    * event handling
* Discord Twitter Link Handler with mutli 3rd-pary APIs

### quick start

* cargo
```shell
cd bot
export DISCORD_TOKEN=your-discord-token
cargo run
```

### Reference

* Rust
    * [github.com/blackdesert575/rust-101](https://github.com/blackdesert575/rust-101)
    * [github.com/serenity-rs/serenity](https://github.com/serenity-rs/serenity)
* 3rd-party for Fix twitter/x.com broken preview metadata
    * [github.com/canaria3406/ermiana/blob/master/src/regex/handleTwitterRegexV2.js](https://github.com/canaria3406/ermiana/blob/master/src/regex/handleTwitterRegexV2.js)
    * [github.com/dylanpdx/BetterTwitFix](https://github.com/dylanpdx/BetterTwitFix)
    * [github.com/FxEmbed/FxEmbed](https://github.com/FxEmbed/FxEmbed)
    * [github.com/Wikidepia/InstaFix](https://github.com/Wikidepia/InstaFix)
