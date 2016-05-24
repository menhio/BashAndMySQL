
#!/bin/bash
#Author: Manuel Salazar email: m1_20@hotmail.com

function isFile {
  if [ "$1" == "" ]
  then
    echo -e "Invalid entry."
    exit
  fi

  if ! [ -f $1 ]
  then
    echo "The file $1 was not found."
    exit
  fi
}

function isDir {
  if ! [ -d $1 ];
  then
    echo -e "$1 is not a valid directory."
    exit 1
  fi
}

function isNumber {
  if ! [[ $1 =~ '^[0-9]+$' ]];
  then
    echo -e "$1 is not a number"
    exit 1
  fi
}
