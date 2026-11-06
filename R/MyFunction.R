#' Funzione che analizza i valori mancanti e li sostituisce con la mediana della colonna
#' @param input_file Inserisco il file di input
#' @param output_file E' il file di output che restituisce la funzione
#' @return Riporta solamente la somma dei valori mancanti e la percentuale
#' @export
imputeColumns <- function(input_file, output_file="output.csv") {

  mat <- as.matrix(readMM(input_file))
  n_missing <- sum(is.na(mat))
  missing_percentage <- 100*n_missing/length(mat)

  for (j in seq_len(ncol(mat))) {
    col_data <- mat[,j]
    if (any(is.na(col_data))) {
      med_val <- median(col_data, na.rm = TRUE)
      mat[is.na(mat[,j]),j] <- med_val
    }
  }

  write.csv(mat, file = output_file, row.names = FALSE)

  return(list(n_missing = n_missing, missing_percentage = missing_percentage))


  }

library(Matrix)
