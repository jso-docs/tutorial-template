# This file was generated, do not modify it. # hide
using Plots

x = rand(3)
y = rand(3)
plot(x, y)
isdir("plots") || mkdir("plots")
png(joinpath("plots", "myplot"))