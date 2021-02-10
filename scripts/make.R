
args <- commandArgs(trailingOnly = TRUE);

options(bookdown.render.file_scope = FALSE);

target <- args[1];

if (target == "pdf") {
  bookdown::render_book(here::here("index.Rmd"),
    output_format = "bookdown::pdf_book",
    output_dir = "out/pdf");
  file.remove(list.files(
    pattern = "*.(log|mtc|maf|aux|bcf|lof|lot|out|toc|acn|glo|ist)"))
  browseURL(here::here("out", "_main.pdf"))
} else if (target == "gitbook") {
  bookdown::render_book(here::here("index.Rmd"),
    output_format = "bookdown::gitbook",
    output_dir = "out/gitbook");
  
  file.create(here::here("out", "gitbook", ".nojekyll"));
    browseURL(here::here("out", "gitbook", "index.html"));
} else if (target == "bs4book") {
  bookdown::render_book(here::here("index.Rmd"),
    output_format = "bookdown::bs4book",
    output_dir = "out/bs4book");
  file.create(here::here("out", "bs4book", ".nojekyll"));
    browseURL(here::here("out", "bs4book", "index.html"));
} else if (target == "word") {
  bookdown::render_book(here::here("index.Rmd"),
    output_format = "bookdown::word_document2",
    output_dir = "out/word");
    browseURL(here::here("out","word", "_main.docx"))
} else if (target == "clean") {
    file.remove(list.files(pattern = "*.(docx|html|pdf|log|maf|mtc|tex|toc|out|lof|lot|bcf|aux)"))
    unlink(list.files(pattern = "*_(files|cache)"), recursive = TRUE)
} else {
    stop("Invalid target")
}
