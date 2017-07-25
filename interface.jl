include("source.jl")
pyplot()
x,y = calc_bif(0.5, 2000)
verts = [(0.01, 0.01), (-0.01, 0.01), (-0.01, -0.01), (0.01, -0.01)]
scatter(x, y, color = :black, marker = (Shape(verts), 1, RGBA(0,0,0,0.2)), leg = false)
