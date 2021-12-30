# # Template for jso-docs separate pages

# \toc

# Modify this file

# ## Testing

# Testing

A = rand(5, 5)
b = A * ones(5)
x = A \ b

# Testing

using LinearAlgebra
norm(A * x - b), norm(x .- 1)

# Plotting

using Plots

x = rand(3)
y = rand(3)
plot(x, y)
png(joinpath(@OUTPUT, "myplot"))

# \fig{myplot.png}