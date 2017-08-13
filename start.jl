using Match
using Plots

include("include.jl")
include("source_da.jl")
include("source_nan.jl")
include("tools.jl")

function plotdiag(x, y)
  pyplot()
  verts = [(0, 0.1), (0, 0)]
  scatter(x, y, marker = (Shape(verts), 1, RGBA(0,0,0,0)), leg = false)
end

function run()
  print(
    "Type one of the following letters to choose desired function:\n"*
    "a: use algorithm based on arrays of arrays\n"*
    "b: use algorithm based on NaN feature (can run in parallel on multi-core processors)\n"*
    "c: compare calculation speed of both algorithms\n"
  )
  arr = read(STDIN, 1)
  c = Char(arr[1])

  println("Type desired precision value:")
  nl = readline(STDIN)
  line = readline(STDIN)
  p = parse(Int64, line)

  @match c begin
    'a' => begin x,y = calcarr(0.5, p, 2.75); plotdiag(x, y) end
    'b' => begin x,y = calcnan(0.5, p, 2.75); plotdiag(x, y) end
    'c' => timecalc(0.5, p)
    _ => println("Got unknown value")
  end
end
