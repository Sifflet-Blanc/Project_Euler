(* l est une liste de nombre representant un entier*)
let l_mult_by_n (l : int list) (n : int) =
    let rec aux l rep retenue =
        match l with
        | [] when retenue <> 0 -> aux [] ((retenue mod 10)::rep) (retenue/10)
        | [] -> List.rev rep
        | t::q -> aux q (((t*n+retenue) mod 10)::rep) ((t*n+retenue)/10) in
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

let factoriel n =
    let rep = ref [1] in
    for i = 1 to n do
        rep := l_mult_by_n !rep i
    done;
    !rep

let _ = 
    Printf.printf "%d\n" (som_l (factoriel 100))