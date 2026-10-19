# Number Guessing Game

A console game with three difficulty ranges: 1–50, 1–100, and 1–500. Each round allows seven valid guesses and reports whether each guess is too high or too low.

The program validates numeric input without charging invalid attempts, stores each round's guess history in an array, and tracks wins, average attempts, and a separate best winning record for each difficulty in dictionaries. Players can continue for multiple rounds and inspect a session summary.

```sh
julia number-guessing-game/number_guessing_game.jl
```

Choose a difficulty number, enter guesses in range, and answer `y` or `n` when prompted to continue. The game expects an active interactive input stream. Histories and records live in memory and reset on restart; no save file is created.

The seven-attempt limit is fixed across difficulties. In the 1–500 range it cannot guarantee success even with an optimal narrowing strategy. Difficulty selection is derived from the length of the difficulty table so adding a new range does not require changing its numeric input bound.
