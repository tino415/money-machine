#!/usr/bint/env Rscript

read_data <- function() {
	files = list.files(path='data/raw', patter='*.csv', full.names=TRUE)

	return(lapply(files, read.csv))
}

