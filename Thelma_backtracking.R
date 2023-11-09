backtracking <- function(x, y) {
  k <- 0
  cb_initial <- integer(x)
  
  est_valide <- function(cb, colonne, ligne) {
    # Vérifie si une dame peut être placée dans la colonne/ligne spécifiée
    i <- 1
    while (i < colonne) {
      if (cb[i] == ligne || 
          cb[i] - i == ligne - colonne || 
          cb[i] + i == ligne + colonne) {
        return(FALSE)
      }
      i <- i + 1
    }
    return(TRUE)
  }
  
  placer_dames <- function(cb, colonne = 1) {
    if (colonne > x) {
      k <<- k + 1
      print(cb)
    } else {
      ligne <- 1
      while (ligne <= y) {  # Utilisez y pour le nombre de colonnes
        if (est_valide(cb, colonne, ligne)) {
          cb[colonne] <- ligne
          placer_dames(cb, colonne + 1)
        }
        ligne <- ligne + 1
      }
    }
  }
  
  placer_dames(cb_initial)
  cat("Nombre de k trouvées:", k, "\n") #Affiche le nombre total de solutions trouvées.
  
  
  # Création du heatmap pour visualiser les cases les plus touchées
  
  plateau <- matrix(0, nrow = x, ncol = y) # Création de la matrice de dimensions x par y remplie de zéros
  for (col in 1:x) {
    row <- cb_initial[col]
    plateau[row, col] <- plateau[row, col] + 1
    for (i in 1:x) {
      if (i != col) {
        # Attaques horizontales et diagonales
        
        plateau[cb_initial[i], col] <- plateau[cb_initial[i], col] + 1 #Incrémente le nombre d'attaques sur la case correspondante dans la matrice
        
        if (cb_initial[i] + (col - i) > 0 && cb_initial[i] + (col - i) <= y) {
          plateau[cb_initial[i] + (col - i), col] <- plateau[cb_initial[i] + (col - i), col] + 1
        }
        if (cb_initial[i] - (col - i) > 0 && cb_initial[i] - (col - i) <= y) {
          plateau[cb_initial[i] - (col - i), col] <- plateau[cb_initial[i] - (col - i), col] + 1
        }
      }
    }
  }
  
  #Création du heatmap avec la bibliothèque gplots
  
  heatmap(as.matrix(plateau), Rowv = NA, Colv = NA, col = heat.colors(12), scale = "column",
          main = "Backtracking", xlab = "Colonnes", ylab = "Lignes",
          revC = TRUE, symm = TRUE)
}

# Lancement de la fonction principale
backtracking(4, 4)



