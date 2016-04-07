#!/usr/bin/env Rscript

read_data <- function() {
	files = sort(list.files(path='data/raw', patter='*.csv', full.names=TRUE), decreasing = TRUE)

	data = as.matrix((lapply(files, read.csv, sep = ';'))[[1]])

	colnames(data) <- c("datetime", "open", "high", "low", "close", "return")

	return (data)
}

