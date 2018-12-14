library(tidyverse)

tasks <- map(snakemake@input$tasks, function(file) {
    task <- yaml::read_yaml(file)
    task$id <- dirname(file) %>% gsub(".*/([^/]*)", "\\1", .)

    task
})

jsonlite::write_json(tasks, snakemake@output[[1]])