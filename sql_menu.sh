
#!/bin/bash
#Author: Manuel Salazar email: m1_20@hotmail.com

source myfunctions.sh

function subMenu1 {
  clear
  echo -e "\t\t\t\tSub Menu 1\n"
  echo -e "\t\t1. Display All Records."
  echo -e "\t\t2. Display Top 3 Records from the Selected Field."
  echo -e "\t\t3. Display the Total Number of Employees."
  echo -e "\t\t0. Exit.\n\n"
  echo -en "\t\t\tPlease enter an option: "
}

function mainMenu {
  clear
  echo -e "\t\t\t\tMenu\n"
  echo -e "\t\t1. Create a New Record."
  echo -e "\t\t2. Display a Record."
  echo -e "\t\t3. Update a Record."
  echo -e "\t\t4. Delete a Record"
  echo -e "\t\t5. Display All Records."
  echo -e "\t\t6. Display the Top Three Highest Salaries."
  echo -e "\t\t0. Exit.\n\n"
  echo -en "\t\t\tPlease enter an option: "
}

while [ 1 ]
do
  mainMenu
  read -n 1 option
  case $option in
  0)
    break ;;
  1)
    createNewRecord ;;
  2)
    displayRecord ;;
  3)
    updateRecord ;;
  4)
    deleteRecord ;;
  5)
    displayAllRecords;;
  6)
    displayTopThreeSalaries;;
  *)
    clear
    echo "Sorry, wrong selection." ;;
  esac
    echo -en "\n\n\t\tHit any key to return to the menu."
    read -n 1 line
done
clear
