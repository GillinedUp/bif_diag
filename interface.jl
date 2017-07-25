include("source.jl")
pyplot()
x,y = calc_bif(0.5, 1000)
scatter(x, y, color = :black)
