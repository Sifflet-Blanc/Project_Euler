let suivant_collatz n : int =
    if n mod 2 == 0 then 
        n/2
    else 3*n+1

(*tab contien en i la longeur de la sequence collazt commencant par i*)
let rec length_of_collatz_sequence_of_number n tab: unit = 
    if Option.is_none (Map.find_opt n tab) then begin 
        let suiv_n = suivant_collatz n in
        let tmp = length_of_collatz_sequence_of_number suiv_n in
        match tmp with
        | Some x -> Map.add n (x+1) tab; Some x+1
        | None -> Printf.printf "Impossible"
    end

let longest_collatz_sequence =
    let tab = Map.empty in
    Map.add 1 1 tab;
    let max = ref 1 in
    for i = 1 to 13 do
        let tmp = length_of_collatz_sequence_of_number i tab in
        match tmp with 
        | Some t -> if t > !max then max := t
        | None -> ()
    done;
    !max

let _ = 
    Printf.printf "%d\n" (longest_collatz_sequence)
