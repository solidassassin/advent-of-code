include("../aoc.jl")

import .AOC

data = split(AOC.get_input(day=6) |> strip, "\n\n")

# Part 1
replace.(data, "\n" => "") .|> Set .|> length |> sum |> println

# Part 2
yes(x) = intersect(x...) |> length
split.(data, "\n") .|> yes |> sum |> println
