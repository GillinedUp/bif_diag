function calc_max(x_a, p)
  λ_arr = collect(linspace(0.0, 4.0, p))
  iter_const = 100
  ϵ = 1e-6
  x_arr = Array{Array{Float64, 1}, 1}(p)
  y_arr = Array{Array{Float64, 1}, 1}(p)
  max = 0
  for j = 1:p
    λ = λ_arr[j]
    x = x_a
    x_arr[j] = Array{Float64, 1}(0)
    y_arr[j] = Array{Float64, 1}(0)
    for i = 1:iter_const
      x = λ*x*(1-x)
    end
    while(true)
      bool_arr = map(y -> almost_equal(x, y, ϵ), y_arr[j]) # check if we already added that point
      if !in(true, bool_arr) # if not
        push!(y_arr[j], x) # add it to the array
        x = λ*x*(1-x) # iterate once more
      else
        break # else break from the while loop
      end
    end
    push!(x_arr[j], λ)
    max = (length(y_arr[j]) > max ? length(y_arr[j]) : max)
  end
  return max
end

function find_eq(k)
  x_a = 0.5
  arr = Vector{Int64}(k)
  for i = 1:k
    arr[i] = calc_max(x_a, i*1000)
  end
  return arr
end
