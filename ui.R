library(dplyr)
library(shiny)
library(rvest)
library(magrittr)
library(stringr)
library(DT)
library(wikipediatrend)
library(ggplot2)

shinyUI(fluidPage(
  
  title = "Wiki Scraper App",
  titlePanel(title=div(img(src="logo.png",align='right'),"Wiki Scraper App")),
  sidebarPanel(
    conditionalPanel(condition = "input.tabselected==1",
               textInput("url","Enter URL",value = NA)
  ),
  conditionalPanel(condition =  "input.tabselected==2",
                   
                   textInput("search_1","Enter Search Term-1"),
                   textInput("search_2","Enter Search Term-2",value = NULL),
                   textInput("st_dt","Enter Start Date (yyyy-mm-dd)"),
                   textInput("end_dt","Enter End Date (yyyy-mm-dd)"),
                   actionButton("show","Show Trends")
                   
                   )
  ),
  mainPanel(
    # recommend review the syntax for tabsetPanel() & tabPanel() for better understanding
    # id argument is important in the tabsetPanel()
    # value argument is important in the tabPanle()
    tabsetPanel(
      tabPanel("Overview",value=1,
               includeMarkdown("overview.md")
      ),
      tabPanel("Output Text",value=1,
               h5("Download Data"),
               downloadButton("dwnld","Download Data"),
               hr(),
               h5("Scraped Text"),
               verbatimTextOutput("s_text")
           
               
      ),
      tabPanel("Wiki Trend Analysis",value = 2,
               h5("Trend Plot"),
               plotOutput("t_plot"),
               hr(),
               h5("Trends Dataframe"),
               downloadButton("dwnld2","Download Data"),

               DT::dataTableOutput("t_df")
               ),id = "tabselected"
      
    )
  )
))

