# MWORKS (Julia)

A collection of Julia applications for text analytics, matrix transformations, numeric computation, and an interactive guessing game. Developed around MWORKS.Syslab, with standalone scripts that use Julia Base and standard libraries only.

## Projects

| Directory | Application | Implementation focus |
| --- | --- | --- |
| [numeric-types](numeric-types/) | Numeric operations explorer | Integer, floating-point, complex, and rational representations |
| [text-analysis](text-analysis/) | Character mentions and English word frequency | UTF-8 text, dictionaries, deterministic ranking, overlapping aliases |
| [matrix-processing](matrix-processing/) | Column normalization and neighborhood updates | Views, broadcasting, in-place mutation, boundary handling |
| [number-guessing-game](number-guessing-game/) | Multi-difficulty guessing game | Input validation, session state, history, and statistics |
| [data](data/) | Two Chinese text corpora | Edition provenance and integrity checksums |
| [docs](docs/) | Technical notes | Environment, algorithms, scope, and validation |

## Run

Use Julia 1.10 or a compatible MWORKS.Syslab Julia runtime. No package installation is required. From the repository root:

```sh
julia numeric-types/numeric_operations.jl
julia text-analysis/character_mentions.jl
julia text-analysis/word_frequency.jl
julia matrix-processing/column_normalization.jl
julia matrix-processing/neighbor_average_update.jl
julia number-guessing-game/number_guessing_game.jl
```

In Syslab, open a script and run it, or use `include("/absolute/path/to/script.jl")` followed by `main()` for an interactive program. Each application should be run in its own session/module because interactive entry functions share the name `main`. Matrix functions can be called directly after including their files.

## Verification

```sh
julia test/runtests.jl
```

The tests cover matrix boundaries and mutation semantics, alias overlap, UTF-8 corpora, word counting and difficulty thresholds, and game input validation. See [validation notes](docs/validation.md) for the recorded local run.

## Scope

These are small, focused console applications and numerical utilities. Text difficulty uses explicit heuristic thresholds rather than a trained model. Character counting matches configured strings rather than resolving the meaning of every reference. Game statistics persist only for the current session.
