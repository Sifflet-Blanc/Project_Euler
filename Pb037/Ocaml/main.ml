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

let rec left_to_right h n : bool =
	let pow = (Float.to_int (Float.pow 10. (Float.floor (Float.log10 (Float.of_int n))))) in
	let tmp = n mod pow in
	match Hashtbl.find_opt h tmp with
	| Some _ -> if tmp < 10 then true else left_to_right h tmp
	| None -> false

let rec right_to_left h n : bool =
	let tmp = n/10 in
	match Hashtbl.find_opt h tmp with
	| Some _ -> if tmp < 10 then true else right_to_left h tmp
	| None -> false

let truncatable_prime h n : bool = 
	(left_to_right h n) && right_to_left h n

let sum_truncatable_prime_under_n n : int =
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
				if truncatable_prime h i then begin
					aux (i+1) l h (acc+i)
				end
				else
					aux (i+1) l h acc
			end
		end in
	aux 2 {first = None; last = None} (Hashtbl.create n) 0


let _ = 
	Printf.printf "%d\n" (sum_truncatable_prime_under_n 1000000)