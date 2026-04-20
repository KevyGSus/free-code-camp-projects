PSQL="psql --username=freecodecamp --dbname=periodic_table -At -c"

ELEMENT_NOT_FOUND() {
  echo I could not find that element in the database.
}

PRINT_INFO() {
  echo "The element with atomic number $1 is $3 ($2). It's a $7, with a mass of $4 amu. $3 has a melting point of $5 celsius and a boiling point of $6 celsius."
}

if [[ -z $1 ]]
  then
    echo Please provide an element as an argument.
elif [[ $1 =~ ^[0-9]+$ ]]
  then
    DATA="$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements e INNER JOIN properties p ON e.atomic_number = p.atomic_number INNER JOIN types t ON p.type_id = t.type_id WHERE e.atomic_number = $1")"
    if [[ -z $DATA ]]
      then
        ELEMENT_NOT_FOUND
      else
        IFS='|' read -ra ARGS <<< $DATA
        PRINT_INFO "${ARGS[@]}"
    fi
  
elif [[ $1 =~ ^[A-Za-z]{,2}$ ]]
  then
    DATA="$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements e INNER JOIN properties p ON e.atomic_number = p.atomic_number INNER JOIN types t ON p.type_id = t.type_id WHERE e.symbol = '$1'")"
    if [[ -z $DATA ]]
      then
        ELEMENT_NOT_FOUND
      else
        IFS='|' read -ra ARGS <<< $DATA
        PRINT_INFO "${ARGS[@]}"
    fi
elif [[ $1 =~ ^[A-Za-z]{3,}$ ]]
  then
    DATA="$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements e INNER JOIN properties p ON e.atomic_number = p.atomic_number INNER JOIN types t ON p.type_id = t.type_id WHERE e.name = '$1'")"
    if [[ -z $DATA ]]
      then
        ELEMENT_NOT_FOUND
      else
        IFS='|' read -ra ARGS <<< $DATA
        PRINT_INFO "${ARGS[@]}"
    fi
fi
