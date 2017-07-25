using Plots

function almost_equal(a, b, ϵ)
  return abs(a-b) <= ϵ
end

function calc_bif(x_a)
  λ_range = linspace(0.0, 4.0, 1000)
  iter_const = 1000
  ϵ = 1e-6
  x_arr = Array{Array{Float64, 1}, 1}(0)
  y_arr = Array{Array{Float64, 1}, 1}(0)
  for λ in λ_range
    x = x_a
    push!(x_arr, Array{Float64, 1}(0))
    push!(y_arr, Array{Float64, 1}(0))
    for i = 1:iter_const
      x = λ*x*(1-x)
    end
    while(true)
      bool_arr = map(y -> almost_equal(x, y, ϵ), y_arr[end]) # check if we already added that point
      if !in(true, bool_arr) # if not
        push!(y_arr[end], x) # add it to the array
        x = λ*x*(1-x) # iterate once more
      else
        break # else break from the while loop
      end
    end
    push!(x_arr[end], λ)
  end
  return x_arr, y_arr
end
