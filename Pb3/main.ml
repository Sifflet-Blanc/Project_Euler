let plus_grand_diviseur n : int =
	let rec aux (nb : int) (div : int) : int =
		if nb = 1 then
			div
		else
		begin 
			if (nb mod div) != 0 then 
			begin 
				aux nb (div+1)
			end
			else
			begin
				aux (nb / div) div
			end
		end in
	aux n 2

let _ = 
	let number = 600851475143 in
	Printf.printf "%d\n"(plus_grand_diviseur number)