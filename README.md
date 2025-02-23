# 1

kostka = function(n) {
	if (n <= 0) {
		print(“Liczba rzutów musi być większa niż 0.")
	}
	return(sample(1:6, n, replace = TRUE))
}

# 2

wektor = function(n) {
	if (n <= 0) {
		print("Długość wektora musi być większa od 0.")
	}
	return(1:n)
}
