#Importation de l'ensemble des bases
install.packages("haven")
library(haven)
cereales <- read_dta(file = "C:\\Users\\DELL\\Downloads\\Base_etudiant\\cereales.dta")
base2 <- read_dta(file = "C:\\Users\\DELL\\Downloads\\Base_etudiant\\Ehcvm21.dta")
base3 <- read_dta(file = "C:\\Users\\DELL\\Downloads\\Base_etudiant\\ehcvm21_conso_red.csv")
base4 <- read_dta(file = "C:\\Users\\DELL\\Downloads\\Base_etudiant\\legumes.dta")
base5 <- read_dta(file = "C:\\Users\\DELL\\Downloads\\Base_etudiant\\table_conversion.dta")

#Renommer les variables pour la bse cereale

colnames(cereales)
colonnes_names <- colnames(cereales)[1:14]    #Créer une variable qui contient les noms des variables
name <- c(colonnes_names[1],colonnes_names[2],colonnes_names[3],"autre_cereales", "quantite_total", 
              "unites_cons","taille_cons","provenance_auto","provenance_other",
              "freq_achat","quatite_achat", 
              "unite_achat","taille_achat","value_lastachat")
isTRUE(length(name)==length(colonnes_names)) #Vérifie si les longueurs sont les mêmes
#Ainsi on a créer l'ensemble des nouvelles variables. A présent, on va remplacer les noms des variables de notre base par ces nouvelles
colnames(cereales) <- name
colnames(cereales)   #Vérifie les résultats


#Convertion des unités
summary(cereal_df$cereales_id1) # 

## creer une nouvelle variable
# liste des produits 
library(pillar)         #importer le packqge qui cpontient glimpse

glimpse(cereales)
uniteCons <- subset(base5, select = c("uniteID", "uniteNom"))
## supression de doublons
uniteCons_df <- distinct(uniteCons)

cereales$unites <- factor(cereales$unites_cons, 
                           levels = uniteCons$uniteID, 
                           labels = uniteCons$uniteNom)


glimpse(cereales)




