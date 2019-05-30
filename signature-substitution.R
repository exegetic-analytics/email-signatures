library(glue)
library(purrr)
library(stringr)
library(dplyr)

people <- read.csv(text = "
name,title,cell,email
Andrew Collier,Senior Data Scientist,083 381 3655,andrew
Emma Collier,Doer of Many Things,073 805 7439,emma
Megan Beckett,Senior Data Scientist,082 686 3030,megan
Marinus Louw,Junior Data Scientist,083 385 2564,marinus
Gerard Walsh,Junior Data Scientist,082 497 8496,gerard
Ian Rogers,Senior Data Scientist,071 472 7478,ian
Monde Sinxi,Data Scientist,066 294 4388,monde
", stringsAsFactors = FALSE)
  
signature <- readLines("template-signature.html")

people %>%
  pwalk(function(name,title,cell,email) {
    label = str_split(name, " ")[[1]][1] %>% str_to_lower()
    html_file = paste0("signature-", label, ".html")
    
    signature = glue(paste(signature,collapse = "\n"))
    print(signature)
    
    writeLines(signature, html_file)
  })
