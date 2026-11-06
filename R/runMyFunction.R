#' Avvia un container Docker per eseguire una funzione R su una matrice.
#'
#' @param directory La cartella del computer che contiene i file e la matrice
#' @param input_name Il nome del file di input
#' @param output_name Il nome del file di output
#' @return Il codice di stato del comando di sistema
#' @export
runMyFunction <- function(directory, input_name, output_name = NULL) {

  dir_path <- sprintf('"%s"', normalizePath(directory, winslash = "/"))


  if (is.null(output_name)) {
    cmd <- sprintf("docker run --rm -v %s:/data -w /data myimage %s",
                   dir_path, input_name)
  } else {
    cmd <- sprintf("docker run --rm -v %s:/data -w /data myimage %s %s",
                   dir_path, input_name, output_name)
  }


  system(cmd)
}
