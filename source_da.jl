function calc_bif_da(x_a::Float64, p::Int64)
  λ_arr = collect(linspace(0.0, 4.0, p))
  const iter_const = 10000
  const ϵ = 1e-6
  x_arr = Array{Array{Float64, 1}, 1}(p)
  y_arr = Array{Array{Float64, 1}, 1}(p)
  for j = 1:p
    λ = λ_arr[j]
    x = x_a
    x_arr[j] = Array{Float64, 1}(0)
    y_arr[j] = Array{Float64, 1}(0)
    for i = 1:iter_const
      x = λ*x*(1-x)
    end
    push!(y_arr[j], x)
    found = false
    while !found
      x = λ*x*(1-x) # iterate once more
      for y in y_arr[j]
        if almost_equal(x, y, ϵ)
          found = true
          break
        end
      end
      if !found
        push!(y_arr[j], x) # add it to the array
      end
    end
    push!(x_arr[j], λ)
  end
  return x_arr, y_arr
end
