include("../aoc.jl")

import .AOC

data = split(AOC.get_input(day=4) |> strip, "\n\n")

# Part 1
required = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
allowed = filter(x -> contains.(x, required) |> all, data)
allowed |> length |> println

# Part 2
d = Dict("cm" => 150:193, "in" => 59:76)

function hgt(x)
    if match(r"\d{2,3}\w{2}", x) === nothing
        return false
    end
    parse(Int, x[1:end-2]) in d[x[end-1:end]]
end
byr(x) = parse(Int, x) in 1920:2020
iyr(x) = parse(Int, x) in 2010:2020
eyr(x) = parse(Int, x) in 2020:2030
hcl(x) = match(r"#(?:[0-9]|[a-f]){6}\b", x) !== nothing
ecl(x) = x in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
pid(x) = match(r"\b\d{9}\b", x) !== nothing

function validate(passport)
    parsed = split.(passport |> split, ':')
    ["$a(\"$b\")" |> Meta.parse |> eval for (a, b) = parsed if a in required] |> all
end

allowed .|> validate |> sum |> println

