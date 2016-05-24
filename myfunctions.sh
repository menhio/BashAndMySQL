
#!/bin/bash
#Author: Manuel Salazar email: m1_20@hotmail.com

source validation.sh

function createNewRecord {
  connEmployees
  clear
  echo "Create a New Employee"
  read -p "Enter Employee Name: " empname
  read -p "Enter the Salary: " salary
  #isNumber $salary
  read -p "Enter the Account: " acc
  read -p "Enter the Date of Join. Ex. 2014-08-01: " date
  mysql $db -e "INSERT INTO $tbl (Name,Salary,Account,DOJ) VALUES ('$empname','$salary','$acc','$date')";
}

function displayRecord {
  connEmployees
  clear
  echo "Display a Single Employee"
  read -p "Enter Employee ID: " empid
  #isNumber $empid
  mysql $db -e "SELECT * FROM $tbl WHERE EmployeeID = '$empid'";
}

function updateRecord {
  connEmployees
  clear
  echo "Update an Employee."
  displayAllRecords
  read -p "Enter Employee ID: " empid
  #isNumber $empid
  mysql $db -e "SELECT * FROM $tbl WHERE EmployeeID = '$empid'";
  read -p "Enter New Name: " name
  read -p "Enter New Salary: " salary
  #isNumber $salary
  read -p "Enter New Account: " acc
  read -p "Enter New Date of Join: " date
  mysql $db -e "UPDATE $tbl SET Name='$name',Salary='$salary',Account='$acc',DOJ='$date' WHERE EmployeeID = '$empid'";
  clear
  echo "The following employee has been updated."
  mysql $db -e "SELECT * FROM $tbl WHERE EmployeeID = '$empid'";
}

function deleteRecord {
  connEmployees
  clear
  echo "Delete an Employee."
  displayAllRecords
  read -p "Enter the Employee ID to Delete: " empid
  #isNumber $empid
  clear
  mysql $db -e "DELETE FROM $tbl WHERE EmployeeID = '$empid'";
  clear
  echo "The Employee Has Been Deleted!"
  displayAllRecords
}

function displayAllRecords {
  clear
  connEmployees
  echo "Displaying All Records."
  mysql $db -e "SELECT * FROM $tbl";
}

function displayTopThreeSalaries {
  clear
  connEmployees
  echo "Display the Top Three Salaries."
  mysql $db -e "SELECT * FROM $tbl ORDER BY Salary DESC LIMIT 3";
}

function connEmployees {
  db=jm_db_new
  tbl=Employees
}
