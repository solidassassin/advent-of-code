include("../aoc.jl")

import .AOC

data = parse.(Int, split(AOC.get_input() |> strip, "\n")) |> Set

function first()
    for i=data
        j = 2020 - i
        if j in data
            return i * j
        end
    end
end

function second()
    for (a, b, c) = Iterators.product(data, data, data)
        if a + b + c == 2020
            return a * b * c
        end
    end
end

first() |> println
second() |> println
