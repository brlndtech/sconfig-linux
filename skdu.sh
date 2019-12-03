#!/bin/bash
clear
echo "------------------------------------------------------------------"
echo "| scl - sconfig Linux  -  Brlndtech 2019 © AIO management Script |";  
echo "------------------------------------------------------------------";
read -p "Start the sconfig Linux programme ? (O/N) : " rep
while [ $rep == "O" ] || [ $rep == "o" ]
do
# Déclaration des variables global : 
siroot=`whoami` # stock le resultat de la commande whoami dans usercheck
usercheck="root"
choix=99
# fin des var global 
if [ $siroot = $usercheck ]; then
   echo -e "*-------------------------------------------------------------------------------------------------------*"
   echo -e "*  0)  !Installer programme de base                12) Follow the system activities (process / user ...)*"
   echo -e "*  2)  Welcome message                             14) Backup a folder very fast into /backup/target    *"
   echo -e "*  4)  Display the weather                         16) Solve the dpkg error after the cmd apt update    * "
   echo -e "*  6)  Apt update && apt upgrade                   18) Solve the dpkg error after the cmd apt update    *"
   echo -e "*  8)  Apt autoremove && apt purge                 20) Monit-linux-ssh-failed-logs                      *"
   echo -e "*  10) Manager user (add/del/info)                 22) Info about your sys                              *"
   echo -e "*                                                                                                       *"
   echo -e "*  24) Change your server IP                                                                            *"
   echo -e "*  26) Change your hostname                                                                             *"
   echo -e "*  28) Sub nmap menu for pentest                                                                        *"
   echo -e "*  30) Flsm tool                                                                                        *"
   echo -e "*  32) Masque convertor                                                                                 *"
   echo -e "*  34) DIST upgrade (debian 9->10/ ubuntu (non LTS)                                                     *"
   echo -e "*                                                                                                       *"
   echo -e "*                                    100) Leave the pgm                                                 *"
   echo -e "*-------------------------------------------------------------------------------------------------------*"
   read -p "Make your choice between 0-100 : " choix
   case $choix in
         0)
         ./src/monit-linux-verification-paquets.sh
         ;;
         2)
         ./src/monit-linux-date.sh
         ;;
         4) 
         ./src/monit-linux-meteo.sh
         ;;
         6)
         ./src/monit-linux-maj-apt.sh
         ;;
         8)
	      ./src/monit-linux-autoremove-purge.sh
         ;;
         10) # sub menu for manager users
         ./src/monit-linux-manage-users-sub-panel.sh
         ;;
         12) 
         ./src/monit-linux-activities.sh
         ;;
         14)
         ./src/monit-linux-backup.sh
         ;;
         16)
         ./src/monit-linux-dpkgpb1.sh
         ;;
         18)
         ./src/monit-linux-dpkgpb2.sh
         ;;
	      20)
	      ./src/monit-linux-ssh-failed-logs.sh
         ;;
         22)
         ./src/monit-linux-info-sys.sh
         ;; 
         24)
      	./src/monit-linux-networking.sh
      	;;
         26)
         ./src/monit-linux-hostname.sh
         ;;
	      28)
         ./src/monit-linux-nmap.sh
	      ;;
	      30)
	      ./src/monit-linux-flsm.sh
      	;;
      	32)
      	./src/monit-linux-cidr-convertor.sh
      	;;
      	34)
         ./src/monit-linux-dist-upgrade.sh
         ;;
         100)
	      clear
         echo -e " \e[92m  You have leaved sconfig-linux. See you soon :) \e[0m "
         break;
         ;;
         99) # mode debug 
         read -p "Revive the programme ? " rep
         ;;
         *)
         echo -e " \e[91m - 001 - Unknow operation, please enter a number between 0 and 30 \e[0m"
         ;;
      esac
      continue 
else 
   echo -e " \e[91m - ||| Unable to execute sconfig-linux in these conditions : please follow the README.md, to solve the problem ||| - \e[0m";
   exit; 
fi
done # fin de la boucle
