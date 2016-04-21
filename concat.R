#!/usr/bin/env Rscript

read_data <- function() {
	files = sort(list.files(path='data/raw', patter='*.csv', full.names=TRUE), decreasing = TRUE)

	data = (lapply(files, read.csv, sep = ';'))[[1]]

	colnames(data) <- c("datetime", "open", "high", "low", "close", "return")

	return (data)
}

count_vals <- function(values, column) {
	binary <- 1:nrow(values)
	for (i in 2:nrow(values)) {
		increment <- values[i, column] - values[i-1, column]
		binary[i] = if (increment < 0) -1 else if (increment > 0) 1 else 0
	}
	return (binary)
}
