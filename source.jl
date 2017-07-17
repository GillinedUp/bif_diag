λ_range = linspace(0.0, 1.0, 1000)
x_range = linspace(0.0, 4.0, 1000)
x = 0.5
iter_const = 1000
x_arr = Array{Array{Float, 1}, 1}
function plot_diag(x, λ_range, x_range)
  x_arr = Array{Array{Float, 1}, 1}

  for λ in λ_range
    for i = 1:iter_const
      x = λ*(1-x)
    end

  end
end
