using Plots
include("source_da.jl")
pyplot()
x,y = calc_bif_da(0.5, 1000)
verts = [(0, 0.5), (0, 0)]
scatter(x, y, marker = (Shape(verts), 1, RGBA(0,0,0,0)), markercolor = :black, leg = false)
