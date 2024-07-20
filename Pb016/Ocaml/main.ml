(* l est une liste de nombre representant un entier*)
let power2 l =
    let rec aux l rep retenue =
        match l with
        | [] when retenue <> 0 -> aux [] (retenue::rep) 0
        | [] -> List.rev rep
        | t::q -> aux q (((t*2+retenue) mod 10)::rep) ((t*2+retenue)/10) in
    aux l [] 0

let rec printl l =
    match l with 
    | [] -> Printf.printf "\n"
    | t::q -> printl q; Printf.printf "%d " t
    
let som_l l = 
    let rec aux l acc = 
        match l with
        | [] -> acc
        | t::q -> aux q (acc+t) in
    aux l 0

let two_pow_1000 : int list =
    let l = ref [1] in
    for i = 1 to 1000 do 
        l := power2 !l;
    done;
    !l

let _ = 
    Printf.printf "%d\n" (som_l two_pow_1000)