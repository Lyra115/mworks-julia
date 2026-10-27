using Test

module PrimeTool
include(joinpath(@__DIR__, "..", "prime-number-tool", "prime_number_tool.jl"))
end
module Narcissistic
include(joinpath(@__DIR__, "..", "narcissistic-numbers", "narcissistic_numbers.jl"))
end
module SelectionSort
include(joinpath(@__DIR__, "..", "descending-selection-sort", "selection_sort_descending.jl"))
end
module ExpressionCalculator
include(joinpath(@__DIR__, "..", "expression-calculator", "expression_calculator.jl"))
end
module LineFit
include(joinpath(@__DIR__, "..", "minimum-distance-line-fit", "minimum_distance_line.jl"))
end

module MatrixTools
include(joinpath(@__DIR__, "..", "matrix-processing", "column_normalization.jl"))
include(joinpath(@__DIR__, "..", "matrix-processing", "neighbor_average_update.jl"))
end
module Characters
include(joinpath(@__DIR__, "..", "text-analysis", "character_mentions.jl"))
end
module Words
include(joinpath(@__DIR__, "..", "text-analysis", "word_frequency.jl"))
end
module Game
include(joinpath(@__DIR__, "..", "number-guessing-game", "number_guessing_game.jl"))
end
module Numeric
include(joinpath(@__DIR__, "..", "numeric-types", "numeric_operations.jl"))
end
module Poker
include(joinpath(@__DIR__, "..", "card-dealing-simulator", "poker_dealing_simulator.jl"))
end
module RockPaperScissors
include(joinpath(@__DIR__, "..", "rock-paper-scissors", "rock_paper_scissors_simulation.jl"))
end

@testset "Column normalization" begin
    a = [1.0 9.0; 3.0 9.0; 5.0 9.0]
    @test MatrixTools.normalize_matrix!(a) === a
    @test a == [0.0 0.0; 0.5 0.0; 1.0 0.0]
    @test size(MatrixTools.normalize_matrix!(zeros(0, 2))) == (0, 2)
    @test MatrixTools.normalize_matrix!(fill(3.0, 1, 2)) == zeros(1, 2)
    @test_throws MethodError MatrixTools.normalize_matrix!([1 2; 3 4])
end

@testset "Neighbor updates" begin
    a = [1 2; 3 4]
    before = copy(a)
    @test MatrixTools.neighbor_average_update(a) == [3.5 4.5; 5.5 6.5]
    @test a == before
    @test MatrixTools.neighbor_average_update(reshape([7], 1, 1)) == fill(7.0, 1, 1)
    @test MatrixTools.neighbor_average_update([1 2 3]) == [3.0 4.0 5.0]
    @test MatrixTools.neighbor_average_update(reshape([1, 2, 3], 3, 1)) == reshape([3.0, 4.0, 5.0], 3, 1)
    @test size(MatrixTools.neighbor_average_update(zeros(0, 3))) == (0, 3)
    x = reshape(1:9, 3, 3)
    @test MatrixTools.neighbor_average_update(x)[2, 2] == 10.0
end

@testset "Character mentions" begin
    total, detail = Characters.count_character("孙行者和行者", ["孙行者", "行者"])
    @test total == 2
    @test sum(values(detail)) == 3
    @test first(Characters.count_character("孫悟空與孙悟空", ["孫悟空", "孙悟空"])) == 2
    @test first(Characters.count_character("无匹配", ["唐僧"])) == 0
    @test first(Characters.count_character("文本", String[])) == 0
    @test_throws ArgumentError Characters.count_character("文本", [".*"])
    for name in ("journey_to_the_west_gutenberg.txt", "journey_to_the_west_alternate.txt")
        text = Characters.load_text(joinpath(@__DIR__, "..", "data", name))
        @test isvalid(text)
        @test length(text) > 100000
        @test first(Characters.count_character(text, ["三藏"])) > 0
    end
end

@testset "Word analysis" begin
    @test Words.preprocess("High-level, DON'T! 123") == ["high", "level", "dont"]
    @test Words.count_words(["a", "b", "a"]) == Dict("a" => 2, "b" => 1)
    @test Words.difficulty_level(5.5, 0.0) == "困难"
    @test Words.difficulty_level(1.0, 0.30) == "困难"
    @test Words.difficulty_level(4.5, 0.0) == "中等"
    @test Words.difficulty_level(1.0, 0.15) == "中等"
    @test Words.difficulty_level(2.0, 0.0) == "简单"
    @test isempty(Words.preprocess("123 !!!"))
end

@testset "Game input validation" begin
    mktemp() do path, io
        write(io, "abc\n0\n51\n25\n"); seekstart(io)
        answer = redirect_stdin(io) do
            Game.read_int("", 1, 50)
        end
        @test answer == 25
    end
    @test length(Game.LEVELS) == 3
    @test Game.MAX_TRIES == 7
end

@testset "Numeric representations" begin
    @test -10 % 3 == -1
    @test 10 % -3 == 1
    @test 1//2 + 1//3 == 5//6
    @test (1+2im) * (3-1im) == 5+5im
end

