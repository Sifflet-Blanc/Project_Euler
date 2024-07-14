let divisible_1_m n m : bool = 
	let rep = ref true in 
	for i = m downto 1 do
		rep := !rep && (n mod i) == 0
	done;
	!rep

let _ = 
	let rep = ref 20 in
	while not (divisible_1_m !rep 20) do 
		rep := !rep + 20
	done;
	Printf.printf "%d\n" !rep