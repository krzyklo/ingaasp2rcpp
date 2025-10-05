# README
Krzysztof Kłos  
July 5, 2017  


[![DOI](https://zenodo.org/badge/96256606.svg)](https://zenodo.org/badge/latestdoi/96256606)
[![Build Status](https://travis-ci.org/krzyklo/ingaasp2rcpp.svg?branch=master)](https://travis-ci.org/krzyklo/ingaasp2rcpp)

### Intro
This is the R package which ties model of bandgap(Eg) and strain vs x (Ga) and Y(As) molar fractions  in InGaAsP material. The model is based on paper:  
**J. Minch, S.H. Park, T. Keating, and S.L. Chuang: "Theory and Experiment if InGaAsP and AlInGaAs Long Wavelength Strained Quantum-Well Lasers" from Journal of Quantum Electronics vol 35, NO. 5, May 1999**

The model allows to transform Eg, Strain into molar fractions x(Ga), and y(As) and back:  
$Eg,Strain <--> x,y$  

The intention behind this was to exercise good coding practices in R:

- creating R packages
- documenting with Roxygen2 package
- writing unit tests with TestThat package
- using Rcpp for speed of C++
- using Boost C++ library
- writing R markdown documents
- continous integration principle with GitHub and Travis(Linux only)

### Installation
Type the commands below in R or RStudio:

`install.packages("devtools")`

`devtools::install_github("krzyklo/ingaasp2rcpp")`

The package location on GitHub: <https://github.com/krzyklo/ingaasp2rcpp>.

### InGaAsP Calculator in web browser
InGaAsP calculator as simple web application written in Shiny - web application framework for R:  

<https://krzyklo.shinyapps.io/ingaasp/>


### Figures - comparison with reference paper
The figures below shows digitized data (circles) and **InGaAsP calculator** results (lines) for $Eg,Strain <-> x,y$ transformations in both directions. As we could see below the model accurately reproduces the data from the figures in reference paper. 

![Fig. 1. Calculation of bandgap Eg and Strain from molar fractions X and Y. With circles data reproduced from Fig. 1 b) of the reference paper](README_files/figure-html/unnamed-chunk-1-1.png)

The plot above shows the relation between bandgap Eg and strain of various InGaAsP composition variants. 
It was created by fixing x or y molar fractions, and then vary the other molar fraction between 0 and 1.
For example, InP material used as substrate have x=0 and y=0, and is located at 1.35 eV and 0 strain. InP location is at crossing point of two ternaries: magenta ($InAs_yP_{1-y}$) and brown ($In_{1-x}Ga_xP$) data series. For $InAs_yP_{1-y}$ by adding more As, the layer on InP substrate become compressively strained (negative sign of strain), and bandgap decrease, as we go toward InAs material.  
Adding Ga to InP would increase tensile strain (+ sign) of resulting ($In_{1-x}Ga_xP$), but bandgap Eg changes very little on the path toward GaP material.  
The black data series is $In_{1-x}Ga_xAs$ material, it shows the lowest limits of bandgap achievable in the InGaAsP compound, and it could be compressively or tensily strained.   
The 0 strain molar fractions for $In_{1-x}Ga_xAs$ are Ga=0.468, and bandgap of this InGaAs lattice matched to InP is 0.73 eV. 

```r
x<-round(ingaasp2rcpp::PQ_X_YStrain(1,0),digits=3)
round(PQ_Eg_XY(x,1),digits = 2)
```

```
## [1] 0.73
```

![Fig. 2. As molar fraction vs Ga molar fraction for constant strain and bandgap. Reproduced from Fig. 1 a) of the reference paper](README_files/figure-html/unnamed-chunk-3-1.png)


In the plot above two types of x and y relation are shown. Firstly, for the cases where strain was fixed, and Eg was varied. The second, where Eg was fixed, and strain varied. Plot of X, and Y molar fractions as function of Eg, and strain is less straightforward to generate, as not all combinations of Eg and strain values have physical meaning (x and y values smaller than 1), and root finding technique need to be employed (bisection).
An example of unphysical result is Eg=0.7eV, and 0 strain. This pair is leading to y composition larger than 1.

```r
round(modPQ_XY_EgStrain(0.7,0),3)
```

```
##          X     Y
## [1,] 0.505 1.076
```

Constant strain lead to linear dependence between x and y molar fractions. In the plot 0% strain is shown with blue color, whereas -0.5% and 0.5% strain with red and orange respectively. 

### Information about Objects and Functions

The naming convention used in this package is that all functions exported for user are starting with PQ or modPQ prefix, with a few exceptions. PQ functions are not vectorized, user should work with modPQ functions which are vectorized. After prefix, there is underscore and return variable(s), followed by second underscore with input arguments.  
For example `modPQ_X_EgStrain` means that function will return x (Ga molar fraction), and take bandgap Eg and Strain in absolute units as input arguments.

After installation please type `library(help="ingaasp2rcpp")` to see all the objects from the package with brief description. 
Below is the list of functions, and their arguments: 


```r
lsf.str("package:ingaasp2rcpp")
```

```
## Eg2PL_f1 : function (Eg)  
## func4root : function (x)  
## LatticeConst : function (eps_xy)  
## modPQ_EgStrain : function (x, y)  
## modPQ_Eg_XY : function (x, y)  
## modPQ_eps_xy_f1 : function (x, y)  
## modPQ_PL2Eg : function (PL)  
## modPQ_X_EgStrain : function (Eg, Strain)  
## modPQ_XY_EgStrain : function (Eg, Strain)  
## modPQ_Y_EgStrain : function (x, Strain)  
## PL2Eg_f1 : function (PL)  
## PQ_Eg_unstrained : function (x, y)  
## PQ_Eg_XY : function (x, y)  
## PQ_eps_xy_f1 : function (x, y)  
## PQ_X_EgStrain : function (Eg, eps_xy)  
## PQ_X_YStrain : function (y, strain)  
## PQ_Y_XStrain : function (x, eps_xy)
```


### Typical usage 

Calculate what target composition have InGaAsP layer with given PL and target, eg. PL=1200nm, strain=0%:  

```r
modPQ_XY_EgStrain(modPQ_PL2Eg(1200),0)
```

```
##              X         Y
## [1,] 0.2006707 0.4366245
```

Calculate composition of the outcome of growth eg. PL=1220nm, strain=500 ppm:

```r
modPQ_XY_EgStrain(modPQ_PL2Eg(1220),500/1e6)
```

```
##              X         Y
## [1,] 0.2210441 0.4650469
```

Then growth model is used to modify reagents flow, to obtain outcome closer to target. 


