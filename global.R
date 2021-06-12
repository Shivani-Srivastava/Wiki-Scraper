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