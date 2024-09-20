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

let rec add_end (n : int) (l : int list) : int list =
    match l with 
    | [] -> [n]
    | t::q -> t :: add_end n q

(*l int list contenant les nombres abundant inferieur*)
let rec is_sum_of_two_abundant (n : int) (l : int list) : bool =
    match l with
    | [] -> false
    | t::q -> if t > n/2 then false 
        else begin 
            if in_list l (n-t) then
                true
            else is_sum_of_two_abundant n q
        end 
   
let sum_of_number_witch_isnt_sum_of_two_abundant : int =
    let rep = ref 0 in
    let l_of_abundant = ref [] in
    for i = 1 to 28123 do
    (*for i = 1 to 24 do*)
        if i mod 1000 == 0 then begin 
            ignore (Sys.command "clear");
            Printf.printf "%d/28\n" (i/1000);
            flush stdout
        end;
        if (is_abundant i) then
            l_of_abundant := add_end i !l_of_abundant;
        if not (is_sum_of_two_abundant i !l_of_abundant) then
            rep := !rep + i
    done;
    ignore (Sys.command "clear");
    !rep

let _ =
    Printf.printf "%d\n" (sum_of_number_witch_isnt_sum_of_two_abundant)