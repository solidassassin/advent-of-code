module AOC

import HTTP
import Dates

export get_input

const token = ENV["AOC_TOKEN"]

td = Dates.today()
current_day = td |> Dates.day
current_year = td |> Dates.year
files = last.(walkdir("data"))[1]

function save(content::String, day::Int)
	open("data/$day.txt", "w") do io
		write(io, content)
	end
	content
end

function read_content(day::Int)
	open("data/$day.txt") do io
		read(io, String)
	end
end

function get_input(; day::Int=current_day, year::Int=current_year)
	if "$day.txt" in files
		return read_content(day)
	end
	r = HTTP.get(
		"https://adventofcode.com/$year/day/$day/input",
		cookies=Dict("session" => token)
	)
	save(r.body |> String, day)
end

end
