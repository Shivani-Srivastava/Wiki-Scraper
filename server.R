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
  
  #----Wiki Trends
 observeEvent(input$show,{
    
   x1 <- build_wiki_trend(search_term1 = input$search_1,
                     search_term2 = input$search_2,
                     start_date = input$st_dt,
                     end_date = input$end_dt)
   output$t_plot <- renderPlot({
     p <- ggplot(x1) + 
       geom_line(aes(x = date, y = views, 
                     colour = article)) +
       scale_colour_manual(values = c("red", "blue")) 
     p
   })
   output$t_df <- renderDataTable({
     #req(t_df())
     DT::datatable({x1},
                   server = FALSE,
     extensions = 'Buttons',

                            options = list(
                                paging = TRUE,
                                searching = TRUE,
                                fixedColumns = TRUE,
                                autoWidth = TRUE,
                                ordering = TRUE,
                                dom = 'tB',
                                buttons = c('copy', 'csv', 'excel')
                            ),

                            class = "display")
   })
   
   output$dwnld2 <- downloadHandler(
    filename = function(){
      paste("search-trends-", Sys.Date(), ".txt", sep = "")
    },
    content = function(file) {
      writeLines(paste(x1, collapse = ", "), file)
      # write.table(paste(text,collapse=", "), file,col.names=FALSE)
    }
  )
 })
   


  
})
