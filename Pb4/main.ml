type paire = None| Paire of (int * int)

(*transformer le nombre en liste puis check si la liste est un palindrome *)

let numberToList n = 
	let rec aux l n = 
		if n > 0 then 
			aux ((n mod 10)::l) (n/10)
		else
			l
		in
	aux [] n

let rec palindrome_list l : bool = 
	match l with 
	| [] -> true
	| _::[] -> true
	| t1::q1 -> let r = List.rev q1 in
						match r with 
						| [] -> false (*impossible*)
						| t2::q2 -> if t1 == t2 then palindrome_list q2
												else begin false end

let palindrome_number (n : int) : bool = 
	palindrome_list (numberToList n)

let paireDe (n : int) : paire =
	let rep = ref None in
	for a = 999 downto 100 do 
		if n mod a == 0 && n/a > 100 && n / a < 999 && !rep == None then 
			rep := Paire (a, n/a)
	done;
	!rep

let nombreDe (p : paire) : int =
	match p with 
	| Paire (x, y) -> x*y
	| None -> 0

let rec paire_suiv (nb : int) : paire = 
	if nb > 0 then 
		let rep = paireDe(nb) in
		if rep <> None then rep
		else begin  paire_suiv (nb -1) end
	else
		None

let paire_suiv (nb : paire) : paire = 
	paire_suiv (nombreDe(nb) -1)

let _ = 
	let rec aux (n : paire) = 
		if palindrome_number (nombreDe n) then 
		begin
			match n with
			| Paire (x, y) -> Printf.printf "%d x %d = %d\n" x y (nombreDe n)
			| None -> Printf.printf "rien"
		end
		else
			aux (paire_suiv n) in
	aux (Paire (999, 999))