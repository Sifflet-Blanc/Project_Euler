let flot_eq a b = 
    abs_float (a -. b) < 1e-9

let scan_b (a : float) (l : (float*float) list) (n : float) =
    let rec aux a b l = 
        if b <= n then begin
            if not (List.exists (fun (x,y) -> flot_eq (log(a) *. b) (x *. y) ) l) then
                aux a (b +. 1.) ((log(a), b)::l)
            else
                aux a (b +. 1.) l
        end
        else l in
    aux a 2. l

let scan_a (n : float) =
    let rec aux a l = 
        if a <= n then 
            aux (a +. 1.) (scan_b a l n)
        else l in
    aux 2. []

let len l = 
    let rec aux l acc = 
        match l with 
        | [] -> acc
        | _::q -> aux q (acc+1) in
    aux l 0

let _ =
    Printf.printf "%d\n" (len (scan_a 100.))