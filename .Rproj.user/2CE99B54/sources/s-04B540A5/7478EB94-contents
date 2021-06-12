shinyServer(function(input,output,session){
  
  x1 <- reactive({
    req(input$url)
    url <- input$url
    x1 <- wiki_scrape_text(url)
    x1
  })
  
  output$s_text <- renderPrint({
    cat(x1())
  })
  
  output$dwnld <- downloadHandler(
    filename = function(){
      paste("scraped_text-", Sys.Date(), ".txt", sep = "")
    },
    content = function(file) {
      writeLines(paste(x1(), collapse = ", "), file)
      # write.table(paste(text,collapse=", "), file,col.names=FALSE)
    }
  )
  
  
})