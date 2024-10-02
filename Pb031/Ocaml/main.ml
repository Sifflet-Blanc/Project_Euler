
let rec count_posibility n l =
    if n == 0 then 1
    else
        match l with 
        | [] -> 0
        | t::[] -> if n mod t == 0 then 1 else 0
        | t::q -> 
                let rep = ref (count_posibility n q) in 
                let n1 = ref (n-t) in 
                while !n1 >= 0 do
                    rep := !rep + (count_posibility !n1 q);
                    n1 := !n1 - t
                done;
                !rep

let _ =
    let l = [200; 100; 50; 20; 10; 5; 2; 1] in
    Printf.printf "%d\n" (count_posibility 200 l)