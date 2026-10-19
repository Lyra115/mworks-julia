# ===== 猜数字游戏（多难度版） =====
# 功能：难度选择、最多 7 次机会、记录猜测历史、纪录判定、多轮游戏、胜率与平均猜测次数
using Printf
 
# 难度表：(名称, 数字上限)
const LEVELS = [("简单", 50), ("中等", 100), ("困难", 500)]
const MAX_TRIES = 7
 
# 读取一个落在 [lo, hi] 内的整数；输入不合法就反复提示，直到合法为止
function read_int(prompt::String, lo::Int, hi::Int)
    while true
        print(prompt)
        flush(stdout)
        n = tryparse(Int, strip(readline()))    # 非数字时返回 nothing，不会报错
        if n !== nothing && lo <= n <= hi
            return n
        end
        println("  输入无效，请输入 $(lo) 到 $(hi) 之间的整数！")
    end
end
 
# 显示难度菜单，返回所选难度 (名称, 上限)
function choose_level()
    println("请选择难度：")
    for (i, (name, upper)) in enumerate(LEVELS)
        println("  $(i). $(name)（1-$(upper)）")
    end
    idx = read_int("请输入难度编号（1-$(length(LEVELS))）：", 1, length(LEVELS))
    return LEVELS[idx]
end
 
# 进行一局游戏，返回 (是否获胜, 用了几次, 本局猜测历史)
function play_round(upper::Int)
    secret = rand(1:upper)            # 随机生成答案
    history = Int[]                   # 用数组记录本局每次的猜测
    won = false
    for attempt in 1:MAX_TRIES
        guess = read_int("第 $(attempt)/$(MAX_TRIES) 次猜测：", 1, upper)
        push!(history, guess)
        if guess > secret
            println("  太大了！")
        elseif guess < secret
            println("  太小了！")
        else
            won = true
            break                     # 猜对了，提前结束本局
        end
    end
    if !won
        println("  机会用完了，正确答案是 $(secret)。")
    end
    return won, length(history), history
end
 
# 询问是否再来一局
function ask_again()
    while true
        print("再来一局吗？(y/n)：")
        flush(stdout)
        ans = lowercase(strip(readline()))
        if ans in ("y", "yes")
            return true
        elseif ans in ("n", "no")
            return false
        end
        println("  请输入 y 或 n！")
    end
end
 
function main()
    println("========== 猜数字游戏（多难度版） ==========")
    best = Dict{String,Int}()              # 各难度的最佳纪录（最少猜测次数）
    all_history = Vector{Vector{Int}}()    # 保存每一局的猜测历史
    rounds = 0                             # 累计局数
    wins = 0                               # 获胜局数
    total_tries = 0                        # 累计猜测次数
 
    while true                             # 外层循环：多轮游戏
        name, upper = choose_level()
        println("已选择【$(name)】难度，范围 1-$(upper)，最多 $(MAX_TRIES) 次机会。")
        won, tries, history = play_round(upper)
 
        rounds += 1
        total_tries += tries
        push!(all_history, history)
 
        println("本局猜测历史：", history)
        println("本局共猜测 $(tries) 次。")
        if won
            wins += 1
            println("恭喜你，猜对了！")
            if !haskey(best, name)
                best[name] = tries
                println("这是【$(name)】难度的第一条纪录：$(tries) 次。")
            elseif tries < best[name]
                old = best[name]
                println("打破【$(name)】难度纪录！")
                println("原纪录 $(old) 次，现在是 $(tries) 次。")
                best[name] = tries
            else
                cur = best[name]
                println("未打破纪录（当前纪录：$(cur) 次）。")
            end
        else
            println("本局未获胜，无法刷新纪录。")
        end
 
        win_rate = wins / rounds * 100
        avg_tries = total_tries / rounds
        @printf("累计 %d 局，胜 %d 局，胜率 %.1f%%，平均每局猜测 %.2f 次\n",
                rounds, wins, win_rate, avg_tries)
        println()
 
        ask_again() || break
    end
 
    println()
    println("========== 游戏总结 ==========")
    for (i, h) in enumerate(all_history)
        println("第 $(i) 局猜测历史：", h)
    end
    if isempty(best)
        println("尚无纪录。")
    else
        println("各难度纪录（最少猜测次数）：")
        for (k, v) in best
            println("  $(k)：$(v) 次")
        end
    end
    println("感谢游玩，再见！")
end
 
if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
