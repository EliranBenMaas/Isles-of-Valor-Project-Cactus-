# Isles of Valor (Project Cactus)

Welcome to **Isles of Valor** (originally known as *Project Cactus*). [cite_start]This project is a modular 2D top-down game prototype built using Lua and the LÖVE (Love2D) framework[cite: 1, 47]. 

[cite_start]The primary goal of this codebase was to establish a solid architectural foundation for a game loop, state transitions, and asset management[cite: 47, 51]. [cite_start]Having accomplished these goals, this repository is now preserved as a successful training ground and learning sandbox as I transition into C++ game development[cite: 1, 53, 60].

## 🚀 Key Features Implemented
* [cite_start]**State Machine Architecture:** Clean separation of core modules into `main_Menu.lua` and `play_State.lua`, managed dynamically via `main.lua`[cite: 47].
* [cite_start]**Dynamic Resolution:** Integration of the `push` library to handle virtual resolutions and seamless window rendering[cite: 47].
* [cite_start]**Spritesheet Animations:** Smooth rendering of movement (WASD) and attack sequences mapped dynamically using the `anim8` library[cite: 47].
* [cite_start]**Custom UI Elements:** Implemented specialized cursor mapping and interactive hover/click button mechanics within the menu loop[cite: 47].

## 🛠️ Built With
* [cite_start][LÖVE (Love2D)](https://love2d.org/) - 2D Game Framework [cite: 1]
* [cite_start][anim8](https://github.com/kikito/anim8) - Animation library for LÖVE [cite: 47]
* [cite_start][push](https://github.com/Ulydev/push) - A simple resolution-handling library for LÖVE [cite: 47]
* Art Assets: *Tiny Swords (Free Pack)*

## 📂 Project Status
[cite_start]This prototype is considered **complete as a technical milestone**[cite: 46, 53]. [cite_start]While there is a massive roadmap of potential mechanics left on the table, the core engineering objectives were met, allowing me to shift focus toward native C++ implementation[cite: 1, 49, 51].