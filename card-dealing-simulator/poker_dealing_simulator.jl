using Random

const Card = Tuple{String,String,Int}
const SUITS = ("♠", "♥", "♣", "♦")
const RANKS = ("3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A", "2")
const SMALL_JOKER = ("", "Small Joker", 14)
const BIG_JOKER = ("", "Big Joker", 15)

"""Build a standard 54-card deck with a numeric rank for sorting."""
function generate_deck()
    deck = Card[]
    for (strength, rank) in enumerate(RANKS)
        for suit in SUITS
            push!(deck, (suit, rank, strength))
        end
    end
    push!(deck, SMALL_JOKER, BIG_JOKER)
    return deck
end

card_label(card::Card) = card[1] * card[2]

"""Shuffle a deck in place using the Fisher-Yates algorithm."""
function shuffle_deck!(deck::Vector{Card}; rng=Random.default_rng())
    for i in 1:(length(deck) - 1)
        j = rand(rng, i:length(deck))
        deck[i], deck[j] = deck[j], deck[i]
    end
    return deck
end

"""Deal 17 cards to each of three players and reserve three bottom cards."""
function deal_cards(deck::Vector{Card})
    length(deck) == 54 || throw(ArgumentError("A complete deck must contain 54 cards."))
    return deck[1:3:51], deck[2:3:51], deck[3:3:51], deck[52:54]
end

sort_hand(hand) = sort(hand, by=card -> (-card[3], card[1]))

"""Check that a deal contains every deck card exactly once."""
function verify_deal(deck, hands_and_bottom...)
    dealt = reduce(vcat, hands_and_bottom; init=Card[])
    return (
        deck_is_unique = length(Set(deck)) == length(deck),
        deal_has_no_duplicates = length(Set(dealt)) == length(dealt),
        deal_matches_deck = Set(dealt) == Set(deck) && length(dealt) == length(deck),
    )
end

function rank_counts(hand)
    counts = Dict{String,Int}()
    for card in hand
        counts[card[2]] = get(counts, card[2], 0) + 1
    end
    return counts
end

function hand_patterns(hand)
    counts = rank_counts(hand)
    order = reverse(RANKS)
    return (
        bombs = [rank for rank in order if get(counts, rank, 0) == 4],
        triples = [rank for rank in order if get(counts, rank, 0) == 3],
        pairs = [rank for rank in order if get(counts, rank, 0) == 2],
        rocket = SMALL_JOKER in hand && BIG_JOKER in hand,
    )
end

format_ranks(ranks) = isempty(ranks) ? "none" : join(ranks, ", ")

function print_hand(label, hand)
    println("--- $label ($(length(hand)) cards) ---")
    println(join(card_label.(sort_hand(hand)), "  "))
end

function main(; rng=Random.default_rng())
    deck = generate_deck()
    println("Three-player poker deal")
    println("Deck size: $(length(deck)) cards")
    shuffle_deck!(deck; rng)

    player1, player2, player3, bottom = deal_cards(deck)
    players = ["Player 1", "Player 2", "Player 3"]
    hands = Dict(players[1] => player1, players[2] => player2, players[3] => player3)

    foreach(name -> print_hand(name, hands[name]), players)
    print_hand("Bottom cards", bottom)

    checks = verify_deal(deck, player1, player2, player3, bottom)
    println("Deck unique: $(checks.deck_is_unique)")
    println("Deal has no duplicates: $(checks.deal_has_no_duplicates)")
    println("Deal matches deck: $(checks.deal_matches_deck)")

    landlord = rand(rng, players)
    append!(hands[landlord], bottom)
    print_hand("$landlord (landlord)", hands[landlord])

    for name in players
        patterns = hand_patterns(hands[name])
        println("$name patterns: bombs=$(format_ranks(patterns.bombs)), ",
                "triples=$(format_ranks(patterns.triples)), ",
                "pairs=$(format_ranks(patterns.pairs)), rocket=$(patterns.rocket)")
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
