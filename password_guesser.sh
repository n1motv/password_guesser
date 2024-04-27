#!/bin/bash

# Function to display usage information of the script
display_help_doc() {
    echo "Usage: $0 [OPTIONS]"
    echo "Generate potential passwords based on user information."
    echo "Options:"
    echo "  -h, --help       Display this help message and exit"
    echo "  -p, --plus       Allow adding characters to potential passwords"
    exit 0
}

# Function to generate potential passwords
generate_passwords() {
    local passwords=()
    local modified_passwords=()

    if [[ ! -z $first_name && ! -z $last_name ]]; then
        passwords+=("$first_name$last_name")
        passwords+=("$last_name$first_name")
    fi

    if [[ ! -z $first_name && ! -z $birthday ]]; then
        passwords+=("$first_name$birthday")
        passwords+=("$birthday$first_name")
    fi

    if [[ ! -z $last_name && ! -z $birthday ]]; then
        passwords+=("$last_name$birthday")
        passwords+=("$birthday$last_name")
    fi

    if [[ ! -z $first_name && ! -z $pet_name ]]; then
        passwords+=("$first_name$pet_name")
        passwords+=("$pet_name$first_name")
    fi

    if [[ ! -z $last_name && ! -z $pet_name ]]; then
        passwords+=("$last_name$pet_name")
        passwords+=("$pet_name$last_name")
    fi

    if [[ ! -z $first_name && ! -z $father_name ]]; then
        passwords+=("$first_name$father_name")
        passwords+=("$father_name$first_name")
    fi

    if [[ ! -z $first_name && ! -z $mother_name ]]; then
        passwords+=("$first_name$mother_name")
        passwords+=("$mother_name$first_name")
    fi

    if [[ ! -z $last_name && ! -z $father_name ]]; then
        passwords+=("$last_name$father_name")
        passwords+=("$father_name$last_name")
    fi

    if [[ ! -z $last_name && ! -z $mother_name ]]; then
        passwords+=("$last_name$mother_name")
        passwords+=("$mother_name$last_name")
    fi

    if [[ ! -z $birthday && ! -z $pet_name ]]; then
        passwords+=("$birthday$pet_name")
        passwords+=("$pet_name$birthday")
    fi

    if [[ ! -z $birthday && ! -z $father_name ]]; then
        passwords+=("$birthday$father_name")
        passwords+=("$father_name$birthday")
    fi

    if [[ ! -z $birthday && ! -z $mother_name ]]; then
        passwords+=("$birthday$mother_name")
        passwords+=("$mother_name$birthday")
    fi

    if [[ ! -z $plus_char ]]; then
        for pass in "${passwords[@]}"; do
            local len=${#pass}
            local mid=$((len / 2))
            pass_begin="$plus_char$pass"
            pass_mid="${pass:0:$mid}$plus_char${pass:$mid}"
            pass_end="$pass$plus_char"
            modified_passwords+=("$pass_begin")
            modified_passwords+=("$pass_mid")
            modified_passwords+=("$pass_end")
        done
        echo "${modified_passwords[@]}" | tr ' ' '\n' # Each modified password on a new line
    else
        echo "${passwords[@]}" | tr ' ' '\n' # Each password on a new line
    fi
}

# Main script starts here
if [[ $# -eq 0 ]]; then
    echo "No options provided. Running normally."
fi

while [[ $# -gt 0 ]]; do
    case $1 in
        -h | --help)
            display_help_doc
            ;;
        -p | --plus)
            plus=true
            ;;
        *)
            echo "Error: Unknown option '$1'. Use -h or --help for usage information."
            exit 1
            ;;
    esac
    shift
done

echo "Enter your information (Press Enter to skip):"

read -p "First name: " first_name
read -p "Last name: " last_name
read -p "Birthday: " birthday
read -p "Pet name: " pet_name
read -p "Father's name: " father_name
read -p "Mother's name: " mother_name

if [[ $plus ]]; then
    read -p "Enter character to add: " plus_char
fi

passwords=$(generate_passwords)

echo "$passwords" > password_guesser.txt*
echo "Potential passwords saved in password_guesser.txt"
