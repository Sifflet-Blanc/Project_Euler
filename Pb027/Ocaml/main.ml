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
let est_premier (l : 'a list2) (n : int) : bool =
    let rec aux m n =
        match m with 
        | None -> true
        | Some tmp -> if n == tmp.content then true 
                    else begin 
                        if n mod tmp.content != 0 then aux tmp.next n
                        else false 
                    end in
    aux l.first n

let list_of_prime_inf_at_n (n : int) : int list2 =
    let rec aux i l n = 
        if not (est_premier l i) then 
            aux (i+1) l n
        else
        begin 
            if n <= i then 
                l
            else
            begin
                setLast l i;
                aux (i+1) l n
            end
        end in
    aux 2 {first = None; last = None} n

let loop_size (n : int) (l : int list) =
    let rec aux n l acc =
        match l with
        | [] -> 0
        | t::q -> if t == n then acc 
                else aux n q (acc+1)
        in
    aux n l 1


let decimal (d : int) =
    (*n/d*)
    let rec aux n d (n_already_seen : int list) limit =
        if n == 0 then 
            0
        else begin 
            if List.exists (fun x -> x==n) n_already_seen then 
                loop_size n n_already_seen
            else
                aux ((n - (n/d)*d)*10) d (n::n_already_seen) (limit -1)
        end in
    aux 1 d [] 10

let streak_of_prime l a b =
    let rec aux a b n =
        if est_premier l (n*n + a*n + b) then 
            aux a b (n+1)
        else n in
    aux a b 0

let _ =
    let max = ref 0 in
    let rep = ref 0 in
    let l = list_of_prime_inf_at_n 10000 in
    for b = 1 to 1001 do 
        if est_premier l b then begin 
            for a = -999 to 999 do
                let tmp = streak_of_prime l a b in
                if tmp > !max then begin 
                    max := tmp;
                    rep := a*b
                end
            done
        end
    done;
    Printf.printf "%d\n" !rep