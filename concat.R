#!/usr/bint/env Rscript

read_data <- function() {
	files = sort(list.files(path='data/raw', patter='*.csv', full.names=TRUE), decreasing = TRUE)

	return(lapply(files, read.csv, sep = ';'))
}

