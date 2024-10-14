type 'a maillon = { content: 'a;
             mutable next: 'a maillon option;
             mutable prev: 'a maillon option }

type 'a list2 = { mutable first: 'a maillon option;
                  mutable last: 'a maillon option }

let setfirst (l : 'a list2) (el : 'a) =
  let ele = { content = el; next = l.first; prev = None } in
  (match l.first with
   | Some f -> f.prev <- Some ele
   | None -> l.last <- Some ele);
  l.first <- Some ele

let setLast (l : 'a list2) (el : 'a) =
  let ele = { content = el; next = None; prev = l.last } in
  (match l.last with
   | Some f -> f.next <- Some ele
   | None -> l.first <- Some ele;);
  l.last <- Some ele

let rmFirst (l : 'a list2) : unit =
	let ele = l.first in
	match ele with 
	| Some el ->
			(match el.next with 
			| Some el_next ->
				l.first <- el.next;
				el_next.prev <- None
			| None ->
				l.first <- None;
				l.last <- None)
	| None -> ()

let rmLast (l : 'a list2) : unit =
	let ele = l.last in
	match ele with 
	| Some el ->
			(match el.prev with 
			| Some el_prev ->
				l.last <- el.prev;
				el_prev.next <- None
			| None ->
				l.last <- None;
				l.first <- None)
	| None -> ()

(*transformer le nombre en liste puis check si la liste est un palindrome *)

let numberToList n = 
	let l = {first = None; last = None} in
	let rec aux n = 
		if n > 0 then begin 
			setfirst l (n mod 10);
			aux (n/10)
		end
		else
			l
		in
	aux n

let rec palindrome_list l : bool = 
	match l.first, l.last with
	| Some x, Some y ->
				if x.content <> y.content then
					false
				else begin
					rmFirst l;
					rmLast l;
					palindrome_list l
				end
	| None, None -> true
	| _, _ -> Printf.printf "Erreur : situation simpossible\n"; false

let palindrome_number (n : int) : bool = 
	palindrome_list (numberToList n)