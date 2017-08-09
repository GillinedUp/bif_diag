using Match
using Plots

include("include.jl")
include("source_da.jl")
include("source_nan.jl")
include("tools.jl")

function run()
  print(
    "Type one of the following letters to choose desired function:\n"*
    "a: use algorithm based on arrays of arrays\n"*
    "b: use algorithm based on NaN feature\n"*
    "c: compare calculation speed of both algorithms\n"
  )
  arr = read(STDIN, 1)
  c = Char(arr[1])

  println("Type desired precision value (it's strongly advised to give at least "*
  "1000 and multiplier of 1000):")
  line = readline(STDIN)
  line = readline(STDIN)
  p = parse(Int64, line)

  @match c begin
    'a' => x,y = calc_bif_da(0.5, p, 2.75)
    'b' => x,y = calc_bif_nan(0.5, p, 2.75)
    'c' => time_calc_bif(0.5,p)
    _ => println("Got unknown value")
  end
  if !isequal(c, 'c') && !isequal(c, 'e')
    pyplot()
    verts = [(0, 0.1), (0, 0)]
    scatter(x, y, marker = (Shape(verts), 1, RGBA(0,0,0,0)), markercolor = :blue, leg = false)
  end
end
