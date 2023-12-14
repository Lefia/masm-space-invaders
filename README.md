## Introduction
This is the final project for NCU CSIE's Assembly Language and System Programming (CE2012*).

## Start

1. Clone this repository into your workspace.
```shell
git clone https://github.com/Lefia/asm-final.git
```

2. Download the dependencies from [Here](https://drive.google.com/file/d/1rP-3o9Z4owrDwjXpgbMOdl_axcWxiuKI/view?usp=sharing)
3. Unzip the dependencies into project folder.
4. Ensure that the windows terminal(wt.exe) and powershell(pwsh.exe) are installed
5. To compile the project in Visual Studio Code, use the keyboard shortcut `Ctrl + Shift + B`.
```
// Project folder structre
.
├── .vscode
├── dependencies/
│   ├── Irvine
│   └── MASM32
├── src/
│   └── main.asm
├── tools/
│   ├── bin
│   └── scripts
├── .gitignore
├── dependencies.txt
└── README.md
```

## Roadmap
- [x] Make cannon movable
- [x] Fire the laser
- [x] Display the enemy
- [x] Attacks from enemy
- [x] Collisions handling
  - [x] Laser and enemy
  - [x] Player and enemy's laser
- [ ] Score board

## TODO
- [ ] More enemies and more enemy types
- [ ] Give player more life
- [ ] Show victory and lose screen
- [ ] Welcome screen