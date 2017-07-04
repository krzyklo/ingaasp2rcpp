#' InGaAsP Strain vs Bandgap Eg
#' 
#' Relation between InGaAsP bandgap and strain for composition x,y digitized from Fig. 1(b)
#' Data was digitized using Engauge Digitizer from Fig. 1(b) to compare against R functions
#' 
#'
#' @docType data
#'
#' @usage
#' par( mfrow=c(1,1))
#' plot(fig1b$x,fig1b$y10,t="p",xlim=c(-0.02,0.02),ylim=c(0.4,1.4), 
#' xlab="Strain",ylab="Eg, eV",main="InGaAsP Strain vs Bandgap")
#' grid()
#' points(fig1b$x,fig1b$x0,col="magenta")
#' points(fig1b$x,fig1b$y0,col="brown")
#' points(fig1b$x,fig1b$x01,col="blue") #x=0.1, y=0..1
#' points(fig1b$x,fig1b$y10,col="red")  #x=0..1, y=1.0
#' points(fig1b$x,fig1b$y07,col="green") #x=0..1, y=0.7
#' points(fig1b$x,fig1b$y09,col="orange") #x=0..1, y=0.7
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
#' head(fig1b)
"fig1b"