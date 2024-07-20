let chemin_possible hauteur dist_arrivee =
    if Int.abs hauteur == dist_arrivee then
        [-hauteur/hauteur]
    else [-1; 1]

(*dist_arrivee = cote*cote pour le probleme décrit (pour un carre dont l'arrivée 
est en bas a droite et le depart en haut a gauche*)
let compte_chemin_possible dist_arrivee = 
    let rec aux hauteur dist_arrivee = 
        if dist_arrivee == 1 then 1
        else appel (chemin_possible hauteur dist_arrivee) hauteur dist_arrivee 0
    and appel l hauteur dist_arrivee acc = 
        match l with 
        | [] -> acc
        | t::q -> appel q hauteur dist_arrivee (acc + (aux (hauteur + t) (dist_arrivee-1))) in
    aux 0 dist_arrivee

let _ = 
    Printf.printf "%d\n" (compte_chemin_possible (20*20))
