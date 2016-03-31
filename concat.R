#!/usr/bint/env Rscript

read_data <- function() {
	#TODO Sort file names alpha
	files = list.files(path='data/raw', patter='*.csv', full.names=TRUE)

	return(lapply(files, read.csv, sep = ';'))
}

