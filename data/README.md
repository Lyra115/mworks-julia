# Text Corpora / 文本语料

两个 UTF-8 文本文件保留原始字节内容，来自不同版本，分析时不能视为同一数据集。

The UTF-8 corpus files are preserved byte-for-byte. They represent different editions and are not interchangeable datasets.

| File / 文件 | Identification / 来源信息 |
| --- | --- |
| `journey_to_the_west_gutenberg.txt` | Project Gutenberg eBook of 西遊記, including its supplied notices / 古登堡计划《西游记》文本，保留原有说明 |
| `journey_to_the_west_alternate.txt` | Alternate edition with attribution and publication data in its front matter / 卷首列有作者、注释、校订及出版信息的另一版本 |

`checksums.json` records original byte lengths and SHA-256 values. No repository-wide license is applied to these third-party texts.

`checksums.json`记录原始字节长度和 SHA-256 值。仓库未为这些第三方文本声明整体许可。

The character analyzer defaults to the Gutenberg file and accepts another path as its first argument. It scans the whole file, including front matter and notices. Counts are configured keyword matches, not semantic counts of character appearances.

人物关键词分析器默认读取 Gutenberg 文件，也可将另一文件路径作为第一个参数。程序扫描完整文本；统计值表示配置的关键词匹配次数，不代表语义层面的角色出现次数。

```sh
julia text-analysis/character_mentions.jl data/journey_to_the_west_alternate.txt
```
