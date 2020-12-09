include("../aoc.jl")

using Combinatorics
import .AOC

data = parse.(Int, split(AOC.get_input() |> strip, "\n"))

# Part 1
function part1(nums::Array)
    for (i, n) in enumerate(nums[26:end])
        if n ∉ combinations(nums[i:i+24], 2) .|> sum
            return n
        end
    end
end

@time @show invalid = data |> part1

# Part 2
function part2(nums::Array, inv::Int)
    len = nums |> length
    for i in 1:len
        for x in (i + 1):len
            if nums[i:x] |> sum == inv
                s = nums[i:x] |> sort
                return s[1] + s[end]
            end
        end
    end
end

@time part2(data, invalid) |> println
