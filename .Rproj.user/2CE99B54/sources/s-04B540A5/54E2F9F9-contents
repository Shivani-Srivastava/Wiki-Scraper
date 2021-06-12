library(dplyr)
shinyUI(fluidPage(
  
  title = "Wiki Scraper App",
  titlePanel(title=div(img(src="logo.png",align='right'),"Wiki Scraper App")),
  sidebarPanel(
               textInput("url","Enter URL",value = NA)
  ),
  mainPanel(
    # recommend review the syntax for tabsetPanel() & tabPanel() for better understanding
    # id argument is important in the tabsetPanel()
    # value argument is important in the tabPanle()
    tabsetPanel(
      tabPanel("Overview",
               includeMarkdown("overview.md")
      ),
      tabPanel("Output Text",
               h5("Download Data"),
               downloadButton("dwnld","Download Data"),
               hr(),
               h5("Scraped Text"),
               verbatimTextOutput("s_text")
           
               
      )
      
      
    )
  )
))

