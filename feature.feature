Arwaaaa




Fonctionnalité: Gérer une Commande

# 1er Scénario
Plan du Scénario: Afficher toutes les sociétés.
    Étant donné que l'utilisateur est sur la page "Créer une Commande"
    Quand l'utilisateur clique sur le champ "Entité Juridique"
    Alors l'utilisateur devrait voir une liste de toutes les sociétés disponibles
    Et la taille de la liste est égale à <taille_liste>
    Et la liste contient "<entreprise1>", "<entreprise2>" et "<entreprise3>"

    Exemples:
        | taille_liste | entreprise1 | entreprise2 | entreprise3 |
        | 3            | SUEZ        | SNCF        | veolia      |


# Deuxième Scénario
Scénario: Afficher tous les contrats de la société sélectionnée
    Étant donné que l'utilisateur a sélectionné la société concernée par la Commande
    Quand l'utilisateur clique sur le champ "Contrats"
    Alors l'utilisateur devrait voir une liste de tous les contrats disponibles de cette société et pas d'une autre


# Troisième Scénario
Scénario: Afficher tous les clients de la société concernée
    Étant donné que l'utilisateur a sélectionné la société concernée par la Commande
    Quand l'utilisateur clique sur le champ "Raison Sociale"
    Alors l'utilisateur devrait voir une liste de tous les clients disponibles de ce cette société et pas d'une autre


# 4ème Scénario
Scénario: Afficher tous les gestionnaires CPA du client concerné
    Étant donné que l'utilisateur a sélectionné le client concerné par la Commande
    Quand l'utilisateur clique sur le champ "Gestionnaire (CPA)"
    Alors l'utilisateur devrait voir une liste de tous les gestionnaires CPA de ce client qui correspond au contrat sélectionné.


# 5ème scenario
Scénario: Afficher tous les codes de rattachement du gestionnaire CPA concerné
    Étant donné que l'utilisateur a sélectionné le gestionnaire CPA concerné par la Commande
    Quand l'utilisateur clique sur le champ "Code rattachement (BUPO)"
    Alors l'utilisateur devrait voir une liste de tous les codes du Bupo auxquels appartient le gestionnaire CPA.


# 6ème scenario
Scenario Outline: Affichage des marques pour un contrat donné
    Given l'utilisateur a sélectionné le contrat avec <contrat_id>
    When l'utilisateur ouvre la page de sélection des marques
    Then les marques convenables doivent être affichées automatiquement


Scénario: Stocker les numéros de commandes
    Étant donné que l'utilisateur a entré le numéro de Commande
    Quand le numéro de commande est deja saisi dans le champ numéro de commande
    Alors Le préfixe s'il est présent doit etre concaténer avec le numéro saisi pour avoir le nouveau numéro résultant de concaténation
    Et le numéro de commande résultant sera stocké dans la base de données tel qu'il est       
    Et le numéro de commande résultant doit étre unique

# 7ème scenario
Scénario: Afficher toutes les catégories du véhicule 
    Étant donné que l'utilisateur a sélectionné la marque
    Quand l'utilisateur clique sur le champ "Catégorie"
    Alors l'utilisateur devrait voir une liste de toutes les catégories appartenant à la marque sélectionnée.


# 8ème scenario
Scénario: Vérifier les étapes d'aménagement ajoutées par l'utilisateur
    Étant donné que l'utilisateur peut ajouter des aménagements dans la section "Vérifier les aménagements" si celles-ci ne sont pas cochées par défaut.
    Quand l'utilisateur ajoute "Installation EGP" et/ou "Transformation / Carrossier", et/ou "Installation PDV"
    Alors ces étapes doivent apparaître automatiquement dans les détails de la commande
    Et ces étapes ajoutées ne doivent en aucun cas modifier le contrat standard associé à la commande


# 9ème scénario
Scénario: Afficher les équipements
    Étant donné que l'utilisateur sur la page "Equipements"
    Quand l'utilisateur ajoute des équipements
    Alors l'utilisateur devrait voir la liste des équipements correspondant au modèle sélectionné et au contrat choisi


# 11ème scénario
Scénario: Mettre à jour les prix après l'ajout des options
    Etant donné que l'utilisateur est sur la section options
    Quand l'utilisateur ajoute des options
    Alors les prix dans le champ "Prix Options" se mettent à jour automatiquement selon les <tarifs> des options


