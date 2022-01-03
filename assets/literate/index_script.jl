# This file was generated, do not modify it.

A = rand(5, 5)
b = A * ones(5)
x = A \ b

using LinearAlgebra
norm(A * x - b), norm(x .- 1)

x = rand(3)
y = rand(3)

isdir("plots") || mkdir("plots")
run(`echo hi plots/hi.txt`)

pwd()

run(`cat plots/hi.txt`)

