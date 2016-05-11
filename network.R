#!/usr/bin/env Rscript
library(neuralnet)

forecast <- function(data) {

	prev = 0

	train <- data[1:40,]

	# Musí obsahovať iba vstupné parametre
	test <- data[20:100, c("open", "high", "low", "close")]

	for (i in 2:nrow(train)) { train[i, 'bull'] = train[i, 'close'] > train[i-1, 'close'] }

	nn <- neuralnet(bull ~ open + high + low + close, train, hidden = c(3,5))

	res <- compute(nn, test)

	d <- apply(res$net.result, 1, function(d) { return(round(d)) })

	return(d)
}
