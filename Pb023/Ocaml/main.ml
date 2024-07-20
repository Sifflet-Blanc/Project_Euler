let diviseur_de (n : int) : int list=
    let l = ref [1] in
    for i = 2 to Float.to_int (Float.sqrt (Float.of_int n)) do
        if (n mod i) == 0 then begin
            if i <> n/i then
                l := i::(n/i):: !l
            else
                l := i:: !l
        end
    done;
    !l
   
let sum (l : int list) : int =
    let rec aux l acc =
        match l with
        | [] -> acc
        | t::q -> aux q (t+acc) in
    aux l 0

let rec printl (l : int list) : unit=
    match l with
    | [] -> Printf.printf "\n"
    | t::q -> Printf.printf "%d, " t; printl q
   
let is_abundant (n : int) : bool =
    n < sum (diviseur_de n)

let rec in_list (l : int list) (n : int) : bool=
    match l with
    | [] -> false
    | t::q -> if t == n then true else in_list q n

(*l int list contenant les nombres abundant inferieur*)
let is_sum_of_two_abundant (n : int) (l : int list) : bool =
    let rec aux l n invariant =
        match l with
        | [] -> false
        | t::q -> if in_list invariant (n-t) then
                    true
                else aux q n invariant in
    aux l n l
   
let sum_of_non_abundant_sum : int =
    let rep = ref 0 in
    let l_of_abundant = ref [] in
    for i = 1 to 28123 do
        if (is_abundant i) then
            l_of_abundant := i:: !l_of_abundant;
        if not (is_sum_of_two_abundant i !l_of_abundant) then
            rep := !rep + i
    done;
    !rep

let _ =
    Printf.printf "%d\n" (sum_of_non_abundant_sum)