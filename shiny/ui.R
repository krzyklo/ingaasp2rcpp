

library(markdown)
library(shiny)
library(knitr)
library(ingaasp2rcpp)

rmdfiles <- c("README.Rmd")
sapply(rmdfiles, knit, quiet = T)

navbarPage(title=HTML("<a id=\"title\", style=color:black;  href=\"#Readme\">Reproducible Research</a>"),theme = "bootstrap.css",
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
                                          fluidRow(column(2,h6("x(Ga)")), column(2,h6("y(As)"))),
                                          fluidRow(
                                            column(width=4,numericInput("Ga_x",label = NULL, 0.1,min = 0,max=1,value = 0)),
                                            column(width=4,numericInput("As_y",label = NULL, 0.1,min = 0,max=1, value = 0 )),
                                            column(1,actionButton("AddButton",label="Add",icon("floppy-o", lib = "font-awesome")))
                                          ),
                                          fluidRow(
                                            column(1,tableOutput("table")),
                                            tags$br(),
                                            column(1,offset=4,actionButton("CutLast",label="Cut",icon("cut", lib = "font-awesome"))))
                                   ),
                                   column(width=7,plotOutput("plot"),plotOutput("plot1"))

                                   #plotOutput("addPoints")), #server output$plot<-renderPlot(...
                                   #tags$br(),


                                   #fluidRow(column(1,offset = 1),actionButton("AddButton",label="Add",icon("floppy-o", lib = "font-awesome"))),



                                 )
                        ),
                        tabPanel("ToDo",
                                 p("This is the third panel")
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
           navbarMenu("More",
                      tabPanel("Table",h3("TBD")
                               #         DT::dataTableOutput("table")
                      ),
                      tabPanel("About",
                               fluidRow(
                                 column(6, includeMarkdown("about.md")
                                 ),
                                 column(3,
                                        img(class="img-polaroid",
                                            src=paste0("http://upload.wikimedia.org/",
                                                       "wikipedia/commons/9/92/",
                                                       "1919_Ford_Model_T_Highboy_Coupe.jpg")),
                                        tags$small(
                                          "Source: Photographed at the Bay State Antique ",
                                          "Automobile Club's July 10, 2005 show at the ",
                                          "Endicott Estate in Dedham, MA by ",
                                          a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
                                            "User:Sfoskett")
                                        )
                                 )
                               )
                      )
           )
)

