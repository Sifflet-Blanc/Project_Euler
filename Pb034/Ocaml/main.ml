let rec facto n : int =
    if n = 0 then 
        1
    else
        n * facto (n-1)

let fact_tab : int list= 
    [facto 0; facto 1; facto 2; facto 3; facto 4; facto 5; facto 6; facto 7; facto 8; facto 9]

let rec nth_elt l n : int =
    match l with
    | [] -> -1
    | t::q -> if n = 0 then t else nth_elt q (n-1)

let eq_to_sum_of_factorial_of_digit n l : bool =
    let rec aux n acc =
        if n == 0 then 
            acc
        else 
            let a = n mod 10 in
            aux (n/10) ((nth_elt l a)+acc) in
    n == aux n 0

let _ =
    let rep = ref 0 in
    let l = fact_tab in
    for i = 10 to 99999 do
        if eq_to_sum_of_factorial_of_digit i l then 
            rep := !rep +i
    done;
    Printf.printf "%d\n" (!rep)