#!/bin/bash
clear
echo "------------------------------------------------------------------"
echo "| scl - sconfig Linux  -  Brlndtech 2019 © AIO management Script |";  
echo "------------------------------------------------------------------";
read -p "Lancer le programme sconfig Linux  ? (O/N) : " rep
while [ $rep == "O" ] || [ $rep == "o" ]
do
# Déclaration des variables global : 
siroot=`whoami` # stock le resultat de la commande whoami dans usercheck
usercheck="root"
choix=99
# fin des var global 
if [ $siroot = $usercheck ]; then
#clear
#  su - 
   echo -e "*---------------------------------------------------------------------------------------------------------*"
   echo -e "*  0)  !Installer programme de base                   6)  Modifier le mdp d'un utilisateur                *"
   echo -e "*  1)  Message de bienvenue                           7)  Supprimer un utilisateur et son dossier         *"
   echo -e "*  2)  Afficher la météo                              8)  Lancer l'utilitaire HTOP                        * "
   echo -e "*  3)  Mise à jour des dépots                         9)  Sauvegarder un répertoire                       *"
   echo -e "*  4)  Nettoyage des paquets / dépots                 10) Résoudre pb de dpkg suite à une cmd apt update  *"
   echo -e "*  5)  Ajouter un utilisateur                         11) Résoudre pb E: Sub-process /usr/bin/dpkg        *"
   echo -e "*                                                                                                         *"
   echo -e "*  29) DIST UPGRADE (Deb 9->10/ Ubuntu (Not-LTS)      12) Log de connexion utilisateur atcif/non-actif    *"
   echo -e "*  30) Quitter le programme                           13) information général du serveur                  *"   
   echo -e "*                                                     14) changer ip du serveur (main network interface)  *"
   echo -e "                                                      15) change the hostname of the machine              *"
   echo -e "*---------------------------------------------------------------------------------------------------------*"
   read -p "Choisir parmis les options 0-30 : " choix
   case $choix in
         0)
         ./src/monit-linux-verification-paquets.sh
         ;;
         1)
         ./src/monit-linux-date.sh
         ;;
         2) 
         ./src/monit-linux-meteo.sh
         ;;
         3)
         ./src/monit-linux-maj-apt.sh
         ;;
         4)
	      ./src/monit-linux-autoremove-purge.sh
         ;;
         5) # ajout d'un utilisateur 
         ./src/monit-linux-adduser.sh
         ;;
         6) # changer le mdp d'un utilisateur 
         ./src/monit-linux-passwd.sh
         ;;
         7) # supprimer un utilisateur
         ./src/monit-linux-deluser.sh 
         ;;
         8) 
          htop
         ;;
         9)
         ./src/monit-linux-backup.sh
         ;;
         10)
         ./src/monit-linux-dpkgpb1.sh
         ;;
         11)
         ./src/monit-linux-dpkgpb2.sh
         ;;
	      12)
	      ./src/monit-linux-users.sh
         ;;
         13)
         ./src/monit-linux-info-sys.sh
         ;; 
         14)
      	 ./src/monit-linux-networking.sh
      	 ;;
         15)
         ./src/monit-linux-hostname.sh
         ;;
         29)
         ./src/monit-linux-dist-upgrade.sh
         ;;
         30)
         echo -e " \e[92m  Vous avez mis fin du programme. à bientôt :) \e[0m "
         break;
         ;;
         99) # mode debug 
         read -p "Relancer le programme ? (O/N) : " rep
         ;;
         *)
         echo -e " \e[91m - Action non reconnu par le programme, saisissez un choix entre 1 et x \e[0m"
         ;;
      esac
      continue 
else 
   echo -e " \e[91m - ||| Impossible d'éxécuter le script dans ces conditions ||| - \e[0m";
   exit; 
fi
done # fin de la boucle
