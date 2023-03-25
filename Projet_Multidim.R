###################################################################
################ --- ANALYSES DES DONNEES --- #####################
###################################################################

#Definir le répertoire de travail

setwd("C:/Rtravail/Multidim")

#Dataframe de notre jeu de donnees

Data <- read.table("PhysicalcharactericsUrines.txt", header = TRUE)

#On supprime les patients avec des valeurs NA

Database <- na.omit(Data)

#Analyse univariee des variables

#Frequence
table(Database$Crystals)
table(Database$gravity)
table(Database$pH)
table(Database$mOsm)
table(Database$mMho)
table(Database$Urea)
table(Database$Calcium)

#code pour faire des tables LaTeX
library(xtable)
freq_table <- table(Database$Crystals)
freq_xtable <- xtable(freq_table)
print(freq_xtable, type = "latex")

#Moyenne
mean(Database$gravity)
mean(Database$pH)
mean(Database$mOsm)
mean(Database$mMho)
mean(Database$Urea)
mean(Database$Calcium)

#Mode
mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
mode(Database$gravity)
mode(Database$pH)
mode(Database$mOsm)
mode(Database$mMho)
mode(Database$Urea)
mode(Database$Calcium)

#Mediane
median(Database$gravity)
median(Database$pH)
median(Database$mOsm)
median(Database$mMho)
median(Database$Urea)
median(Database$Calcium)

#Ecart-type
sd(Database$gravity)
sd(Database$pH)
sd(Database$mOsm)
sd(Database$mMho)
sd(Database$Urea)
sd(Database$Calcium)

#Distribution des valeurs
hist(Database$Crystals, col = "lightblue", main = "Histogramme de Distribution", xlab = "Valeurs de Crystals", ylab = "Nombre d'individus")
hist(Database$gravity, col = "lightblue", main = "Histogramme de Distribution", xlab = "Valeurs de gravity", ylab = "Nombre d'individus")
hist(Database$pH, col = "lightblue", main = "Histogramme de Distribution", xlab = "Valeurs de pH", ylab = "Nombre d'individus")
hist(Database$mOsm, col = "lightblue", main = "Histogramme de Distribution", xlab = "Valeurs de mOsm", ylab = "Nombre d'individus")
hist(Database$mMho, col = "lightblue", main = "Histogramme de Distribution", xlab = "Valeurs de mMho", ylab = "Nombre d'individus")
hist(Database$Urea, col = "lightblue", main = "Histogramme de Distribution", xlab = "Valeurs de Urea", ylab = "Nombre d'individus")
hist(Database$Calcium, col = "lightblue", main = "Histogramme de Distribution", xlab = "Valeurs de Calcium", ylab = "Frequence")


#Analyse bivariee des variables

#Correlation (Si c'est positif, les deux variables bougent dans la même direction)

library(dplyr)
Database_Matrice <- Database %>% select(-Patient)
cor_matrix <- cor(Database_Matrice)
print(cor_matrix)

library(corrplot)
corrplot(cor_matrix, method = "color")

corrplot(cor_matrix, type="lower", order="hclust", tl.col="black", tl.srt=45)

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(cor_matrix, method="color", col=col(200), 
         type = "lower",
         addCoef.col = "black", order="hclust") 


#Pour pouvoir faire la régression logistique il faut modifier les valeurs de Crystals en 0 et 1. 
Database$Crystals[Database$Crystals==1]<-0
Database$Crystals[Database$Crystals==2]<-1

#Regression logistique
model_logistique <- glm(Crystals ~ gravity + pH + mOsm + mMho + Urea + Calcium, data = Database, family = binomial)
summary(model_logistique)

#Diagramme de dispersion

#Plot non-significatif
plot(
  x = Database$Crystals, y =  Database$gravity,
  xlab = "Catégorie Patient", 
  ylab = "gravity",
  col = ifelse(Database$Crystals == 0, "blue", "red"),
  pch = 19
)
abline(lm(Database$gravity ~ Database$Crystals), col = "red", lwd = 2)
legend("topright", legend=c("Patients sans cristaux", "Patients avec cristaux", "Régression"),
       col=c("blue", "red", "red"), pch=19, lty=c(NA,NA,1))

#Plot non-significatif
plot(
  x = Database$Crystals, y =  Database$pH,
  xlab = "Catégorie Patient", 
  ylab = "pH",
  col = ifelse(Database$Crystals == 0, "blue", "red"),
  pch = 19
)
abline(lm(Database$pH ~ Database$Crystals), col = "red", lwd = 2)
legend("topright", legend=c("Patients sans cristaux", "Patients avec cristaux", "Régression"),
       col=c("blue", "red", "red"), pch=19, lty=c(NA,NA,1))

#Plot non-significatif
plot(
  x = Database$Crystals, y =  Database$mOsm,
  xlab = "Catégorie Patient", 
  ylab = "mOsm",
  col = ifelse(Database$Crystals == 0, "blue", "red"),
  pch = 19
)
abline(lm(Database$mOsm ~ Database$Crystals), col = "red", lwd = 2)
legend("topright", legend=c("Patients sans cristaux", "Patients avec cristaux", "Régression"),
       col=c("blue", "red", "red"), pch=19, lty=c(NA,NA,1))

