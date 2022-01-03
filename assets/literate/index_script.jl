# This file was generated, do not modify it.

A = rand(5, 5)
b = A * ones(5)
x = A \ b

using LinearAlgebra
norm(A * x - b), norm(x .- 1)

using Plots

x = rand(3)
y = rand(3)
plot(x, y)
png(joinpath("__site/assets", "myplot")) # hide

