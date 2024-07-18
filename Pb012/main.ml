type trig_num = {num : int; value : int}
(*ex {num = 7; val = 28}*)

let next_triangle_numbers n = 
    {num = n.num+1; value = n.value+n.num+1}

let printtri n =
    Printf.printf "%d %d\n" n.num n.value
    
let nombre_diviseur_de n = 
    let rep = ref 2 in
    for i = 2 to Float.to_int (Float.sqrt (Float.of_int n)) do 
        if (n mod i) == 0 then
            rep := !rep +2;
    done;
    !rep

let nombre_tri_avec_plus_de_n_div n =
    let tri = ref {num = 1; value = 1} in
    while (nombre_diviseur_de !tri.value) <= n do
        tri := next_triangle_numbers !tri;
    done;
    !tri.value    

let _ = 
  Printf.printf "%d\n" (nombre_tri_avec_plus_de_n_div 500)