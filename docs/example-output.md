# Example Output / 输出样例

以下是项目输出的主要形式。随机洗牌、地主选择与游戏模拟每次可能产生不同数值；下面的测试使用固定随机数生成器验证可复现结果。

The snippets below describe representative output. Shuffle order, landlord selection, and simulation totals can vary between runs; tests inject a seeded random generator when reproducibility is needed.

## Card dealing / 扑克牌发牌

程序显示每位玩家的 17 张手牌与 3 张底牌，并检查牌堆是否唯一、发牌是否重复以及发牌集合是否与原牌堆一致。

The program displays 17 cards per player and the three bottom cards, then reports whether the deck is unique, the deal contains no duplicates, and the dealt set matches the original deck.

```text
Three-player poker deal
Deck size: 54 cards
--- Player 1 (17 cards) ---
...
Deck unique: true
Deal has no duplicates: true
Deal matches deck: true
--- Player 2 (landlord) (20 cards) ---
...
```

## Rock-paper-scissors / 石头剪刀布

程序汇总玩家胜场、电脑胜场和平局数量及各自比例。随机独立出拳时，理论上三种结果的概率都约为三分之一。

The program reports player wins, computer wins, draws, and their percentages. With independent uniform choices, each outcome has a theoretical probability of about one third.

```text
Random rock-paper-scissors simulation (10000 rounds)
Player wins: ...
Computer wins: ...
Draws: ...
Expected distribution for uniformly random choices: about one third per outcome.
```

Existing text-analysis examples remain available in the code and tests. Corpus counts depend on the selected edition and configured aliases; see [validation results](validation.md) for the recorded figures.

代码及测试中保留文本分析输出样例。语料统计受版本和别名配置影响；记录结果见[验证说明](validation.md)。
