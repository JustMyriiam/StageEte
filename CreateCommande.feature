
#Scenario 

Plan du Scénario: Stockage des numéros de commandes Suez et SNCF

    Etant donné que Le chargé clientèle a selectionné la <societe> et le <BUPO>
    Et que Le chargé clientèle a saisi <numCmdClient>
    Quand Le chargé clientèle submit la commande
    Alors Le <numCmd> doit étre de la forme "BUPO_numCmdClient"      
    Et il doit étre unique  

# scenario
Plan du Scénario: Affichage des marques pour un contrat donné

    Etant donné que Le chargé clientèle a sélectionné le contrat avec <contrat>
    Quand Le chargé clientèle ouvre la liste des marques
    Alors la <marque> doit étre affichée 


# Gestion de sociétés 

Plan du Scénario: Ajouter une nouvelle société

    Étant donné que Une nouvelle <societe> a été ajoutée à la liste 
    Quand Le chargé clientèle clique sur le champ "Entité Juridique"
    Alors la <societe> doit etre affiché dans la liste des societes disponibles
    Et la taille de la liste est égale à <taille_liste>


Plan du Scénario: Archiver une société

    Étant donné que Une <societe> a été archivée  
    Quand Le chargé clientèle clique sur le champ "Entité Juridique"
    Alors la <societe> ne doit pas etre affiché dans la liste des societes disponibles
    Et la taille de la liste est égale à <taille_liste>