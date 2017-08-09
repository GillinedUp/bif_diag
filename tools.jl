function calc_max(x_a::Float64, p::Int64)
  λ_arr = collect(linspace(0.0, 4.0, p))
  const iter_const = 50000
  const ϵ = 1e-6
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
    max = (length(y_arr[j]) > max ? length(y_arr[j]) : max)
  end
  return max
end

function find_eq(k::Int64)
  x_a = 0.5
  arr = Vector{Int64}(k)
  for i = 1:k
    arr[i] = calc_max(x_a, i*1000)
  end
  return arr
end

function time_calc_bif(x_a::Float64, p::Int64)
  x,y = calc_bif_da(x_a, p)
  println("Array of arrays:")
  @time calc_bif_da(x_a, p)
  x,y = calc_bif_nan(x_a, p)
  println("NaN:")
  @time calc_bif_nan(x_a, p)
end

function calc_bif_da_p(x_a::Float64, p::Int64)
  λ_arr = collect(linspace(0.0, 4.0, p))
  const iter_const = 50000
  const ϵ = 1e-6
  x_arr = Array{Array{Float64, 1}, 1}(p)
  y_arr = Array{Array{Float64, 1}, 1}(p)
  points = 0
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
    points += length(y_arr[j])
  end
  println(points)
end

function calc_numofpoints(x_a::Float64, p::Int64)
  calc_bif_da_p(x_a,p)
end
