(*dist_arrivee = cote*cote pour le probleme décrit (pour un carre dont l'arrivée 
est en bas a droite et le depart en haut a gauche*)
let compte_chemin_possible dist_arrivee = 
    let rec aux hauteur dist_arrivee : int = 
        if hauteur < 0 then 0
        else begin 
            if dist_arrivee == 1 || Int.abs hauteur == dist_arrivee then 1
            else begin 
                let a = aux (hauteur + 1) (dist_arrivee-1) in
                let b = aux (hauteur - 1) (dist_arrivee-1) in
                if hauteur == 0 then 
                    (a + b)*2
                else
                    a + b
            end
        end in
    aux 0 dist_arrivee

let _ = 
    let n = 20 in
    Printf.printf "%d\n" (compte_chemin_possible (2*n))
