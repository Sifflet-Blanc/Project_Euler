let sum_of_fifth_power_of_digit n : bool =
    let rec aux n acc =
        if n == 0 then 
            acc
        else 
            let a = n mod 10 in
            aux (n/10) (a*a*a*a*a+acc) in
    n == aux n 0

let _ =
    let rep = ref 0 in
    for i = 2 to 999999 do
        if sum_of_fifth_power_of_digit i then 
            rep := !rep +i
    done;
    Printf.printf "%d\n" (!rep)