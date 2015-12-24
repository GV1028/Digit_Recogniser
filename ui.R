library(shiny)
shinyUI(fluidPage(theme="boot.css",
                  headerPanel("Digit Recogniser"),
                  sidebarPanel(wellPanel(a("Click here to generate the image",href="draw.html")),
                               fileInput('inimage',"Upload the saved PNG Image"),
                               wellPanel(h3("Certain things to be followed:"),
                                         h4("Make sure you draw the digit at the center of the canvas"),
                                         h4("Draw it clearly"),
                                         h4("If the prediction is wrong,try again with a clearer image"))),
                  mainPanel(
                    verbatimTextOutput("number")
                  )
))