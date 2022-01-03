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

#=
## Plotting

Use `joinpath(@OUTPUT, "filename")` to save the image in the right place and use `{{ rfig filename.ext Caption of image }}` to add the image afterwards.
=#

# using Plots

x = rand(3)
y = rand(3)
# plot(x, y)
isdir("plots") || mkdir("plots")
run(`echo hi plots/hi.txt`)
# png(joinpath("plots", "myplot"))
pwd()
#
run(`cat plots/hi.txt`)

# {{ rfig myplot.png Example of plot and description }}