# ===== 文本词频统计与分析（综合） =====
using Printf
 
# 内置示例文章
const DEFAULT_TEXT =
    "Learning to program is like learning a new language. " *
    "At first, every rule feels strange, and small mistakes " *
    "can stop the whole program. " *
    "However, with regular practice, the patterns become familiar. " *
    "A student who writes code every day will soon notice " *
    "real progress. " *
    "Good programmers read their errors carefully, test small pieces " *
    "of code, and ask questions when they are stuck. " *
    "Over time, they build useful habits that help them " *
    "solve bigger problems. " *
    "Patience is important, because nobody becomes an expert overnight."
 
# 预处理：转小写、去除标点、按空格分词
function preprocess(text::AbstractString)
    s = lowercase(text)
    s = replace(s, "-" => " ")            # 连字符当作分隔符
    s = replace(s, r"[^a-z\s]" => "")     # 删除所有非字母、非空白字符（标点、数字等）
    return String.(split(s))              # 按空白分词（自动忽略多余空格）
end
 
# 用字典统计每个单词出现的次数
function count_words(words::Vector{String})
    freq = Dict{String,Int}()
    for w in words
        freq[w] = get(freq, w, 0) + 1     # 不存在时默认 0，再加 1
    end
    return freq
end
 
# 根据平均词长和长词比例判定文本难度
function difficulty_level(avg_len, long_ratio)
    if avg_len >= 5.5 || long_ratio >= 0.30
        return "困难"
    elseif avg_len >= 4.5 || long_ratio >= 0.15
        return "中等"
    else
        return "简单"
    end
end
 
function analyze_text(text::AbstractString)
    words = preprocess(text)
    if isempty(words)
        println("文本中没有有效的英文单词。")
        return
    end
 
    freq = count_words(words)
    total = length(words)                          # 总单词数
    distinct = length(freq)                        # 不同单词数
    avg_len = sum(length, words) / total           # 平均词长
    long_count = count(w -> length(w) > 6, words)  # 长词（>6 个字母）个数
    long_ratio = long_count / total
 
    # 先按次数从高到低，次数相同再按字母顺序，保证结果确定
    ranked = sort(collect(freq), by = p -> (-p.second, p.first))
    top = ranked[1:min(10, length(ranked))]
 
    maxlen = maximum(length, keys(freq))
    minlen = minimum(length, keys(freq))
    longest = sort([w for w in keys(freq) if length(w) == maxlen])
    shortest = sort([w for w in keys(freq) if length(w) == minlen])
 
    println("========== 文本词频统计与分析结果 ==========")
    println("出现频率最高的前 10 个单词：")
    for (rank, (w, c)) in enumerate(top)
        println("  ", lpad(rank, 2), ". ", rpad(w, 14), c, " 次")
    end
    println()
    println("总单词数：", total)
    println("不同单词数：", distinct)
    @printf("平均词长：%.2f 个字母\n", avg_len)
    pct = long_ratio * 100
    @printf("长词（>6 个字母）：%d 个，占比 %.1f%%\n", long_count, pct)
    println("最长的单词（", maxlen, " 个字母）：", join(longest, ", "))
    println("最短的单词（", minlen, " 个字母）：", join(shortest, ", "))
    println("文本难度判定：", difficulty_level(avg_len, long_ratio))
end
 
function main()
    println("请输入一段英文文本（直接按回车则使用内置示例文章）：")
    line = readline()
    text = isempty(strip(line)) ? DEFAULT_TEXT : line
    analyze_text(text)
end
 
if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
