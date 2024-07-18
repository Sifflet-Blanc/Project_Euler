type triplet = { mutable a: int;
                  mutable b: int;
                  mutable c: int;}

let triplet_suiv (nb : triplet option)= 
	match nb with 
	| None -> None
	| Some n ->
		if (n.a +1) < (n.b -1) then
		begin 
			n.a <- n.a +1;
			n.b <- n.b -1;
			Some n
		end
		else
		begin 
			if n.c <= 0 then 
				None 
			else
			begin 
				n.c <- n.c -1;
				if n.c *2 -1 <= 1000 then
				begin
					n.b <- n.c -1;
					n.a <- 1000 - (n.c *2 -1);
					if n.a >= n.b then None 
					else Some n
				end
				else 
				begin 
					if 1000 - n.c < n.c then 
					begin
						n.b <- 1000 - n.c;
						n.a <- 0;
						Some n
					end
					else
					begin 
						None
					end
				end
			end
		end

let is_Pythagorean (n : triplet) =
	n.a * n.a + n.b * n.b == n.c * n.c

let printt (nb : triplet option)= 
	match nb with 
	| None -> Printf.printf "None\n"
	| Some n -> Printf.printf "%d %d %d = %d\n" n.a n.b n.c (n.a + n.b + n.c)

let find_rep : triplet = 
	let rec aux n : triplet =
		match n with 
		| None -> {a = 0; b = 0; c = 0}
		| Some x -> if is_Pythagorean x then x else aux (triplet_suiv n) in
	let nb = Some {a = 0; b = 0; c = 1000} in 
	aux nb

let _ =
	let nb = find_rep in
	Printf.printf "%d\n" (nb.a * nb.b * nb.c)