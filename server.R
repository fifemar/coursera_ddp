library(shiny)
library(RColorBrewer)
library(wordcloud)

shinyServer(function(input, output) {  
  output$wordcloud.example <- renderPlot({
    wordcloud(c(letters, LETTERS, 0:9), seq(1, 1000, len = 62))
  })
  
  output$contents <- renderTable({
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)

    read.csv(inFile$datapath)
  })


output$wordcloudPlot <- renderPlot({
  inFile <- input$file1 
  if (is.null(inFile))
    return(NULL)
  chart_dt <- read.csv(inFile$datapath)

  pal2 <- brewer.pal(8, "Dark2") #set color type
  
  #create word cloud
  wordcloud(chart_dt$word, chart_dt$freq, scale = c(5, 0.5), min.freq = input$min.freq, max.words = Inf, 
            random.order = FALSE, rot.per = 0.15, colors = pal2)

})

})