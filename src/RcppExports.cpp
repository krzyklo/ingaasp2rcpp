// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// eps_xy_f1
double eps_xy_f1(double x, double y);
RcppExport SEXP ingaasp2rcpp_eps_xy_f1(SEXP xSEXP, SEXP ySEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type x(xSEXP);
    Rcpp::traits::input_parameter< double >::type y(ySEXP);
    rcpp_result_gen = Rcpp::wrap(eps_xy_f1(x, y));
    return rcpp_result_gen;
END_RCPP
}
// PQ_Eg_unstrained
double PQ_Eg_unstrained(double x, double y);
RcppExport SEXP ingaasp2rcpp_PQ_Eg_unstrained(SEXP xSEXP, SEXP ySEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type x(xSEXP);
    Rcpp::traits::input_parameter< double >::type y(ySEXP);
    rcpp_result_gen = Rcpp::wrap(PQ_Eg_unstrained(x, y));
    return rcpp_result_gen;
END_RCPP
}
// PQ_Eg_XY
double PQ_Eg_XY(double x, double y);
RcppExport SEXP ingaasp2rcpp_PQ_Eg_XY(SEXP xSEXP, SEXP ySEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type x(xSEXP);
    Rcpp::traits::input_parameter< double >::type y(ySEXP);
    rcpp_result_gen = Rcpp::wrap(PQ_Eg_XY(x, y));
    return rcpp_result_gen;
END_RCPP
}
// LatticeConst
double LatticeConst(double eps_xy);
RcppExport SEXP ingaasp2rcpp_LatticeConst(SEXP eps_xySEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type eps_xy(eps_xySEXP);
    rcpp_result_gen = Rcpp::wrap(LatticeConst(eps_xy));
    return rcpp_result_gen;
END_RCPP
}
// PQ_Y_XStrain
double PQ_Y_XStrain(double x, double eps_xy);
RcppExport SEXP ingaasp2rcpp_PQ_Y_XStrain(SEXP xSEXP, SEXP eps_xySEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type x(xSEXP);
    Rcpp::traits::input_parameter< double >::type eps_xy(eps_xySEXP);
    rcpp_result_gen = Rcpp::wrap(PQ_Y_XStrain(x, eps_xy));
    return rcpp_result_gen;
END_RCPP
}
// func4root
double func4root(double x);
RcppExport SEXP ingaasp2rcpp_func4root(SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(func4root(x));
    return rcpp_result_gen;
END_RCPP
}
// PQ_X_EgStrain
double PQ_X_EgStrain(double Eg, double eps_xy);
RcppExport SEXP ingaasp2rcpp_PQ_X_EgStrain(SEXP EgSEXP, SEXP eps_xySEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type Eg(EgSEXP);
    Rcpp::traits::input_parameter< double >::type eps_xy(eps_xySEXP);
    rcpp_result_gen = Rcpp::wrap(PQ_X_EgStrain(Eg, eps_xy));
    return rcpp_result_gen;
END_RCPP
}
// PL2Eg_f1
double PL2Eg_f1(double PL);
RcppExport SEXP ingaasp2rcpp_PL2Eg_f1(SEXP PLSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type PL(PLSEXP);
    rcpp_result_gen = Rcpp::wrap(PL2Eg_f1(PL));
    return rcpp_result_gen;
END_RCPP
}
// Eg2PL_f1
double Eg2PL_f1(double Eg);
RcppExport SEXP ingaasp2rcpp_Eg2PL_f1(SEXP EgSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type Eg(EgSEXP);
    rcpp_result_gen = Rcpp::wrap(Eg2PL_f1(Eg));
    return rcpp_result_gen;
END_RCPP
}
// PQ_X_YStrain
double PQ_X_YStrain(double y, double strain);
RcppExport SEXP ingaasp2rcpp_PQ_X_YStrain(SEXP ySEXP, SEXP strainSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type y(ySEXP);
    Rcpp::traits::input_parameter< double >::type strain(strainSEXP);
    rcpp_result_gen = Rcpp::wrap(PQ_X_YStrain(y, strain));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"ingaasp2rcpp_eps_xy_f1", (DL_FUNC) &ingaasp2rcpp_eps_xy_f1, 2},
    {"ingaasp2rcpp_PQ_Eg_unstrained", (DL_FUNC) &ingaasp2rcpp_PQ_Eg_unstrained, 2},
    {"ingaasp2rcpp_PQ_Eg_XY", (DL_FUNC) &ingaasp2rcpp_PQ_Eg_XY, 2},
    {"ingaasp2rcpp_LatticeConst", (DL_FUNC) &ingaasp2rcpp_LatticeConst, 1},
    {"ingaasp2rcpp_PQ_Y_XStrain", (DL_FUNC) &ingaasp2rcpp_PQ_Y_XStrain, 2},
    {"ingaasp2rcpp_func4root", (DL_FUNC) &ingaasp2rcpp_func4root, 1},
    {"ingaasp2rcpp_PQ_X_EgStrain", (DL_FUNC) &ingaasp2rcpp_PQ_X_EgStrain, 2},
    {"ingaasp2rcpp_PL2Eg_f1", (DL_FUNC) &ingaasp2rcpp_PL2Eg_f1, 1},
    {"ingaasp2rcpp_Eg2PL_f1", (DL_FUNC) &ingaasp2rcpp_Eg2PL_f1, 1},
    {"ingaasp2rcpp_PQ_X_YStrain", (DL_FUNC) &ingaasp2rcpp_PQ_X_YStrain, 2},
    {NULL, NULL, 0}
};

RcppExport void R_init_ingaasp2rcpp(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
