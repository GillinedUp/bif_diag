using Plots
include("source_nan.jl")
pyplot()
x,y = calc_bif_nan_exp(0.5, 3000)
verts = [(0, 0.5), (0, 0)]
scatter(x, y, marker = (Shape(verts), 1, RGBA(0,0,0,0)), markercolor = :black, leg = false)

# scatter(x, y, legend = false, markersize = 2, markercolor = :black)
