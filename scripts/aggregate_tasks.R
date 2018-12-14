library(tidyverse)

tasks <- map(snakemake@input$tasks, function(file) {
  task <- yaml::read_yaml(file)
  task$id <- dirname(file) %>% gsub(".*/([^/]*)", "\\1", .)
  
  task$framework_ids <- snakemake@input$examples %>% 
    keep(grepl, pattern = paste0("/", task$id, "/")) %>% 
    dirname() %>%
    gsub(".*/.*/([^/]*)", "\\1", .)
  
  task
})

jsonlite::write_json(tasks, snakemake@output[[1]])