@testset "Card dealing simulator" begin
    deck = Poker.generate_deck()
    @test length(deck) == 54
    @test length(Set(deck)) == 54
    shuffled = copy(deck)
    Poker.shuffle_deck!(shuffled; rng=Poker.Random.MersenneTwister(42))
    @test Set(shuffled) == Set(deck)
    @test shuffled != deck

    p1, p2, p3, bottom = Poker.deal_cards(shuffled)
    @test (length(p1), length(p2), length(p3), length(bottom)) == (17, 17, 17, 3)
    checks = Poker.verify_deal(shuffled, p1, p2, p3, bottom)
    @test checks.deck_is_unique
    @test checks.deal_has_no_duplicates
    @test checks.deal_matches_deck
    @test_throws ArgumentError Poker.deal_cards(deck[1:53])
end

@testset "Rock-paper-scissors simulation" begin
    @test RockPaperScissors.round_result(:rock, :scissors) == :player
    @test RockPaperScissors.round_result(:paper, :scissors) == :computer
    @test RockPaperScissors.round_result(:paper, :paper) == :draw
    stats = RockPaperScissors.simulate_games(1_000; rng=RockPaperScissors.Random.MersenneTwister(7))
    @test stats.player_wins + stats.computer_wins + stats.draws == 1_000
    @test_throws ArgumentError RockPaperScissors.simulate_games(-1)
    @test_throws ArgumentError RockPaperScissors.round_result(:lizard, :rock)
end

@testset "Prime number tool" begin
    @test PrimeTool.is_prime(2)
    @test PrimeTool.is_prime(97)
    @test PrimeTool.is_prime(1_000_000_007)
    @test !PrimeTool.is_prime(-7)
    @test !PrimeTool.is_prime(100)
    @test PrimeTool.primes_up_to(10) == [2, 3, 5, 7]
    @test isempty(PrimeTool.primes_up_to(1))
end

@testset "Narcissistic numbers" begin
    @test Narcissistic.is_narcissistic_number(153)
    @test !Narcissistic.is_narcissistic_number(154)
    @test !Narcissistic.is_narcissistic_number(-153)
    @test Narcissistic.find_narcissistic_numbers() == [153, 370, 371, 407]
    @test Narcissistic.narcissistic_equation(153) == "153 = 1^3 + 5^3 + 3^3"
end

@testset "Descending selection sort" begin
    values = [64, 25, 12, 22, 11, 90, 3, 47]
    @test SelectionSort.selection_sort_descending(values) == [90, 64, 47, 25, 22, 12, 11, 3]
    @test values == [64, 25, 12, 22, 11, 90, 3, 47]
    @test SelectionSort.selection_sort_descending(1:6) == [6, 5, 4, 3, 2, 1]
    @test SelectionSort.selection_sort_descending(["banana", "apple", "cherry"]) == ["cherry", "banana", "apple"]
    @test isempty(SelectionSort.selection_sort_descending(Int[]))
end

@testset "Expression calculator" begin
    @test ExpressionCalculator.calculate_expression("112 + 3") == "115"
    @test ExpressionCalculator.calculate_expression("7 / 2") == "3.5"
    @test ExpressionCalculator.calculate_expression("17 % 5") == "2"
    @test ExpressionCalculator.calculate_expression("2 ^ 10") == "1024"
    @test startswith(ExpressionCalculator.calculate_expression("5 / 0"), "Error:")
    @test startswith(ExpressionCalculator.calculate_expression("abc"), "Error:")
    @test startswith(ExpressionCalculator.calculate_expression("1e309 + 1"), "Error:")
end

@testset "Minimum-distance line fit" begin
    points = [(Float64(i), 2.0 * i + 1) for i in 0:5]
    fit = LineFit.best_fit_line(points)
    @test fit.total_distance ≈ 0 atol=1e-9
    @test fit.slope ≈ 2.0 atol=1e-9
    @test fit.intercept ≈ 1.0 atol=1e-9

    vertical = [(3.0, y) for y in (-2.0, 0.0, 5.0, 9.0)]
    vertical_fit = LineFit.best_fit_line(vertical)
    @test vertical_fit.total_distance ≈ 0 atol=1e-9
    @test vertical_fit.slope === nothing
    @test LineFit.equation_string(vertical_fit) == "x = 3.0000"

    outlier_points = [(Float64(i), 2.0 * i + 1) for i in 0:9]
    push!(outlier_points, (10.0, 40.0))
    robust_fit = LineFit.best_fit_line(outlier_points)
    slope, intercept = LineFit.least_squares_line(outlier_points)
    ls_theta = atan(1.0, -slope)
    ls_offset = intercept / sqrt(1 + slope^2)
    @test robust_fit.total_distance <= LineFit.total_distance(outlier_points, ls_theta, ls_offset) + 1e-9

    sampled_best = minimum(begin
        offset = LineFit.projection_median(outlier_points, theta)
        LineFit.total_distance(outlier_points, theta, offset)
    end for theta in range(0, π; length=2_001))
    @test robust_fit.total_distance <= sampled_best + 1e-6
    @test_throws ArgumentError LineFit.best_fit_line([])
end
