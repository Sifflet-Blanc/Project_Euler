let rec add_a_int (l : int list) (a : int) = 
    match l with 
    | [] when a <> 0 -> (a mod 10)::(add_a_int [] (a/10))
    | [] -> []
    | t::q -> 
        let tmp = t + a in
        (tmp mod 10)::(add_a_int q (tmp/10))

let add (l1 : int list) (l2 : int list) : int list =
    let rec aux l1 l2 ret = 
        match l1,l2 with
        | [], x -> add_a_int x ret
        | x, [] -> add_a_int x ret
        | t1::q1, t2::q2 ->
            let tmp = t1 + t2 + ret in 
            (tmp mod 10)::(aux q1 q2 (tmp/10)) in
    aux l1 l2 0

let mult_by_int (l : int list) (a : int) : int list= 
    let rec aux l a ret = 
        match l with
        | [] when ret <> 0 -> (ret mod 10)::(add_a_int [] (ret/10))
        | [] -> []
        | t::q -> let tmp = t*a + ret in 
            (tmp mod 10)::(aux q a (tmp/10)) in
    aux l a 0

let rec printl l =
    match l with
    | [] -> ()
    | t::q -> printl q; Printf.printf "%d" t

let printlln l =
    printl l;
    Printf.printf "\n"