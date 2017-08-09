function calcarr(xa::Float64, p::Int64, start = 0.0, fin = 4.0)
  λarr = collect(linspace(start, fin, p))
  const iterconst = 50000
  const ϵ = 1e-6
  xarr = Array{Array{Float64, 1}, 1}(p)
  yarr = Array{Array{Float64, 1}, 1}(p)
  for j = 1:p
    λ = λarr[j]
    x = xa
    xarr[j] = Array{Float64, 1}(0)
    yarr[j] = Array{Float64, 1}(0)
    for i = 1:iterconst
      x = λ*x*(1-x)
    end
    push!(yarr[j], x)
    found = false
    while !found # while we still have new values
      x = λ*x*(1-x) # iterate once more
      for y in yarr[j] # iterate through all found values
        if almostequal(x, y, ϵ) # and check if we already have the new one
          found = true
          break
        end
      end
      if !found
        push!(yarr[j], x) # if not, add it to the array
      end
    end
    push!(xarr[j], λ)
  end
  return xarr, yarr
end
