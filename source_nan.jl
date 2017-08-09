function calcnan(xa::Float64, p::Int64, start = 0.0, fin = 4.0)
  λarr = collect(linspace(start, fin, p))
  const pconst = 4407 # calculated with find_eq()
  const iterconst = 50000
  const ϵ = 1e-6
  yarr = Matrix{Float64}(p, pconst)
  fill!(yarr, NaN)
  for i = 1:p
    λ = λarr[i]
    x = xa
    for j = 1:iterconst
      x = λ*x*(1-x)
    end
    yarr[i, 1] = x
    for m = 2:pconst
      x = λ*x*(1-x)
      if !almostequal(x, yarr[i, 1], ϵ)
        yarr[i, m] = x
      else
        break
      end
    end
  end
  return λarr, yarr
end
