# Three-Player Card Dealing Simulator / 三人扑克牌发牌模拟器

该控制台应用生成标准 54 张牌，通过 Fisher–Yates 算法原地洗牌，然后轮流为三位玩家各发 17 张，并保留 3 张底牌。程序随机选择一位地主并将底牌加入其手牌。

This console application builds a standard 54-card deck, shuffles it in place with Fisher–Yates, deals 17 cards to each of three players, and reserves three bottom cards. A randomly selected landlord receives the bottom cards.

## Implementation / 实现

单张牌使用 `(suit, rank, strength)` 元组表示；牌堆、玩家手牌和底牌使用数组，玩家映射与点数计数使用字典。程序按牌力降序显示手牌，并分析炸弹、三张、对子及王炸。

Each card is represented by a `(suit, rank, strength)` tuple. Arrays store the deck, hands, and bottom cards; dictionaries map players and count ranks. Hands are displayed by descending strength, and the program identifies four-of-a-kind, triples, pairs, and the two-joker combination.

发牌校验使用集合确认牌堆无重复、所有发出牌互不重复，且发牌结果与原始牌堆完全一致。洗牌和地主选择都支持注入随机数生成器，便于测试与复现。

Set-based checks confirm that the deck is unique, the deal contains no duplicate cards, and the deal exactly matches the original deck. Shuffle and landlord selection accept an injected random generator for testing and reproducibility.

## Run / 运行

```sh
julia card-dealing-simulator/poker_dealing_simulator.jl
```

无需第三方依赖。测试会检查 54 张牌、每位玩家与底牌的张数、洗牌后牌集完整性以及发牌无重复。

No third-party dependencies are required. Tests cover the 54-card deck, hand and bottom-card sizes, preservation of the deck through shuffling, and duplicate-free dealing.
