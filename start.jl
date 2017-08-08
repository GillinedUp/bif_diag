using Plots
include("include.jl")
include("source_da.jl")
include("source_nan.jl")
include("tools.jl")

print(
  "Type one of the following letters to choose desired function:\n
  a: use algorithm based on arrays of arrays\n
  b: use algorithm based on NaN feature\n
  c: compare calculation speed of both algorithms\n"
)
read!(STDIN, c)

println("Type desired precision value (it's strongly advised to give at least 1000 and multiplier of 1000):")
read!(STDIN, p)

@match c begin
  'a' => x,y = calc_bif_da(0.5,p)
  'b' => x,y = calc_bif_nan(0.5,p)
  'c' => time_calc_bif(0.5,p)
end
if !isequal(c, 'a')
  pyplot()
  verts = [(0, 0.5), (0, 0)]
  scatter(x, y, marker = (Shape(verts), 1, RGBA(0,0,0,0)), markercolor = :black, leg = false)
end
