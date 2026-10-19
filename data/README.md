# Text corpora

The two supplied UTF-8 files are retained byte-for-byte under descriptive filenames. They are different editions and must not be treated as interchangeable datasets.

| File | Identification from the file itself |
| --- | --- |
| `journey_to_the_west_gutenberg.txt` | Project Gutenberg eBook of 西遊記; retains the supplied header, footer, and license text |
| `journey_to_the_west_alternate.txt` | Supplied alternate text; front matter identifies 吴承恩, 黄肃秋注释, 李洪甫校订, 人民文学出版社, ISBN 978-7-02-000873-5 |

`checksums.json` records the original byte lengths and SHA-256 hashes. The corpus files retain their embedded attribution and edition notices. No repository-wide license is applied to these third-party texts.

The character analyzer defaults to the Gutenberg file and accepts another path as its first argument. It scans the entire supplied file, including front matter and notices. Traditional/simplified forms, punctuation, editorial matter, and configured aliases can change the results. Counts are corpus-specific keyword counts, not definitive counts of character appearances.

```sh
julia text-analysis/character_mentions.jl data/journey_to_the_west_alternate.txt
```
