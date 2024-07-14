let somOfSquareFrom n : int = 
	let rec aux n acc = 
		if n == 1 then 
			(acc+1)
		else
			aux (n-1) (acc + n*n) in
	aux n 0

let squareOfSomFrom n : int = 
	let rec aux n acc = 
		if n == 1 then 
			(acc+1)
		else
			aux (n-1) (acc + n) in
	let rep = aux n 0 in
	(rep * rep)

let _ = 
	let a = somOfSquareFrom 100 in
	let b = squareOfSomFrom 100 in
	Printf.printf "%d\n" (b - a)