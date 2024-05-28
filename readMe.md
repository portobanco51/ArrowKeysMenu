<h1 align="center">⬆️ ArrowKeys Menu - Bash Selector ⬇️</h1>

###

<h2 align="center">Welcome to ArrowKeys Menu, the game changer for user input selection inside your bash script/terminal</h2>

###

<p align="left">This module will allow you to generate an arrow keys interactive selector menu for the users within the terminal, preventing from errors or mistakes when prompting the end user for an input, capturing/returning whether the option value or the option index value.</p>

###

<p align="left">Highly customizable to suit your own needs/styles and making life easier for you and your scripts audience.</p>

###

<div align="center">
<!-- ![image](https://github.com/portobanco51/ArrowKeysMenu/assets/76289550/38a3366b-6c08-439e-8ee4-7d2146d3788e) -->
  <img height="250" src="https://github.com/portobanco51/ArrowKeysMenu/assets/76289550/38a3366b-6c08-439e-8ee4-7d2146d3788e"  />
</div>

###

<h2 align="left">Usage</h2>

###

<p align="left">To use it, just download it in your project by cloning the repo or just wget the menu.sh script, like this:</p>

###

```console
git clone https://github.com/portobanco51/ArrowKeysMenu.git
```

or

```console
wget https://raw.githubusercontent.com/portobanco51/ArrowKeysMenu/main/menu.sh
```

> [!NOTE]
> For usage when downloaded with `wget`, just `tail -30 menu.sh`

###

<p align="left">Once downloaded, you're ready to source it in your script, declare the prompt and options array, and execute the MENU command alongside the prompt and array to get in return the value or the index value selected by the user.<br><br>Here's an example:</p>

###

```sh
#!/bin/bash

# Source the script
source ./ArrowKeysMenu/menu.sh

# Declare prompt
PROMPT="Choose an option from the menu below: "

# Declare options array
OPTIONS=('Kali Linux (Best)' 'FreeBSD' 'Ubuntu' 'Windows 11' 'MacOS' 'Other')

# Call the function and pass the arguments
MENU "${PROMPT}" "${OPTIONS}"

# Extract the selected option
RESULT=${OPTIONS[$?]}

echo -e "\nYou selected: $RESULT"

```

<div align="center">
<!-- ![image](https://github.com/portobanco51/ArrowKeysMenu/assets/76289550/8193b011-ceb5-43e9-a151-2b886c2eb62c) -->
  <img height="350" src="https://github.com/portobanco51/ArrowKeysMenu/assets/76289550/8193b011-ceb5-43e9-a151-2b886c2eb62c"  />
</div>

###

<h2 align="center">⚙️ Technology stack used in the project</h2>

###

<div align="center">
  <img src="https://skillicons.dev/icons?i=linux" height="60" alt="linux logo"  />
  <img width="20" />
  <img src="https://skillicons.dev/icons?i=bash" height="60" alt="bash logo"  />
  <img width="20" />
  <img src="https://skillicons.dev/icons?i=vscode" height="60" alt="vscode logo"  />
</div>

###
