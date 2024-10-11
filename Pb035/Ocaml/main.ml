type 'a maillon = { content: 'a;
             mutable next: 'a maillon option;
             mutable prev: 'a maillon option }

type 'a list2 = { mutable first: 'a maillon option;
                  mutable last: 'a maillon option }

let setfirst (l : 'a list2) (el : 'a) =
  let ele = { content = el; next = l.first; prev = None } in
  (match l.first with
   | Some f -> f.prev <- Some ele
   | None -> l.first <- Some ele; l.last <- Some ele);
  l.first <- Some ele

let setLast (l : 'a list2) (el : 'a) =
  let ele = { content = el; next = None; prev = l.last } in
  (match l.last with
   | Some f -> f.next <- Some ele
   | None -> l.first <- Some ele; l.last <- Some ele);
  l.last <- Some ele


(*regarde si n est premier avec n plus grand que tout les elts de l 
	qui sont les nombres premier inférieur*)
let est_premier (l : 'a list2) n : bool =
	let rec aux m n =
		match m with 
		| None -> true
		| Some tmp -> if n mod tmp.content != 0 then aux tmp.next n
								else false in
	aux l.first n

let circular_next n pow : int =
	let tmp = n mod 10 in 
	(n - tmp) / 10 + tmp * pow

let circular_prime h n : int = 
	(*pow ne sert que dans circular_next pour eviter de le recalculer*)
	let pow = (Float.to_int (Float.pow 10. (Float.floor (Float.log10 (Float.of_int n))))) in
	let rec aux i acc = 
		if n == i then 
			match Hashtbl.find_opt h i with
			| Some _ -> acc
			| None -> 0
		else
			match Hashtbl.find_opt h i with
			| Some _ -> aux (circular_next i pow) (acc+1)
			| None -> 0
		in
	aux (circular_next n pow) 1

let nb_circular_primes_under_n n : int =
	let rec aux i l h acc = 
		if not (est_premier l i) then 
			aux (i+1) l h acc
		else
		begin 
			if i >= n then 
				acc
			else
			begin
				setLast l i;
				Hashtbl.add h i true;
				let tmp = circular_prime h i in
				if tmp <> 0 then begin
					(*Printf.printf "%d %d\n" i tmp;*)
					aux (i+1) l h (acc+tmp)
				end
				else
					aux (i+1) l h acc
			end
		end in
	aux 2 {first = None; last = None} (Hashtbl.create n) 0


let _ = 
	(*Printf.printf "%d\n" (nb_circular_primes_under_n 1000000)*)
	Printf.printf "%d\n" (nb_circular_primes_under_n 1000000)