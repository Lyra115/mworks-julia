using Random

const CHOICES = (:rock, :paper, :scissors)

"""Return :draw, :player, or :computer for one round."""
function round_result(player::Symbol, computer::Symbol)
    player in CHOICES || throw(ArgumentError("Unknown player choice: $player"))
    computer in CHOICES || throw(ArgumentError("Unknown computer choice: $computer"))
    player == computer && return :draw

    player_wins = (player, computer) in ((:rock, :scissors), (:paper, :rock), (:scissors, :paper))
    return player_wins ? :player : :computer
end

"""Simulate independent random rounds and return aggregate counts."""
function simulate_games(rounds::Integer=10_000; rng=Random.default_rng())
    rounds >= 0 || throw(ArgumentError("The number of rounds cannot be negative."))
    player_wins = 0
    computer_wins = 0
    draws = 0

    for _ in 1:rounds
        result = round_result(rand(rng, CHOICES), rand(rng, CHOICES))
        if result == :player
            player_wins += 1
        elseif result == :computer
            computer_wins += 1
        else
            draws += 1
        end
    end

    return (rounds=rounds, player_wins=player_wins,
            computer_wins=computer_wins, draws=draws)
end

function main()
    stats = simulate_games()
    println("Random rock-paper-scissors simulation ($(stats.rounds) rounds)")
    for (label, count) in (("Player wins", stats.player_wins),
                           ("Computer wins", stats.computer_wins),
                           ("Draws", stats.draws))
        rate = stats.rounds == 0 ? 0.0 : 100 * count / stats.rounds
        println("$label: $count ($(round(rate; digits=2))%)")
    end
    println("Expected distribution for uniformly random choices: about one third per outcome.")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
