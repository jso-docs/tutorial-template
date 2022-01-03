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

```julia:ex3
using Plots

x = rand(3)
y = rand(3)
plot(x, y)
png(joinpath("__site/assets", "myplot"))
pwd()
```

{{ rfig myplot.png Example of plot and description }}

