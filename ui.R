library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Wordcloud"),
  sidebarPanel(
    fileInput("file1", 'Upload CSV File - contain 2 columns, named "word" and "freq"',
              accept=c('text/csv', 'text/comma-separated-values,text/plain')),
    numericInput("min.freq", "Min freq to fliter out:", 3),
    helpText("Note: To create a word cloud chart. You should prepare a csv file contains 2 columes",
             "named 'word' and 'freq' (all should be small letters). 'word' is the column contains all words you want to show",
             "'freq' is the colume contains word frequency.")
    
  ),
  mainPanel(
    h4("Example"),
    plotOutput("wordcloud.example"),
    h4("Upload CSV"),
    tableOutput("contents"),
    h4("Output wordcloud chart"),
    plotOutput("wordcloudPlot")
  )
))