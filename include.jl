@everywhere function almostequal(a::Float64, b::Float64, ϵ::Float64)
  return abs(a-b) <= ϵ
end
