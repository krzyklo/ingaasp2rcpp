#' InGaAsP X vs Y for fixed strain or bandgap
#'
#' Relation between InGaAsP X and Y molar fractions digitized from Fig. 1(a) in reference paper.
#' Data was digitized using Engauge Digitizer from Fig. 1(a) to compare against R functions
#'
#'
#' @docType data
#'
#' @usage
#' par(mar=c(3,3,1.5,0))
#' plot(fig1a$x,fig1a$Eg01,t="p",xlim=c(0,1),ylim=c(0,1),main="InGaAsP, calculated overlaid on digitized")
#' grid()
#' points(fig1a$x,fig1a$Str0,col="blue") # 0% strain line, y=ax+b - linear relation between them to get 0
#' lines(modPQ_XY_EgStrain(seq(0.72,1.35,0.05),0),col="red",lwd=2)
#' lines(modPQ_XY_EgStrain(seq(0.72,1.35,0.05),0.005),col="orange",lwd=1.5) #0.5% strain line
#' lines(modPQ_XY_EgStrain(seq(0.705,1.2,0.05),-0.005),col="red",lwd=1.5) #-0.5% strain line
#' points(fig1a$x,fig1a$Str0,col="blue") # 0 strain line, y=ax+b - linear relation between them to get 0 strain
#' points(fig1a$x,fig1a$Eg4,col="brown") #
#' points(fig1a$x,fig1a$Eg02,col="yellow") #
#' lines(modPQ_XY_EgStrain(1.3,seq(0,0.055,0.001)),col="green",lwd=1.5) #constant Eg=1.3eV, nonlinear function
#' lines(modPQ_XY_EgStrain(1,seq(-0.01,0.035,0.001)),col="green",lwd=1.5) #constant Eg=1eV, nonlinear relation in X, Y coordinates
#' lines(modPQ_XY_EgStrain(1.2,seq(-0.003,0.045,0.001)),col="green",lwd=1.5) #constant Eg=1.2eV,
#'
#' @format An object of class \code{"data.frame"}
#'
#' @keywords datasets
#'
#' @references "Theory and experiment of InGaAsP and AlInGaAs long-wavelength strained quantum-well lasers" J.Minch, S.H. Park, T. Keating and S.L. Chuang: IEEE JQE vol. 35 no. 5, 1999
#' (\href{http://ieeexplore.ieee.org/document/760325/}{IEEE})
#'
#' @source J.Minch, S.H. Park, T. Keating and S.L. Chuang: IEEE JQE vol. 35 no. 5, 1999
#'
#' @examples
#' head(fig1a)
"fig1a"