function calcnan(xa::Float64, p::Int64, start = 0.0, fin = 4.0)
  λarr = collect(linspace(start, fin, p))
  const pconst = 2720 # calculated with findeq()
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
    yarr[i, 1] = x # add first value
    m = 1
    found = false
    while !found # while we still have new values
      x = λ*x*(1-x) # iterate once more
      for k = 1:m # iterate through all found values
        if almostequal(x, yarr[i, k], ϵ) # and check if we already have the new one
          found = true
          break
        end
      end
      if !found
        m += 1
        yarr[i, m] = x # if not, add it to the array
      end
    end
  end
  return λarr, yarr
end

function calcnan_anim(xa::Float64, p::Int64, start = 0.0, fin = 4.0)
  λarr = collect(linspace(start, fin, p))
  const pconst = 2720 # calculated with findeq()
  const iterconst = 50000
  const ϵ = 1e-6
  yarr = Matrix{Float64}(p, pconst)
  fill!(yarr, NaN)
  pyplot()
  verts = [(0, 0.1), (0, 0)]
  anim = @animate for i = 1:p
    λ = λarr[i]
    x = xa
    for j = 1:iterconst
      x = λ*x*(1-x)
    end
    yarr[i, 1] = x # add first value
    for m = 2:pconst
      x = λ*x*(1-x)
      if !almostequal(x, yarr[i, 1], ϵ)
        yarr[i, m] = x
      else
        break
      end
    end
    scatter(λarr, yarr, marker = (Shape(verts), 1, RGBA(0,0,0,0)), leg = false)
  end
  return λarr, yarr, anim
end
