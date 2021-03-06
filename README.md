# EiSCor
A Julia wrapper of the Fortran library [eiscor](https://github.com/jaurentz/eiscor)

## Installation:

```julia
julia> Pkg.clone("https://github.com/andreasnoack/EiSCor.jl")
julia> Pkg.build("EiSCor")
```

## Example:

```julia
julia> using EiSCor

julia> H = eye(5)[[5,1:4],:]
5x5 Array{Float64,2}:
 0.0  0.0  0.0  0.0  1.0
 1.0  0.0  0.0  0.0  0.0
 0.0  1.0  0.0  0.0  0.0
 0.0  0.0  1.0  0.0  0.0
 0.0  0.0  0.0  1.0  0.0

julia> eigfact(EiSCor.UnitaryHessenbergMatrix(H))[:values]
5-element Array{Complex{Float64},1}:
 -0.809017-0.587785im
 -0.809017+0.587785im
  0.309017-0.951057im
  0.309017+0.951057im
       1.0+0.0im

julia> eigfact(EiSCor.UnitaryHessenbergMatrix(H))[:vectors]
5x5 Array{Float64,2}:
 -0.632456   1.33749e-16  -0.195469   0.601492    0.447214
  0.511667  -0.371748     -0.632456  -3.05458e-5  0.447214
 -0.19544    0.601501     -0.19541   -0.60151     0.447214
 -0.19544   -0.601501      0.511685  -0.371723    0.447214
  0.511667   0.371748      0.511649   0.371773    0.447214
```