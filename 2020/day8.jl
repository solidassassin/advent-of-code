include("../aoc.jl")

import .AOC

data = [
    (action = a, amount = parse(Int, b))
    for (a, b) = split(AOC.get_input(day=8) |> strip, "\n") .|> split
]

# Part 1
function part1(dt::Array, step::Int=1)
    dt_length = length(dt)
    total = 0
    isloop = false
    visited = []

    while step <= dt_length
        if step in visited
            isloop = true
            break
        end
        push!(visited, step)
        curr = dt[step]
        if curr.action == "nop"
            step += 1
        elseif curr.action == "jmp"
            step += curr.amount
        else
            total += curr.amount
            step += 1
        end
    end
    total, visited, isloop, step
end

# Was interesed with the execution time on this one
# Just ignore the time macros
@time data |> part1 |> first |> println

# Part 2
function part2(dt::Array, runner::Function)
    _, visited, _ = dt |> runner
    for i in visited
        dtcp = dt |> copy
        curr = dtcp[i]
        if curr.action != "acc"
            dtcp[i] = (
                action = curr.action == "nop" ? "jmp" : "nop",
                amount = curr.amount
            )
        end
        total, _, isloop = dtcp |> runner
        if !isloop
            return total
        end
    end
end

@time part2(data, part1) |> println
