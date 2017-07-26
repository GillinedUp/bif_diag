using StatPlots
include("source_nan.jl")
gr()
x,y = calc_bif_nan(0.5, 1000)
scatter(x, y, legend = false, markersize = 2, markercolor = :black)

# using StatPlots
# precision = 3000
# b = Matrix{Float64}(3, 3)
# fill!(b, NaN)
# b[1, 1] = 1.5
# b[2, 1] = 1.6
# b[2, 2] = 1.7
# b[3, 1] = 1.0
# a = [0.0, 0.5, 1.0]
# gr()
# scatter(a, b, legend = false, markersize = 2, markercolor = :black)


# using DataFrames
# using DataFramesMeta
# using StatPlots
# precision = 3000
# b = Matrix{Float64}(3, 3)
# df = DataFrame(fill!(b, NaN))
# df[1, 1] = 1.5
# df[2, 1] = 1.6
# df[2, 2] = 1.7
# df[3, 1] = 1.0
# a = [0.0, 0.5, 1.0]
# df[:a] = a
# @with(df, scatter(:a, [:x1 :x2 :x3]))
