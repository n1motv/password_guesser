Script Name: password_guesser.sh
Description:
This Bash script is designed to generate potential passwords based on user-provided information such as first name, last name, birthday, pet name, father's name, and mother's name. It offers an option to add characters to the generated passwords at the beginning, end, or middle. The potential passwords are then saved in a file named password_guesser.txt.

Usage:
1.	Execute the script with optional arguments:
./password_guesser.sh [OPTIONS] 
2.	Available options:
•	-h, --help: Displays usage information.
•	-p, --plus: Allows adding characters to potential passwords.
3.	The script prompts the user to input various pieces of information. Press Enter to skip any input.
4.	After providing the information, the script generates potential passwords by combining different pieces of information in various ways.
5.	If the -p or --plus option is provided, the script prompts the user to add characters to the generated passwords and specify the position (beginning, end, or middle).
6.	The potential passwords are saved in a file named password_guesser.txt in the same directory as the script.
Example:
./password_guesser.sh -p 
This command runs the script with the option to add characters to potential passwords.
Dependencies:
•	Bash shell
