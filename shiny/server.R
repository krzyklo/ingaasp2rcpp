#install.packages("devtools")
devtools::install_github("krzyklo/ingaasp2rcpp")

library(devtools)
library(ingaasp2rcpp)
#library(tibble)
data("fig1b")
data("fig1a")


indf<-data.frame(x=c(0),y=c(0))

function(input, output, session) {


  values<-reactiveValues()
  values$df<-indf

  observe({
    if(input$AddButton>0) {
      newLine<-isolate(c(input$Ga_x,input$As_y))
      isolate(values$df<-rbind(values$df,newLine))
    }
  })

  observe({
    if(input$CutLast>0) {
      isolate({
        if(nrow(values$df)>1) {
          values$df<-values$df[ {-nrow(values$df)},]
        }
      })
    }
  })

  output$table <- renderTable({
    #unlist(values$df)
    values$df
  }
  )

  output$plot <- renderPlot({
    input$AddButton

    par(mar=c(3,3,1.5,0))
    plot(fig1b$x,fig1b$y10,t="p",xlim=c(-0.02,0.02),ylim=c(0.4,1.4),main="InGaAsP, (x,y) -> (Eg,Strain)") #x=0..1, y=1
    grid()
    lines(ingaasp2rcpp::modPQ_EgStrain(seq(0,1,0.05),1)) #x=0..1, y=1
    points(fig1b$x,fig1b$x01,col="blue") #x=0.1, y=0..1
    lines(ingaasp2rcpp::modPQ_EgStrain(0.1,seq(0,1,0.05)),col="blue") #x=0.1, y=0..1
    points(fig1b$x,fig1b$x0,col="magenta")
    lines(ingaasp2rcpp::modPQ_EgStrain(0,seq(0,1,0.05)),col="magenta") #x=0, y=0..1
    points(fig1b$x,fig1b$y0,col="brown")
    lines(ingaasp2rcpp::modPQ_EgStrain(seq(0,1,0.05),0),col="brown") #x=0..1, y=0
    points(fig1b$x,fig1b$y07,col="green")
    lines(ingaasp2rcpp::modPQ_EgStrain(seq(0,1,0.05),0.7),col="green") #x=0..1, y=0.7
    points(fig1b$x,fig1b$y09,col="orange")
    lines(ingaasp2rcpp::modPQ_EgStrain(seq(0,1,0.05),0.9),col="orange") #x=0..1, y=0.9
    legend("topleft",col=c("black","blue","magenta","brown","green","orange"),
           lty=1,
           legend=c("x=0..1 y=1","x=0.1  y=0..1","x=0     y=0..1","x=0..1 y=0","x=0..1 y=0.7","x=0..1 y=0.9"),
           lwd=1.5,cex=1.1,bty="n")
    points(modPQ_eps_xy_f1(values$df$x,values$df$y),modPQ_Eg_XY(values$df$x,values$df$y),lwd=4,pch=8,col="red")
    title(xlab="Strain [absolute units]",ylab="Eg [eV]", line=2, cex.lab=1.1, family="Calibri Light")
  })


  output$plot1 <- renderPlot({
    input$AddButton

    par(mar=c(3,3,1.5,0))
    plot(fig1a$x,fig1a$Eg01,t="p",xlim=c(0,1),ylim=c(0,1),main="InGaAsP, (Eg,Strain) -> (x,y)")
    grid()
    points(fig1a$x,fig1a$Str0,col="blue") # 0% strain line, y=ax+b - linear relation between them to get 0
    lines(modPQ_XY_EgStrain(seq(0.72,1.35,0.05),0),col="blue",lwd=2)
    lines(modPQ_XY_EgStrain(seq(0.72,1.35,0.05),0.005),col="orange",lwd=1.5) #0.5% strain line
    lines(modPQ_XY_EgStrain(seq(0.705,1.2,0.05),-0.005),col="red",lwd=1.5) #-0.5% strain line

    points(fig1a$x,fig1a$Str0,col="blue") # 0 strain line, y=ax+b - linear relation between them to get 0 strain
    points(fig1a$x,fig1a$Eg4,col="brown") #
    points(fig1a$x,fig1a$Eg02,col="yellow") #
    lines(modPQ_XY_EgStrain(1.3,seq(0,0.055,0.001)),col="green",lwd=1.5) #constant Eg=1.3eV, nonlinear function
    lines(modPQ_XY_EgStrain(1,seq(-0.01,0.035,0.001)),col="green",lwd=1.5) #constant Eg=1eV, nonlinear relation in X, Y coordinates
    lines(modPQ_XY_EgStrain(1.2,seq(-0.003,0.045,0.001)),col="green",lwd=1.5) #constant Eg=1.2eV,
    legend("topleft",col=c("black","yellow","brown","blue","orange","red","green"),
           lty=1,
           legend=c("Eg=1.3eV","Eg=1.2eV","Eg=1.0eV","0% strain","0.5% strain","-0.5% strain", "Eg fitting"),
           lwd=2,cex=1.1,bty="n")
    title(xlab="X (Ga molar fraction)", ylab="Y (As molar fraction", line=2, cex.lab=1.1)

    points(values$df$x,values$df$y,lwd=4,pch=8,col="red")
  })


  #output$indf <- renderTable(indf)

  output$constants <- renderPrint({
    cnst
  })


}

