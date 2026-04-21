#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -At -c"
RANDOM_NUM=$(( (RANDOM % 1000) + 1 ))
TRIES=0

LOGIN() {
echo Enter your username:
read USERNAME
USER_DETAILS="$($PSQL "SELECT * FROM users WHERE username = '$USERNAME'")"

if [[ -z $USER_DETAILS ]]
  then
    INSERT="$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")"
    echo Welcome, $USERNAME! It looks like this is your first time here.
  else
    IFS='|' read -ra ARGS <<< $USER_DETAILS
    echo Welcome back, ${ARGS[1]}! You have played ${ARGS[2]} games, and your best game took ${ARGS[3]} guesses.
fi
GUESS_PROMPT
}

GUESS_PROMPT() {
  if [[ -z $1 ]]
  then
    echo "Guess the secret number between 1 and 1000:"
  else
    echo $1
  fi

  read GUESS

  if VALIDATE_INPUT $GUESS
    then
      ((TRIES++))

      if [[ $GUESS > $RANDOM_NUM ]]
      then
        GUESS_PROMPT "It's lower than that, guess again:"
      elif [[ $GUESS < $RANDOM_NUM ]]
      then
        GUESS_PROMPT "It's higher than that, guess again:"
      elif [[ $GUESS == $RANDOM_NUM ]]
      then
        echo You guessed it in $TRIES tries. The secret number was $RANDOM_NUM. Nice job!
        IFS='|' read -r ID USERNAME GAMES_PLAYED BEST_GAME <<< $USER_DETAILS
        ((GAMES_PLAYED++))
        if [[ $TRIES -lt $BEST_GAME ]]
          then 
          BEST_GAME=$TRIES
        fi
        UPDATE="$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $BEST_GAME WHERE username='$USERNAME'")"
    
  fi
  else
      GUESS_PROMPT "Please enter a number:"
fi
}

VALIDATE_INPUT() {
  if [[ $1 =~ ^[0-9]+$ ]]
    then
      return 0
    else
      return 1
  fi
}

LOGIN