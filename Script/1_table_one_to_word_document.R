# Exporting table 1 tp word document

# link to article
# https://ardata-fr.github.io/officeverse/officer-for-word.html


library(officer)
library(magrittr)
library(officedown)


# Generating a word document

doc_1 <- read_docx() %>%
  body_add_par("Hello world!", style = "Normal") %>%
  body_add_table(iris, style = "table_template")

print(doc_1, target = "reports/example_1.docx")


# Using a template path
doc_2 <- read_docx(path = "templates/JAMA_Word_Template.docx") %>%
  body_add_par("Hello world!", style = "Normal") %>%
  body_add_table(head(iris), style = "Table Professional")

print(doc_2, target = "reports/example_2.docx")



# getting styles info
styles_info(doc_2)
