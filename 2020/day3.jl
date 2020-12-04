include("../aoc.jl")

import .AOC

data = split(AOC.get_input(day=3) |> strip, "\n")
const processed = repeat.(data, ceil(Int, length(data) / length(data[1]) * 7))

# Part 1
function part1(x_slope, y_slope)
    trees = 0
    index = x_slope + 1
    for i = processed[1 + y_slope:y_slope:end]
        if i[index] == '#'
            trees += 1
        end
        index += x_slope
    end
    trees
end

part1(3, 1) |> println

# Part 2
x_slopes = (1, 3, 5, 7, 1)
y_slopes = (1, 1, 1, 1, 2)
*(part1.(x_slopes, y_slopes)...) |> println
