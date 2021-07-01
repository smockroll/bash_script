#! /bin/bash

function diskspace {
clear
df -hTP 
 
}

function whoseon {
clear
who

     
}

function memusage {
clear
cat /proc/meminfo
       	
    

}

function zipfunction {
clear
echo "La directory di appoggio dei file zippati è $HOME"
cd /home/agatino
zip archive /home/agatino/Desktop/ssh_file



   
}



 
# if widget returns any data, the dialog command sends the data to stderr that we reditrect to a fil
function menu {
clear
echo 
echo -e "\t\t\tSys Admin Menu\n"
echo -e "\t1. Display Disk Space"
echo -e "\t2. Display logged on Users"
echo -e "\t3. Display memory Usage"
echo -e "\t4. Zip"
echo -e "\t0. Exit"
echo -en "\t\tEnter Option:"
read -n 1 selection
}

while [ 1 ] 
do 
	menu 


# check the selection 
case $selection in 
1) 
    diskspace ;; 
     
2)
    whoseon ;;
3)
    memusage ;;
4) 
    zipfunction ;;
0) 
    break ;;
*) 
clear
echo "Wrong Selection" ;;
esac
echo -en "\n\n\t\t\tHit any key to continue"
read -n 1 selection 
done
clear