# 12ème scénario
Scénario: Vérifier le prix HT
    Etant donné que l'utilisateur est sur la section "Informations Véhicule"
    Et le type du véhicule choisi est VP
    Quand l'utilisateur met à jour les prix
    Alors les prix HT dans la section "Informations Contrat" se mettent à jour automatiquement selon une formule
    


# LE WORKFLOW DES EMAILS
# Direct 
# 1
Scénario: Confirmer l'enregistrement d'une commande de vente direct
    Etant donné que la commande Société Vente Direct a été crée
    Quand l'utilisateur a cliqué sur le bouton "Submit"
    Alors un mail CONFIRMATION_ENREGISTREMENT_COMMANDE doit être envoyé 
    Et un mail DEMANDE_SAISIE_CAR_DIRECT doit être envoyé


# 2
Scénario: Saisir le num de Car
    Etant donné que le client a reçu le mail DEMANDE_SAISIE_CAR_DIRECT
    Quand le client clique sur le lien mentionné dans le mail 
    Et le client saisit <Car> et <LCDV>
    Et le client selectionne le point de vente d'affectation
    Et le client clique sur le bouton "Enregister"
    Alors la notification de succès s'est affichée
    Et un mail AR_COMMANDE_CLIENT et un mail DEMANDE_SAISIE_FORCE_DIRECT seront générés


# 3
Scénario: Saisir force direct
    Etant donné que le client a cliqué sur le lien mentionné dans le mail DEMANDE_SAISIE_FORCE_DIRECT
    Quand le client saisit <Date_saisie_Numéro_contrat_F2ML> 
    Et le client sélectionne le <Contact> qui a saisi le contrat de force
    Et le client clique sur le bouton "Enregister"
    Alors la notification de succès s'est affichée
    Et un mail CONFIRMATION_PDV et un mail DEMANDE_UPLOAD_GF_PG seront générés


# 4
Scénario: Vérifier les documents financiers
    Etant donné que le client clique sur le lien mentionné dans le mail DEMANDE_UPLOAD_GF_PG
    Quand le client télécharge tous les documents financiers
    Et le client clique sur le bouton "Enregister"
    Alors la notification de succès s'est affichée
    Et un email ENVOI_GRILLE_FLUIDITE_ET_PAGE_DE_GARDE sera généré


# Flow des emails Réseau
# 1
Plan du Scénario: Confirmer l'enregistrement d'une commande de vente réseau
    Etant donné que la commande Société Réseaux a été crée
    Quand l'utilisateur a cliqué sur le bouton "Submit"
    Alors un mail CONFIRMATION_ENREGISTREMENT_COMMANDE doit être envoyé 
    Et un mail DEMANDE_SAISIE_FORCE_RESEAU doit être envoyé

# 2
Plan du Scénario: Saisir le num de contrat de force
    Etant donné que le client a reçu le mail Demande_Saisie_force_réseau
    Quand le client clique sur le lien mentionné dans le mail 
    Et le client saisit Num_contrat_force
    Et le client clique sur le bouton "Enregister"
    Alors la notification de succès s'est affichée
    Et le statut du véhicule devient VEHICULE_COMMANDEE
    Et un mail DEMANDE_SAISIE_FORCE_RESEAU seront générés

# 3
Plan du Scénario: Saisir les informations du véhicule
    Etant donné que le numéro de <car> n'est pas saisi
    Quand l'utilisateur saisit le <car>, <LCDV> et la <dateMadLivraison>
    Alors la notification de succès s'est affichée
    Et un mail DEMANDE_UPLOAD_GF_PG sera généré
    Et un mail AR_COMMANDE_CLIENT est généré via SFTP et mail pour Suez sinon par mail
    Et le statut du véhicule devient VEHICULE_COMMANDEE
    Examples:
        | car      | LCDV     | dateMadLivraison |
        | CAR123   | LCDV456  | 2024-07-16       |
        | CAR789   | LCDV123  | 2024-08-01       |
        | CAR456   | LCDV789  | 2024-09-10       |

