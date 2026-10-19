# Validation Results

Verified locally on 19 October 2026 using the MWORKS-provided Julia 1.10.10 runtime on Windows.

## Automated checks

All **39 assertions passed** across six test sets: column normalization (5), neighbor updates (7), character mentions (12), word analysis (8), game input validation (3), and numeric representations (4).

## Script runs

- Numeric explorer: completed with integers 10 and 3, floats 5.5 and 2.2, complex values 1+2im and 3-1im, and rationals 1//2 and 1//3.
- Both matrix scripts: completed their built-in demonstrations.
- English analyzer: completed with the built-in sample text.
- Guessing game: completed a scripted session including invalid difficulty input, one round, and exit. Random secret values are not fixed, so exact guess outcomes vary.
- Character analyzer: completed on both full supplied corpus files.
- Both corpus byte lengths and SHA-256 hashes match the supplied originals.

## Corpus results

| Character | Gutenberg corpus | Alternate corpus |
| --- | ---: | ---: |
| 唐僧 | 2399 | 2545 |
| 孙悟空 | 4759 | 4974 |
| 猪八戒 | 2173 | 2296 |
| 沙僧 | 892 | 938 |

These totals use non-overlapping configured aliases, include the entire supplied text, and are not semantic counts of character appearances. Raw alias details remain available in the program output.

## Limits of verification

The checks cover ordinary finite numeric inputs and the documented matrix boundaries. They do not establish behavior for every custom array implementation, malformed interactive input sequence, or alternative Julia version. The text difficulty thresholds are heuristic and have not been calibrated against a labeled readability dataset.
