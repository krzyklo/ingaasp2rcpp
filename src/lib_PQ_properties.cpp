#include <Rcpp.h>
using namespace Rcpp;
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <boost/math/tools/roots.hpp>
#include "constants.h"

namespace tools = boost::math::tools;

//forward declarations
//' InGaAsP Strain in absolute units from X and Y
//'
//' Function use interpolation PQ_interp_a0
//'
//' @param x Ga molar fraction
//'
//' @param y As molar fraction
//' 
//'@export
// [[Rcpp::export]]
double eps_xy_f1 (double x,double y);
double PQ_interp_a0 (double x,double y);
double PQ_interp_c11 (double x,double y);
double PQ_interp_c12 (double x,double y);
double PQ_interp_ac (double x,double y);
double PQ_interp_av (double x,double y);
double PQ_interp_b (double x,double y);
double PQ_Eclh_f1 (double x,double y);
double PQ_Echh_f1 (double x,double y);


double eps_xy_f1(double x, double y) {
	return( (a0_InP - PQ_interp_a0(x,y) ) / PQ_interp_a0(x,y));
}

double eps_z(double x, double y) {
	return(-2*PQ_interp_c12(x,y)/PQ_interp_c11(x,y) * eps_xy_f1(x,y) );
}

double dEc_f1(double x, double y) {
	return ( PQ_interp_ac(x,y) * ( 2 * eps_xy_f1(x,y) + eps_z(x,y) ));
}

double Peps_f1(double x, double y) {
	return( -2*PQ_interp_av(x,y) * (1 - PQ_interp_c12(x,y) / PQ_interp_c11(x,y)) * eps_xy_f1(x,y) );
}

// eq. 12
// @param x Ga molar fraction
// @param y As molar fraction
double Qeps_f1(double x, double y) {
	return(-PQ_interp_b(x,y)*(1+2*PQ_interp_c12(x,y)/PQ_interp_c11(x,y) ) * eps_xy_f1(x,y) );
}

// @param x Ga molar fraction
// @param y As molar fraction
double dEhh_f1(double x, double y) {
	return(-Peps_f1(x,y)-Qeps_f1(x,y));
}

// details
// @param x Ga molar fraction
// @param y As molar fraction
double dElh_f1(double x, double y) {
	return(-Peps_f1(x,y)+Qeps_f1(x,y));
}

//' Unstrained bandgap Eg in eV from polynomial eq.3
//' 
//' Strain effects are not included, Eg in eV from polynomial eq.3
//'
//' @param x Ga molar fraction
//' @param y As molar fraction
//'
//'@export
// [[Rcpp::export]]
double PQ_Eg_unstrained (double x, double y) {
	return(1.35+0.642*x-1.101*y+0.758*x*x+0.101*y*y-0.159*x*y-0.28*x*x*y+0.109*x*y*y); //eV
}

//little different equation from Piprek
double PQ_Eg_unstrained_f1 (double x, double y) {
	return(1.35+0.668*x-1.068*y+0.758*x*x+0.078*y*y-0.069*x*y-0.332*x*x*y+0.03*x*y*y); //eV
}

//functions that returns InGaAsP parameters: a,c11,c12,ac,av,b for the given x,y
// @param x Ga molar fraction
// @param y As molar fraction
double PQ_interp_a0 (double x,double y) {
	return(a0_GaAs*x*y + a0_GaP*x*(1-y) + a0_InAs*(1-x)*y + a0_InP*(1-x)*(1-y) );
}

double PQ_interp_c11 (double x,double y) {
	return(c11_GaAs*x*y + c11_GaP*x*(1-y) + c11_InAs*(1-x)*y + c11_InP*(1-x)*(1-y) );
}

double PQ_interp_c12 (double x,double y) {
	return(c12_GaAs*x*y + c12_GaP*x*(1-y) + c12_InAs*(1-x)*y + c12_InP*(1-x)*(1-y) );
}

double PQ_interp_ac (double x,double y) {
	return(ac_GaAs*x*y + ac_GaP*x*(1-y) + ac_InAs*(1-x)*y + ac_InP*(1-x)*(1-y) );
}

double PQ_interp_av (double x,double y) {
	return(av_GaAs*x*y + av_GaP*x*(1-y) + av_InAs*(1-x)*y + av_InP*(1-x)*(1-y) );
}

double PQ_interp_b (double x,double y) {
	return(b_GaAs*x*y + b_GaP*x*(1-y) + b_InAs*(1-x)*y + b_InP*(1-x)*(1-y) );
}



//Eg for heavy holes with strain
double PQ_Echh_f1(double x,double y) {
	return(PQ_Eg_unstrained(x,y)+dEc_f1(x,y)-dEhh_f1(x,y));
}

