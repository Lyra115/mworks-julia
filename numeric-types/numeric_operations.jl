function main()
    # Compare numeric representations and arithmetic in Julia.
     
    # 1. 读取两个整数
    println("请输入两个整数 a b (空格分隔)：")
    a, b = parse.(Int64, split(readline()))
     
    # 2. 读取两个浮点数
    println("请输入两个浮点数 c d (空格分隔)：")
    c, d = parse.(Float64, split(readline()))
     
    # 3. 读取两个复数（各输入实部与虚部）
    println("请输入复数1的实部 虚部：")
    e_re, e_im = parse.(Float64, split(readline()))
    println("请输入复数2的实部 虚部：")
    f_re, f_im = parse.(Float64, split(readline()))
    e = complex(e_re, e_im)
    f = complex(f_re, f_im)
     
    # 4. 读取两个有理数（各输入分子与分母）
    println("请输入有理数1的分子 分母：")
    g_n, g_d = parse.(Int64, split(readline()))
    println("请输入有理数2的分子 分母：")
    h_n, h_d = parse.(Int64, split(readline()))
    g = g_n // g_d
    h = h_n // h_d
     
    println("\n===== 整数运算 =====")
    println("a + b = ", a + b)
    println("a - b = ", a - b)
    println("a * b = ", a * b)
    println("a / b = ", a / b)
    println("a % b = ", a % b)
     
    println("\n===== 浮点数运算 =====")
    println("c + d = ", c + d)
    println("c - d = ", c - d)
    println("c * d = ", c * d)
    println("c / d = ", c / d)
    println("c % d = ", c % d)
     
    println("\n===== 复数运算 =====")
    println("e + f = ", e + f)
    println("e - f = ", e - f)
    println("e * f = ", e * f)
    println("e / f = ", e / f)
     
    println("\n===== 有理数运算 =====")
    println("g + h = ", g + h)
    println("g - h = ", g - h)
    println("g * h = ", g * h)
    println("g / h = ", g / h)
     
    println("\n===== 特殊取余测试 =====")
    println("-10 % 3 = ", -10 % 3)
    println("10 % -3 = ", 10 % -3)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