# 4
Scenario: Télécharger des documents justificatifs
    Etant donné que l'utilisateur reçoit un mail Demande_Upload_GF_PG
    Quand l'utilisateur télécharge les 4 fichiers qui sont Grille_Fluidité, Page_Garde, Grille_LOYER_FINANCIER et Grille_LOYER_MAINTENANCE pour Suez sinon les 2 premiers fichiers seulement
    Alors les fichiers sont téléchargés correctement
    Et un évènement ENVOI_GRILLE_FLUIDITE_ET_PAGE_DE_GARDE est généré par SFTP si la société est Suez sinon par mail 
    Et le statut du véhicule devient VEHICULE_LANCEE_FAB

# 5
Scénario: Saisir la date de réception de commande
    Etant donné que l'utilisateur reçoit AR_COMMANDE_CLIENT par mail et SFTP pour Suez sinon par mail
    Quand la dateReceptionCommande est saisie
    Alors la notification de succès s'est affichée
    Et un mail de Demande_Upload_GF_PG sera généré

# 6
Scénario: Importer les numéros de car et caf
    Etant donné que le statut du véhicule est VEHICULE_COMMANDEE
    Quand l'utilisateur importe le numéro caf
    Alors le statut du véhicule devient LANCEE_FAB
    Et un mail EN_COURS_FABRICATION est généré


# 7
Scénario: Importer le chassis long
    Etant donné que l'utilisateur reçoit un mail EN_COURS_FABRICATION
    Quand l'utilisateur importe le chassisLong
    Alors le chassis long est importé correctement
    Et un mail de VEHICULE_FABRIQUEE sera généré
    Et le statut du véhicule devient VEHICULE_FABRIQUEE

# 8
Scénario: Importer la sortie d'usine et Nom EGP
    Etant donné que l'utilisateur reçoit un mail VEHICULE_FABRIQUEE
    Quand l'utilisateur importe la sortieUsine et nomEGP
    Alors la sortie d'usine est importée correctement
    Et le statut du véhicule devient AMENAGEUR_1

# 9 
Scénario: Importer Date départ EGP
    Étant donné que le statut de commande est AMENAGEUR_1
    Quand le client concerné importe le Date départ EGP
    Alors le statut de véhicule passe à AMENAGEMENT si les prérequis sont vérifiés

# 10
Scénario: Import la Date départ Aménagement
    Étant donné que le statut de commande est AMENAGEMENT
    Quand le client concerné importe le Date départ Amenagement
    Alors le statut de véhicule passe à VEHICULE_AU_PDV si les prérequis sont vérifiés
    Et un mail MAD_POV a été envoyé

# 11
Scénario: Importer la date d'immatriculation
    Etant donné que l'utilisateur reçoit un mail MAD_PDV
    Quand l'utilisateur importe <DateImmat>
    Alors la date d'immatriculation est importée correctement
    Et un mail DEMANDE_CPI est généré à travers Schedular

# 12
Scénario: Importer l'immatriculation
    Etant donné que l'utilisateur reçoit un mail Demande_CPI
    Quand l'utilisateur importe l'immatriculation 
    Alors un mail Envoi_CPI est généré via le canal SFTP pour Suez 
    Et un mail DEMANDE_UPLOAD_CARTE_GRISE est généré à travers Schedular

# 13
Scénario: Importer la carte grise
    Étant donné que la véhicule n'a pas des documents justificatifs de categorie « carte grise »
    Et que y'a pas des command_évent de type «DEMANDE UPLOAD CARTE GRISE » envoyés ou en cours d'envoi
    Et que la date d'immatriculation n'est pas nul
    Et que la date de mise a disposition client nul
    Et que le statut different d'annulée et rejetée
    Et que l'immatriculation realisée depuis 10 jours d'aujourd'hui
    Quand le mail DEMANDE_UPLOAD_CARTE_GRISE a été envoyé
    Et la carte grise a été importée avec succés
    Alors un mail MAD_CLIENT_PDV sera envoyé si le type de livraison est PDV
    Et le statut de véhicule passe à VEHICULE_PRET si les prérequis sont vérifiés

# 14
Scénario: Importer la date de livraison
    Etant donné que l'utilisateur reçoit un mail MAD_Client_PDV
    Quand il s'est passé 15 jours.
    Et l'utilisateur importe la <dateLivraison>
    Alors la <dateLivraison> est importée correctement
    Et un mail VEHICULE_LIVREE est généré
    Et le statut du véhicule devient VEHICULE_LIVREE



