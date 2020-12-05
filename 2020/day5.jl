include("../aoc.jl")

import .AOC

data = replace.(
    replace.(
        split(AOC.get_input(day=5) |> strip, "\n"),
        r"(?:F|L)" => "0"),
    r"(?:B|R)" => "1"
)

# Part 1
ids = parse.(Int, data, base = 2)
max_id = ids |> maximum
max_id |> println

# Part 2
sort!(ids)

for (i, x) = zip(ids, ids[1]:max_id)
    if i != x
        x |> println
        break
    end
end
