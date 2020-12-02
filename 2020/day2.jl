include("../aoc.jl")

import .AOC

data = split(AOC.get_input() |> strip, "\n") .|> split

# This is an ugly one, but also quick
# Part 1
function process(x)
    st, en = parse.(Int, split(x[1], "-"))
    (st:en, x[2][1:end - 1], x[3])
end

processed = data .|> process
count(x -> count(x[2], x[3]) in x[1], processed) |> println

# Part 2
function part2(x)
    rng, letter, word = x
    (word[rng |> first] == letter[1]) ⊻ (word[rng |> last] == letter[1])
end

count(x -> x == true, processed .|> part2) |> println
