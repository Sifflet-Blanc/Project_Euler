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


let _ =
    let max = ref 0 in
    let rep = ref 0 in
    for i = 2 to 1000 do
        let tmp = decimal i in
        if tmp > !max then begin 
            max := tmp;
            rep := i
        end
    done;
    Printf.printf "%d\n" !rep