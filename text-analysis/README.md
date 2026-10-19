# Text Analysis

Two separate console programs explore different text-processing tasks.

## Character mentions

`character_mentions.jl` reads a UTF-8 corpus and reports configured aliases for 唐僧, 孙悟空, 猪八戒, and 沙僧. It supports both supplied corpora and selected traditional/simplified name variants.

Raw counts are shown for each alias. A separate longest-first, non-overlapping total avoids counting a long alias again as a nested short alias, such as 孙行者 and 行者 at the same location. It does not identify pronouns or disambiguate generic names. Only the configured forms are recognized.

```sh
julia text-analysis/character_mentions.jl
julia text-analysis/character_mentions.jl data/journey_to_the_west_alternate.txt
```

The default path is resolved relative to the script, so it works independently of the active working directory. Existing corpus files are used directly; there is no implicit download or dependency on a private desktop path.

## English word frequency

`word_frequency.jl` accepts one line of English text, or an empty line to analyze its built-in example. It reports the ten most frequent words, total and distinct counts, average length, long-word ratio, longest/shortest words, and a heuristic difficulty label.

Preprocessing lowercases ASCII English letters, replaces hyphens with spaces, deletes other non-letter/non-whitespace characters, and splits on whitespace. Thus `high-level` becomes two tokens and `don't` becomes `dont`. Stop words are retained; this is not a general multilingual tokenizer.

Words are ordered by descending count, then alphabetically for repeatable ties. Long words contain more than six letters. Difficulty is difficult if average length is at least 5.5 **or** long-word ratio is at least 30%; otherwise medium at 4.5 or 15%; otherwise easy. These thresholds are illustrative, not a validated readability score.

```sh
julia text-analysis/word_frequency.jl
```

The dictionary counting pass is linear in token count; ranking `v` distinct words takes O(v log v) comparisons, excluding string comparison costs. Corpus character analysis scans the full input for each configured alias; its cost grows with both corpus size and the alias set.
