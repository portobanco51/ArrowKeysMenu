<h1 align="center">⬆️ ArrowKeys Menu - Bash Selector ⬇️</h1>

###

<h2 align="center">Welcome to ArrowKeys Menu, the game changer for user input selection inside your bash script/terminal</h2>

###

<p align="left">This module will allow you to generate an arroy keys interactive selector menu for the users within the terminal, preventing from errors or mistakes when prompting the end user for an input, capturing/returning whether the option value or the option index value.</p>

###

<p align="left">Highly customizable to suit your own needs/styles and making life easier for you and your scripts audience.</p>

###

<div align="center">
  <!-- ![image](https://github.com/portobanco51/bashMenu/assets/76289550/ee0b76cc-5a3c-4a12-a866-ff974119eeee) -->
  <img height="250" src="https://github.com/portobanco51/bashMenu/assets/76289550/ee0b76cc-5a3c-4a12-a866-ff974119eeee"  />
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
wget https://raw.githubusercontent.com/portobanco51/bashMenu/main/menu.sh
```

###

<p align="left">Once downloaded, you're ready to source it in your script, declare the options array, and execute the MENU command alongside the array and get in return the value or the index value selected by the user.<br><br>Here's an example:</p>

###

```sh
#!/bin/bash

source ./bashMenu/menu.sh

OPTIONS=('Option1' 'Option2' 'Option3')
clear
MENU ${OPTIONS[@]}
RESULT=${OPTIONS[$?]}

echo -e "\nYou selected: $RESULT"

```
<div align="center">
<!-- ![image](https://github.com/portobanco51/bashMenu/assets/76289550/41b4cd26-87e4-4a20-b6be-591d4a21ca9f) -->
  <img height="250" src="https://github.com/portobanco51/bashMenu/assets/76289550/41b4cd26-87e4-4a20-b6be-591d4a21ca9f"  />
</div>

###

<h2 align="center">⚙️ Technologies stack used in the project</h2>

###

<div align="center">
  <img src="https://skillicons.dev/icons?i=linux" height="40" alt="linux logo"  />
  <img width="12" />
  <img src="https://skillicons.dev/icons?i=bash" height="40" alt="bash logo"  />
  <img width="12" />
  <img src="https://skillicons.dev/icons?i=vscode" height="40" alt="vscode logo"  />
</div>

###
