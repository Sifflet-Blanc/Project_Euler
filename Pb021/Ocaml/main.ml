type trig_num = {num : int; value : int}
(*ex {num = 7; val = 28}*)

let next_triangle_numbers n =
    {num = n.num+1; value = n.value+n.num+1}

let printtri n =
    Printf.printf "%d %d\n" n.num n.value
   
let diviseur_de n =
    let l = ref [1] in
    for i = 2 to Float.to_int (Float.sqrt (Float.of_int n)) do
        if (n mod i) == 0 then
            l := i::(n/i):: !l
    done;
    !l
   
let sum l =
    let rec aux l acc =
        match l with
        | [] -> acc
        | t::q -> aux q (t+acc) in
    aux l 0

let rec printl l =
    match l with
    | [] -> Printf.printf "\n"
    | t::q -> Printf.printf "%d, " t; printl q
   
let somme_nombre_amicable_inf_a n =
    let rep = ref 0 in
    for i = 1 to n-1 do
        let tmp = sum (diviseur_de i) in
        if tmp <> i && sum (diviseur_de tmp) == i then begin
            Printf.printf "%d %d\n" i tmp;
            rep := !rep + i
        end
    done;
    !rep

let _ =
    Printf.printf "%d\n" (somme_nombre_amicable_inf_a 10000)