//Eg for light holes with strain
double PQ_Eclh_f1(double x, double y) {
	return(PQ_Eg_unstrained(x,y)+dEc_f1(x,y)-dElh_f1(x,y));
}
//' Calculate Eg from X and Y
//'
//' Function checks whether light holes or heavy holes gives smaller bandgap
//'
//' @param x Ga molar fraction
//' @param y As molar fraction
//'
//' @export
// [[Rcpp::export]]
double PQ_Eg_XY(double x, double y) {
	//In(1-x)Ga(x)As(y)P(1-y)
	//Ga = x
	//As = y
	double Eclh=PQ_Eclh_f1(x,y);
	double Echh=PQ_Echh_f1(x,y);  
	if(Eclh<=Echh) {
		return(Eclh);
	}
	else {
		return(Echh);    
	}
}

// Inverted calcs from Eg,Strain to X,Y
//'lattice constant from eps_xy and for InP substrate
//'
//' details tbd
//'
//' @param eps_xy Strain in plane of material in absolute units
//' 
//' @return Lattice constant in nm units
//' @export
// [[Rcpp::export]]
double LatticeConst(double eps_xy){
	return(a0_InP/(eps_xy+1));
}

//' Calculation of Y from arguments X and Strain using transformed eq. 1
//' 
//' We have given eps_xy which we could use to obtain PQ_lattice const.
//' Then plugging into eq. 1 we will be able to get Y when we have X given.
//'
//' @param eps_xy Strain in plane of material in absolute units
//'
//' @param x Ga molar fraction
//' @export
// [[Rcpp::export]]
double PQ_Y_XStrain(double x, double eps_xy) {
	double Nom= x * (a0_InP - a0_GaP) + LatticeConst(eps_xy) - a0_InP;
	double Denom=x*(a0_GaAs-a0_GaP-a0_InAs+a0_InP) + a0_InAs-a0_InP;
	return(Nom/Denom);
}

//*********global variable***********
double Eg2match;// 
double PQ_eps_xy;//
//*********

//' Function for which we want to find roots 
//' 
//' Function used with function PQ_X_EgStrain tp find root,
//' which would give us X Ga molar fraction
//'
//' @param x Ga molar fraction
//'
//' @export
// [[Rcpp::export]]
double func4root(double x) {
	double	y=PQ_Y_XStrain(x,PQ_eps_xy);
	return(PQ_Eg_XY(x,y)-Eg2match);		
}

//used to define tolerance of root search with bisection algorithm
bool root_termination(double min, double max) {
	return std::abs(max - min) <= 1e-6;
}

//' Main function for Eg,Strain -> X,Y
//' 
//' Function sets 2 global variables Eg2match and PQ_eps_xy, which are then used by func4root.
//' func4root is passed to bisect routine from Boost
//'
//' @param Eg bandgap in eV units
//' 
//' @param eps_xy in-plain strain in absolute units 
//'
//' @export
// [[Rcpp::export]]
double PQ_X_EgStrain(double Eg, double eps_xy) {
	//passing information about Eg and eps_xy for which we look for x,y to global variables
	//to have indirect access to them from func4root
	Eg2match=Eg;
	PQ_eps_xy=eps_xy;
	//double y1=func4root(0);
	//double y2=func4root(1);
	//if(y1*y2>0) {
	//	Rcout << "No crossing through zero in range <0,1>";
	//	exit}

	std::pair<double, double> result = tools::bisect(func4root, 0.0, 1.0, root_termination);
	return((result.first + result.second)/2);
} 

//TODO Rcpp BH Bisection 


//' Convertsion of PL wavelength to bandgap in eV
//'
//' details tbd
//' @param PL photoluminescence wavelength in nm. See examples.
//' @return Bandgap Eg as double in eV units
//' @export
//' @examples
//' PL2Eg_f1(1200) # 1.033202 eV
// [[Rcpp::export]]
double PL2Eg_f1(double PL) {
	double h=6.62606957e-34; // J*s , Planck constant
	double c=299792458; //m/s speed of light
	double q=1.602176565e-19; //C, electron charge
	return(h*c/PL/q*1e9); //in eV
}

//' Conversion of Bandgap into photoluminescence (PL) wavelength in nm
//'
//' Eg into PL in nm
//'
//' @param Eg bandgap in eV units
//' @return PL in nm as double
//'
//' @export
// [[Rcpp::export]]
double Eg2PL_f1(double Eg) {
	double h=6.62606957e-34; // J*s , Planck constant
	double c=299792458; //m/s speed of light
	double q=1.602176565e-19; //C, electron charge
	return(1e9*h*c/Eg/q); // PL in nm
}



