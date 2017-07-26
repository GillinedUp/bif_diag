function almost_equal(a, b, ϵ)
  return abs(a-b) <= ϵ
end

function calc_bif_nan(x_a, p)
  λ_arr = collect(linspace(0.0, 4.0, p))
  iter_const = 100
  ϵ = 1e-6
  y_arr = Matrix{Float64}(p, 4319)
  fill!(y_arr, NaN)
  for i = 1:p
    λ = λ_arr[i]
    x = x_a
    for j = 1:iter_const
      x = λ*x*(1-x)
    end
    k = 1
    while(true)
      bool_arr = map(y -> almost_equal(x, y, ϵ), y_arr[i, :])
      if !in(true, bool_arr) # if not
        while(!isequal(y_arr[i, k],NaN))
          k += 1
        end
        y_arr[i, k] = x # add it to the array
        x = λ*x*(1-x) # iterate once more
      else
        break # else break from the while loop
      end
    end
  end
  return λ_arr, y_arr
end
