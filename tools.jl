function calcmax(xa::Float64, p::Int64)
  λarr = collect(linspace(0.0, 4.0, p))
  const iterconst = 50000
  const ϵ = 1e-6
  xarr = Array{Array{Float64, 1}, 1}(p)
  yarr = Array{Array{Float64, 1}, 1}(p)
  max = 0
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
    while !found
      x = λ*x*(1-x)
      for y in yarr[j]
        if almostequal(x, y, ϵ)
          found = true
          break
        end
      end
      if !found
        push!(yarr[j], x)
      end
    end
    push!(xarr[j], λ)
    max = (length(yarr[j]) > max ? length(yarr[j]) : max)
  end
  return max
end

function findeq(k::Int64)
  xa = 0.5
  arr = Vector{Int64}(k)
  for i = 1:k
    arr[i] = calcmax(xa, i*1000)
  end
  return arr
end

function timecalc(xa::Float64, p::Int64)
  x,y = calcarr(xa, p)
  println("Array of arrays:")
  @time calcarr(xa, p)
  x,y = calcnan(xa, p)
  println("NaN:")
  @time calcnan(xa, p)
  x,y = calcnane(xa, p)
  @time calcnane(xa, p)
end

function calcarrp(xa::Float64, p::Int64)
  λarr = collect(linspace(0.0, 4.0, p))
  const iterconst = 50000
  const ϵ = 1e-6
  xarr = Array{Array{Float64, 1}, 1}(p)
  yarr = Array{Array{Float64, 1}, 1}(p)
  points = 0
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
    while !found
      x = λ*x*(1-x)
      for y in yarr[j]
        if almostequal(x, y, ϵ)
          found = true
          break
        end
      end
      if !found
        push!(yarr[j], x)
      end
    end
    push!(xarr[j], λ)
    points += length(yarr[j])
  end
  println(points)
end

function calcnanp(xa::Float64, p::Int64, start = 0.0, fin = 4.0)
  λarr = collect(linspace(start, fin, p))
  const pconst = 2720 # calculated with findeq()
  const iterconst = 50000
  const ϵ = 1e-6
  yarr = Matrix{Float64}(p, pconst)
  fill!(yarr, NaN)
  points = 0
  for i = 1:p
    λ = λarr[i]
    x = xa
    for j = 1:iterconst
      x = λ*x*(1-x)
    end
    yarr[i, 1] = x # add first value
    m = 1
    for m = 2:pconst
      x = λ*x*(1-x)
      if !almostequal(x, yarr[i, 1], ϵ)
        yarr[i, m] = x
      else
        break
      end
    end
    points += m
  end
  println(points)
end

function calc_numofpoints(xa::Float64, p::Int64)
  calcarrp(xa, p)
  calcnanp(xa, p)
end
