
#' Transform vectors of PL in nm into Eg in eV
#'
#'
#'@param PL Ga molar fraction
#'@export
modPQ_PL2Eg<-function(PL) {
  mapply( function(a) {ingaasp2rcpp::PL2Eg_f1(a)}, PL )
}

#'Data.frame for plotting Eg vs Strain for InGaAsP
#'
#'Combining output of eps_xy and PQ_Eg_XY functions
#'@param x Ga molar fraction
#'@param y As molar fraction
#'@export
modPQ_EgStrain<-function(x,y) {
  cbind(mapply( function(a, b) {ingaasp2rcpp::PQ_eps_xy_f1(a,b)}, x,y ),
        mapply( function(a, b) {ingaasp2rcpp::PQ_Eg_XY(a,b)}, x,y ))
}

#'Vectorized Eg from X and Y for InGaAsP
#'
#'Using mapply to \code{PQ_Eg_XY}
#'@param x Ga molar fraction
#'@param y As molar fraction
#'@export
modPQ_Eg_XY<-function(x,y) {
  mapply( function(a, b) {ingaasp2rcpp::PQ_Eg_XY(a,b)}, x, y)
}

#'Vectorized Eg from X and Y for InGaAsP
#'
#'Using mapply to \code{PQ_Eg_XY}
#'@param x Ga molar fraction
#'@param y As molar fraction
#'@export
modPQ_eps_xy_f1<-function(x,y) {
  mapply( function(a, b) {ingaasp2rcpp::PQ_eps_xy_f1(a,b)}, x, y)
}

#'Vectorized Eg from X and Y for InGaAsP
#'
#'Using mapply to \code{PQ_X_EgStrain}
#'@param Eg bandgap Eg in eV
#'@param Strain Strain of layer
#'@export
modPQ_X_EgStrain<-function(Eg,Strain) {
  mapply( function(a, b) {ingaasp2rcpp::PQ_X_EgStrain(a,b)}, Eg, Strain)
}

#'Data.frame for plotting X vs Y for InGaAsP
#'
#'Combining output of \code{PQ_X_EgStrain} and PQ_Y_XStrain functions0
#'@param Eg bandgap Eg in eV
#'@param Strain Strain of layer
#'@export
modPQ_XY_EgStrain<-function(Eg,Strain) {
  X=mapply( function(a, b) {ingaasp2rcpp::PQ_X_EgStrain(a,b)}, Eg,Strain )
  Y=mapply( function(a, b) {ingaasp2rcpp::PQ_Y_XStrain(a,b)}, X, Strain )
  cbind(X,Y)
}

#'Vectorized PQ_Y_EgStrain
#'
#'Vectorized function \code{PQ_Y_EgStrain}
#'@param x Ga molar fraction
#'@param Strain Strain of layer
#'@export
modPQ_Y_EgStrain<-function(x, Strain) {
  mapply( function(a, b) {ingaasp2rcpp::PQ_Y_XStrain(a,b)}, x, Strain)
}

#PQ_X_EgStrain(1239.85/1300,0)
#PQ_Y_XStrain(0.2609568,0)
#1239.85/PQ_Eg_XY(0.2609568,0.5654559)
