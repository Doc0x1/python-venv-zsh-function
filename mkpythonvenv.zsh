mkpythonvenv() {
  if [ $# -eq 0 ]; then
    if [[ -d "./venv" ]]; then
      printf "venv directory already exists. Will source it...\n" && sleep 1
      source ./venv/bin/activate
    else
      while true; do
      printf "Are you sure you want to create a python venv directory here: $(pwd) ?\n"
      read "yn?[Y/n]: "
        case $yn in
          [Yy]* )
            printf "Creating virtual environment venv in $(pwd) ...\n"
            /bin/python3 -m venv venv
            printf "Finished creating python virtual environment. Will now source it...\n" && sleep 1
            source ./venv/bin/activate
            break ;;
          [Nn]* )
            printf "Okay, not setting up a venv directory here.\n"
            break ;;
          * )
            printf "Please provide a valid answer.\n" ;;
        esac
      done
    fi
  else
    printf "Why are you providing arguments? Just go to the directory and use the command.\n"
  fi
}
