module IntMap = Map.Make(Int)

let suivant_collatz n : int =
    if n mod 2 == 0 then 
        n/2
    else 3*n+1

(*tab contien en i la longeur de la sequence collazt commencant par i*)
let rec length_of_collatz_sequence_of_number n tab: int = 
    let opt = IntMap.find_opt n !tab in
    match opt with
    | Some x -> x
    | None -> (let x = length_of_collatz_sequence_of_number (suivant_collatz n) tab in
                tab := IntMap.add n (x+1) !tab;
                (x+1))


let longest_collatz_sequence =
    let tab = ref IntMap.empty in
    tab := IntMap.add 1 1 !tab;
    let max = ref 1 in
    let max_key = ref 1 in
    for i = 1 to 999999 do
        let tmp = length_of_collatz_sequence_of_number i tab in
        (*Printf.printf "%d %d\n" i tmp;*)
        if tmp > !max then begin
            max := tmp;
            max_key := i
        end
    done;
    !max_key

let _ = 
    Printf.printf "%d\n" (longest_collatz_sequence)
