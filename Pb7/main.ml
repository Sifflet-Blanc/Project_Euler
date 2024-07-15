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
		| Some tmp -> if n mod tmp.content != 0 then 
									true && aux tmp.next n
								else false in
	aux l.first n

let n_ieme_premier n : int =
	let rec aux i l n = 
		if not (est_premier l i) then 
			aux (i+1) l n
		else
		begin 
			if n <= 1 then 
				i
			else
			begin
				setLast l i;
				aux (i+1) l (n-1)
			end
		end in
	aux 2 {first = None; last = None} n


let _ = 
	Printf.printf "%d\n" (n_ieme_premier 10001)