#Plot non-significatif 
plot(
  x = Database$Crystals, y =  Database$mMho,
  xlab = "Catégorie Patient", 
  ylab = "mMho",
  col = ifelse(Database$Crystals == 0, "blue", "red"),
  pch = 19
)
abline(lm(Database$mMho ~ Database$Crystals), col = "red", lwd = 2)
legend("topright", legend=c("Patients sans cristaux", "Patients avec cristaux", "Régression"),
       col=c("blue", "red", "red"), pch=19, lty=c(NA,NA,1))

#Plot significatif
plot(
  x = Database$Crystals, y =  Database$Urea,
  xlab = "Catégorie Patient", 
  ylab = "Urea",
  col = ifelse(Database$Crystals == 0, "blue", "red"),
  pch = 19
)
abline(lm(Database$Urea ~ Database$Crystals), col = "red", lwd = 2)
legend("topright", legend=c("Patients sans cristaux", "Patients avec cristaux", "Régression"),
       col=c("blue", "red", "red"), pch=19, lty=c(NA,NA,1))

#Plot significatif 
plot(
  x = Database$Crystals, y =  Database$Calcium,
  xlab = "Catégorie Patient", 
  ylab = "Calcium",
  col = ifelse(Database$Crystals == 0, "blue", "red"),
  pch = 19
)
abline(lm(Database$Calcium ~ Database$Crystals), col = "red", lwd = 2)
legend("topright", legend=c("Patients sans cristaux", "Patients avec cristaux", "Régression"),
       col=c("blue", "red", "red"), pch=19, lty=c(NA,NA,1))


#####################  ACP  #####################

Database_SP <- Database
Database_SP$Patient <- NULL
Database_SP$Crystals <- NULL

library(FactoMineR)
library(factoextra)
library(grid)
library(ggplot2)
library(factoextra)

# Analyse des correspondances (ACP)
acp <- PCA(Database_SP, graph = FALSE)

#Boîtes a moustaches
boxplot(data.frame(scale(Database_SP)))

eigenvalues <- acp$eig
barplot(eigenvalues[, 2], names.arg=1:nrow(eigenvalues), 
        main = "Eboulis des valeurs propres",
        xlab = "Principal Components",
        ylab = "Percentage of variances",
        col ="steelblue")
lines(x = 1:nrow(eigenvalues), eigenvalues[, 2], 
      type="b", pch=19, col = "red")

#eig pourcentage de variance
print(acp$eig)

# Projection des variables sur le premier plan
fviz_pca_var(acp, col.var = "contrib", palette = "default", habillage = "none", legend = "top")

#Biplot variables + individus
fviz_pca_biplot(acp)

#Contribution des individus a la dimention 1
fviz_contrib(acp, choice = "ind", axes = 1,top=40)

#Contribution des individus a la dimention 2
fviz_contrib(acp, choice = "ind", axes = 2,top=40)

#Contribution des variables a la dimention 1
fviz_contrib(acp, choice="var", axes = 1 )

#Contribution des variables a la dimention 2
fviz_contrib(acp, choice="var", axes = 2 )


#####################  Dendogramme  #####################

# Chargement des bibliothèques
library(cluster)
library(dendextend)
library(dplyr)

str(Database_SP)
Database_num <- Database_SP %>% 
  dplyr::select(gravity:Calcium) 
str(Database_num)

# Calcul de la distance euclidienne entre les individus
dist_mtcars <- dist(Database_num)

# Création de l'objet de clustering agglomératif
agn_mtcars <- agnes(dist_mtcars, method = "ward")

# Conversion en dendrogramme
dend_mtcars <- as.dendrogram(agn_mtcars)

# Affichage du clusterplot
fviz_dend(dend_mtcars, k = 5, cex = 0.7, k_colors = "jco", 
          color_labels_by_k = TRUE, 
          rect = TRUE, rect_border = "jco") 


#####################  kmeans  #####################

Database_num_sc <- scale(Database_num)
str(Database_num_sc)

library(NbClust)

# Elbow method
fviz_nbclust(Database_num_sc, kmeans, method = "wss") +
  geom_vline(xintercept = 2, linetype = 2)+
  labs(subtitle = "Elbow method") 

# Silhouette method
fviz_nbclust(Database_num_sc, kmeans, method = "silhouette")+
  labs(subtitle = "Silhouette method") 

# Gap statistic method
set.seed(123)
fviz_nbclust(Database_num_sc, kmeans, nstart = 25, method = "gap_stat", nboot = 50)+
  labs(subtitle = "Gap statistic method") 

#Représentation des clusters avec 5 ellipses
km.out2=kmeans(Database_num_sc,centers=2,nstart =20)
fviz_cluster(km.out2, Database_num_sc, ellipse.type = "norm") 

#Représentation des clusters avec 5 ellipses
km.out2=kmeans(Database_num_sc,centers=5,nstart =20)
fviz_cluster(km.out2, Database_num_sc, ellipse.type = "norm") 

