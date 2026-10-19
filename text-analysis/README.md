# Text Analysis / 文本分析

两个控制台程序分别处理中文人物关键词匹配与英文词频统计。

Two console programs handle Chinese character-name matching and English word-frequency analysis.

## Character mentions / 人物关键词

`character_mentions.jl`读取 UTF-8 语料，统计唐僧、孙悟空、猪八戒和沙僧的配置别名，支持两份语料及选定的简繁体形式。程序同时输出每个别名的原始计数，并用最长优先、非重叠匹配计算汇总，避免如“孙行者”和“行者”在同一位置重复计数。它不识别代词或消解通用名称，只匹配已配置形式。

`character_mentions.jl` reads a UTF-8 corpus and counts configured aliases for 唐僧, 孙悟空, 猪八戒, and 沙僧. It supports both supplied corpora and selected traditional/simplified forms. Raw counts are reported per alias; a separate longest-first, non-overlapping total avoids double-counting nested forms such as 孙行者 and 行者. Pronouns and generic names are not disambiguated.

```sh
julia text-analysis/character_mentions.jl
julia text-analysis/character_mentions.jl data/journey_to_the_west_alternate.txt
```

默认语料路径相对脚本解析，因此不受当前工作目录影响。程序直接读取仓库中的文件，不会隐式下载数据。

The default corpus path is resolved relative to the script, independent of the current working directory. The program reads bundled files directly and does not download data.

## English word frequency / 英文词频

`word_frequency.jl`读取一行英文文本；直接回车时分析内置样例。输出前十个高频词、总词数与不同词数、平均词长、长词比例、最长与最短词，以及启发式难度标签。

`word_frequency.jl` accepts one line of English text, or analyzes a built-in sample when the input is empty. It reports the top ten words, total and distinct counts, average word length, long-word ratio, longest and shortest words, and a heuristic difficulty label.

预处理将 ASCII 英文字母转为小写，把连字符替换为空格，并删除其他非字母、非空白字符后按空白拆词。因此 `high-level` 会变成两个词，`don't` 会变成 `dont`。停用词保留；这不是通用多语言分词器。

Preprocessing lowercases ASCII English letters, replaces hyphens with spaces, removes other non-letter/non-whitespace characters, and splits on whitespace. Thus `high-level` becomes two tokens and `don't` becomes `dont`. Stop words are retained; this is not a general multilingual tokenizer.

词语按词频降序、字母序排列以确保并列结果稳定。超过六个字母的词被视为长词；难度阈值是演示性启发规则，不是经过语料校准的可读性分数。

Words are ordered by descending count and then alphabetically for stable ties. Words longer than six letters are considered long. Difficulty thresholds are illustrative heuristics, not a corpus-calibrated readability score.

```sh
julia text-analysis/word_frequency.jl
```

词频统计在词数上为线性遍历；对 v 个不同词排序的比较复杂度约为 O(v log v)，不计字符串比较成本。人物分析会针对每个别名扫描完整输入。

Word counting uses a linear pass over tokens. Sorting v distinct words takes about O(v log v) comparisons, excluding string comparison costs. Character analysis scans the full input for each configured alias.
