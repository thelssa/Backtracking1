## 1-Définition du langage R

Le langage R est un langage de programmation et un environnement logiciel utilisés principalement pour la statistique, l'analyse de données, et la visualisation. 

Pour l'utliser, il est judicieux d'installer les logiciel R et Rstudio

## 2- Installation de R et Rstudio

### a- Installation R

- Commencer par installe R à l'aide du lien: https://cran.r-project.org/
- Choisissez le miroir (mirror) le plus proche de votre emplacement
- Sélectionnez la version de R appropriée pour votre système d'exploitation (Windows, macOS, ou Linux) et téléchargez le fichier d'installation. Suivez les instructions d'installation fournies sur le site.

### b- Installation RStudio

Par la suite:
- Téléchargement de RStudio : Rendez-vous sur le site de RStudio (https://www.rstudio.com/products/rstudio/download/) et téléchargez la version gratuite de RStudio Desktop.
- Sélectionnez la version compatible avec votre système d'exploitation et suivez les instructions d'installation.
- Lancement de RStudio : Une fois l'installation terminée, lancez RStudio. Il devrait automatiquement détecter l'installation de R sur votre système.

## 3- Installation des librairies nécessaire pour le projet

Pour visualiser le headmap il est judicieux d'insataller gplots ()
ave la syntaxe suivante: **_install.packages("ggplot2")_**

**Listes des librairies**
voir documentation R: https://fr.wikibooks.org/wiki/Programmer_en_R/Installer_des_librairies

ℹ️ **Info:** Pour éviter des imprévus, charger toutes les plibrairies avant chaque script.

**Exemple de chargement:** library(gplots)

## 4- Objectif du BACKTRACKING
   L'objectif du backtracking est de résoudre des problèmes de recherche et d'optimisation en explorant systématiquement un ensemble de solutions potentielles. 

## 4- Stratégie recursive
  Explorer toutes les possibilités pour placer X dames sur un échiquier de X par Y, en veillant à ce qu'elles ne se menacent pas mutuellement.

## 5- Explication du code

#### Fonction initial **_backtracking_**
  ```r
     backtracking <- function(x, y)`
       `k <- 0 
  ```
  
  Cette ligne déclare une fonction nommée backtracking prenant deux paramètres, x et y, qui représentent le nombre de dames et la taille de l'échiquier, respectivement. Elle initialise également une variable k à zéro, qui sera utilisée pour compter le nombre de solutions trouvées.


  #### Fonction **_est_valide_**

   ```r
    est_valide <- function(cb, colonne, ligne)`
   ```

  Ici, une fonction interne est_valide est définie. Cette fonction prend trois arguments : cb (une liste représentant les positions des dames), colonne (la colonne actuelle), et ligne (la ligne à vérifier). Elle initialise
     une variable i à 1 pour itérer à travers les colonnes précédentes.
  

 ```r
    while (i < colonne) {
      if (cb[i] == ligne ||``
          cb[i] - i == ligne - colonne ||
          cb[i] + i == ligne + colonne) {
 ```

  vérifie si une dame peut être placée dans la ligne spécifiée. Elle examine chaque colonne précédente (de 1 à colonne - 1) pour s'assurer qu'aucune dame ne menace la position actuelle. Les trois conditions vérifient si une dame dans la colonne i menace la position (colonne, ligne) actuelle. Si l'une de ces conditions est vraie, la fonction renvoie FALSE, ce qui signifie que la position n'est pas valide.
    
   ```r
      return(FALSE)
      }
      i <- i + 1
    }
 ```

   Si l'une des conditions précédentes est vraie, la fonction renvoie FALSE et s'arrête. Sinon, elle incrémente i pour passer à la colonne suivante et continuer à vérifier.

 ```r
return(TRUE)
}
 ```

 Si aucune menace n'a été détectée, la fonction renvoie TRUE, ce qui signifie que la position est valide pour placer une dame.

 #### Fonction **_placer_dames_**

  ```r
 placer_dames <- function(cb, colonne = 1) {
    if (colonne > x) {
      k <<- k + 1
    print(cb) }
  ```

placer_dames(fonction interne),  est utilisée pour placer les dames sur l'échiquier. Elle prend comme argument cb (la liste des positions actuelles des dames) et colonne (la colonne actuelle, initialisée à 1 par défaut). Si colonne dépasse x (le nombre de dames que vous souhaitez placer), cela signifie que toutes les dames ont été placées, et une solution a été trouvée. Dans ce cas, le compteur k est incrémenté et la position des dames est imprimée.

```r
 else {
    ligne <- 1
      while (ligne <= y) {
```

Sinon, la fonction itère sur toutes les lignes possibles dans la colonne actuelle, de 1 à y. Elle utilise une boucle while pour cela.

```r
 if (est_valide(cb, colonne, ligne)) {
          cb[colonne] <- ligne
          placer_dames(cb, colonne + 1)
```

Pour chaque ligne, la fonction est_valide est appelée pour vérifier si la position est sûre. Si c'est le cas, la ligne est attribuée à la colonne actuelle, et la fonction placer_dames est rappelée récursivement pour la colonne suivante.

```r
       }
       ligne <- ligne + 1
     }
    }
  }
```

Continue à itérer sur les lignes possibles pour la colonne actuelle. Une fois que toutes les lignes ont été explorées pour la colonne actuelle, la fonction remonte d'une colonne et explore les options pour la colonne précédente.

```r
  cb_initial <- integer(x)
  placer_dames(cb_initial)
  cat("Nombre de k trouvées:", k, "\n")
}
```

Initialise la liste  cb_initial  après chaque appel de la fonction placer_dames .

Appelle la fonction lacer_dames pour commencer le processus de backtracking.

## 5- Comment lancer le progragmme?

Il suffit d'appeller la fonction **_backtracking()_** et d'y ajouter en paramêtre le nombre de dames et la taille de l'échiquier.
ℹ️ **Exemple:** backtracking(5,5) 

## 6- Conclusion

Ce code resoud le problème des huit dames (Eight Queens Problem). L'objectif est de placer huit dames sur un échiquier de manière à ce qu'aucune dame ne puisse attaquer une autre dame.
