# Implementation Decisions

## Numeric representations

The numeric explorer exposes the difference between approximate floating-point arithmetic and exact rational arithmetic. Explicit constructors and parsing keep the input representation visible. It demonstrates remainder semantics without presenting example values as a general numerical-accuracy benchmark.

## Text statistics

The English analyzer uses a dictionary for counts and an explicit secondary sort key for deterministic ties. Its input and tokenization are intentionally small: one console line, ASCII English words, no stop-word removal, and heuristic thresholds.

Character aliases can contain each other. Summing independent counts would count the same text span twice. The organized version retains raw alias diagnostics but uses longest-first regex alternatives for a non-overlapping total within each character's alias set. It includes selected traditional forms because the two corpora differ in script and edition. This remains keyword matching, with no semantic coreference resolution.

The original corpus script depended on a private absolute path and an undefined download helper. Reading an existing bundled file removes both dependencies; the source text remains unchanged and checksum-verifiable.

## Matrix transformations

Normalization uses column views and fused broadcast assignment. The original variable spelling prevented execution; the organized version uses consistent names and restricts mutation to floating-point storage. It handles empty columns explicitly.

Neighborhood transformation uses separate output storage, preserving the old values needed by later cells. A 1×1 matrix has no neighbors, so its value is retained rather than dividing by zero. Edge and corner formulas only include existing neighbors.

## Console state

The guessing game separates validation, difficulty selection, per-round play, and session aggregation. Invalid guesses do not consume attempts. Records are keyed by difficulty, avoiding comparisons between ranges with different search spaces. Statistics and histories remain session-local.

## Organization

Filenames describe behavior rather than sequence numbers. Interactive entry calls are guarded with `abspath(PROGRAM_FILE) == @__FILE__`, allowing functions to be included for tests without starting an input loop. The numeric program was recovered from the supplied technical material because no standalone numeric script was included.
