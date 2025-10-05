

library(markdown)
library(shiny)
library(knitr)
library(ingaasp2rcpp)

rmdfiles <- c("README.Rmd")
sapply(rmdfiles, knit, quiet = T)

navbarPage(title="www.photin.eu",theme = "bootstrap.css",
           tabPanel("InGaAsP",
                    sidebarLayout(
                      navlistPanel(
                        "InGaAsP",widths = c(2,10),
                        tabPanel("Readme",
                                 h4("Readme"),
                                 withMathJax(includeMarkdown("README.md"))

                        ),
                        tabPanel("Calculator",
                                 fluidRow(
                                   column(4,
                                          h4("InGaAsP Calculator"),
                                          h4("To order InP/InGaAs/InGaAsP wafer visit: www.photin.eu"),
                                          fluidRow(column(2,h6("x(Ga)")), column(2,h6("y(As)"))),
                                          fluidRow(
                                            column(width=4,numericInput("Ga_x",label = NULL, 0.1,min = 0,max=1,value = 0)),
                                            column(width=4,numericInput("As_y",label = NULL, 0.1,min = 0,max=1, value = 0 )),
                                            column(1,actionButton("AddButton",label="Add",icon("floppy-o", lib = "font-awesome"))),
                                            column(1,offset=8,actionButton("CutLast",label="Cut",icon("cut", lib = "font-awesome")))
                                          ),
                                          fluidRow(
                                            tags$br(),
                                            tags$p('    x,    y,    PL [nm],    Strain [ppm]'),
                                            column(1,tableOutput("table")),
                                            tags$br()
                                          )


                                   ),
                                   column(width=7,plotOutput("plot"),plotOutput("plot1"))

                                   #plotOutput("addPoints")), #server output$plot<-renderPlot(...
                                   #tags$br(),


                                   #fluidRow(column(1,offset = 1),actionButton("AddButton",label="Add",icon("floppy-o", lib = "font-awesome"))),



                                 )
                        ),
                        tabPanel("ToDo",
                                 h4("Ideas for more work"),
                                 p("- Quantum Wells models and calculations"),
                                 p("- Adding InGaAsP growth model in MOCVD"),
                                 p("- Laser gratings calculations"),
                                 p("- post modifications of V. Łysak(IOFFE) model for gain calculations in semiconductors as in this example:"),
                                 a(href="http://www.nlcstr.com/examples2.htm","examples for comparison")
                                 #includeMarkdown("InGaAsP_1.md"),

                        )
                      ),
                      mainPanel(

                      )
                    )
           ),
           tabPanel("Constants",
                    h5("The table below shows constants used in the InGaAsP material calculator model"),
                    verbatimTextOutput("constants")
           ),
           #navbarMenu("More",
           tabPanel("About",
                    fluidRow(
                      column(6, includeMarkdown("about.md")

                      )
                    )
           )
           #)
)

