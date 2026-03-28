# RMP — Rust Multi-Platform

Agent-native build tooling for cross-platform Rust apps (iOS + Android).

RMP provides templates, build scripts, and agent infrastructure for building apps with a **Rust core** and **native UI shells** (SwiftUI + Kotlin/Compose).

## Architecture

```
┌─────────────┐  ┌──────────────────┐
│  iOS (Swift) │  │ Android (Kotlin) │   ← Thin UI shells
└──────┬───────┘  └────────┬─────────┘
       │    UniFFI bindings │
       └────────┬───────────┘
         ┌──────┴──────┐
         │  Rust Core  │                  ← ALL business logic
         └─────────────┘
```

- **Rust core**: All business logic, data models, state management, persistence. Pure Rust, no platform deps.
- **FFI layer**: UniFFI 0.31 bindings. Thin `Ffi*` wrapper types.
- **Native shells**: SwiftUI and Kotlin/Compose. Render state from Rust, dispatch actions back. No business logic.

## What's In This Repo

- `templates/` — Full project template (Cargo workspace, iOS, Android, Nix, CI)
- `scripts/` — Build scripts for iOS and Android cross-compilation
- `docs/` — Architecture and build docs with `read_when` frontmatter for agents
- `invariants/` — Machine-checkable architecture rules

## Quick Start

1. Copy `templates/` into a new repo
2. Replace template variables (`{{project}}`, `{{ProjectPascal}}`, etc.) with your app name
3. Copy `scripts/` into your repo
4. `nix develop` to get the dev environment
5. `just test` to run tests
6. `just ios-build` / `just android-build` to cross-compile

## Agent Support

RMP projects are designed to be maintained by AI coding agents:

- **`scripts/agent-brief`** — Run at session start for live context (commands, docs, environment, invariants)
- **`docs/` with `read_when`** — Agents load only the docs relevant to their current task
- **`invariants/invariants.toml`** — Architecture rules that agents and reviewers enforce
- **`CLAUDE.md` / `AGENTS.md`** — Agent instructions baked into every project

## License

MIT
