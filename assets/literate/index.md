<!--This file was generated, do not modify it.-->
# Template for jso-docs separate pages

\toc

Modify this file

## Testing

Testing

```julia:ex1
A = rand(5, 5)
b = A * ones(5)
x = A \ b
```

Testing

```julia:ex2
using LinearAlgebra
norm(A * x - b), norm(x .- 1)
```

## Plotting

Use `joinpath(@OUTPUT, "filename")` to save the image in the right place and use `{{ rfig filename.ext Caption of image }}` to add the image afterwards.

using Plots

```julia:ex3
x = rand(3)
y = rand(3)
```

plot(x, y)

```julia:ex4
isdir("plots") || mkdir("plots")
run(`echo hi plots/hi.txt`)
```

png(joinpath("plots", "myplot"))

```julia:ex5
pwd()
```

```julia:ex6
run(`cat plots/hi.txt`)
```

{{ rfig myplot.png Example of plot and description }}

