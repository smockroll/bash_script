#! /bin/bash
# using dialog to create a menu 
temp1=$(mktemp -t test1.XXXXXX)
temp2=$(mktemp -t test2.XXXXXX)
temp3=$(mktemp -t test3.XXXXXX)
temp4=$(mktemp -t test4.XXXXXX)

function diskspace {
    df -hTP > $temp1
    dialog --textbox $temp1 20 140 
}

function whoseon {
    who > $temp1
    dialog --textbox $temp1 20 60 
}

function memusage {
    cat /proc/meminfo > $temp1 
    dialog --textbox  $temp1 20 50 

}

function zip {
dialog --title "Select a file top zip" --fselect $HOME/ 20 100 2>$temp3
file_to_zip=$(cat $temp3)

if [ -r $file_to_zip ] 
then 
   dialog --inputbox "Select the zip archive destination folder: " 20 100 2>$temp4
   folder_archive_zip=$(cat $temp4)
   cd $folder_archive_zip
   a=$(zip archive_zip $file_to_zip) 
   return a
   
else
echo "No file selected or readable. Exit"
fi
}


while [ 1 ]
do 
# if widget returns any data, the dialog command sends the data to stderr that we reditrect to a file 
dialog --menu "Sys Admin Menu" 20 30 10 1 "Display Disk Space" 2 "Display Users" 3 "Display Memory Usage" 4 "Zip directory/file" 0 "Exit" 2>$temp2
if [ $? -eq 1 ] 
then 
break
fi 

selection=$(cat $temp2)

# check the selection 
case $selection in 
1) 
    diskspace ;;
2)
    whoseon ;;
3)
    memusage ;;
4) 
    zip;;
0) 
    break ;;
*) 
    dialog --msgbox "Scelta non ammessa" 10 30 

esac
done 
echo "il file zippato si chiama: $a"
rm -f $temp1 2> /dev/null
rm -f $temp2 2> /dev/null
rm -f $temp3 2> /dev/null
rm -f $temp4 2> /dev/null

