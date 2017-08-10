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

  println("Type desired precision value:")
  line = readline(STDIN)
  line = readline(STDIN)
  p = parse(Int64, line)

  @match c begin
    'a' => x,y = calcarr(0.5, p, 2.75)
    'b' => x,y = calcnan(0.5, p, 2.75)
    'c' => timecalc(0.5, p)
    'd' => x,y,a = calcnan_anim(0.5, p, 0.0, 2.75)
    _ => println("Got unknown value")
  end
  if !isequal(c, 'c') && !isequal(c, 'd')
    pyplot()
    verts = [(0, 0.1), (0, 0)]
    scatter(x, y, marker = (Shape(verts), 1, RGBA(0,0,0,0)), leg = false)
  end
end
