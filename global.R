wiki_scrape_text <- function(url){
  
  isb0 = read_html(url)
  a0 = html_nodes(isb0, 'p')         # text only within paras
  a01 = as.character(a0)
  
  # cleanup and print
  a1 = a01 %>% 
    
    # drop html junk
    str_replace_all("\n"," ") %>%
    str_replace_all("<.*?>", "") %>%
    
    # collapse into one long string
    str_c(sep=" ", collapse="\n\n") #%>% 
  
  # for display with newline.
  #cat()  # Also for downloadable.
  
  return(a1)  
} # func ends




build_wiki_trend <- function(search_term1 = "Elon Musk", 
                             search_term2 = NULL,
                             start_date = "2018-01-01", 
                             end_date =  "2021-01-01"){
  
  # build 1st DF
  df1 = wp_trend(                       # func wp_trend() builds a data object - df1
    search_term1,                       # search term from UI
    from = start_date, to = end_date)
  
  # build 2nd DF
  if (is.na(search_term1))
  { 
    df = df1; next } else 
    {
      df2 = wp_trend(search_term2, from = start_date, to = end_date)
      df = rbind(df1, df2) 
    }
  
      
  
  
  return(df) } # func ends
