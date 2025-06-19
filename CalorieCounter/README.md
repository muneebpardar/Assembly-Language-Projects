# Calorie Counter

## Project Description
The Calorie Counter is an assembly language program designed to calculate the total calories, protein, carbs, and fat based on selected food items. The program includes categories such as fruits, vegetables, grains, and meat, allowing users to track their nutritional intake effectively.

---

## Features
- **Food Categories**: Includes fruits, vegetables, grains, and meat.
- **Nutritional Calculation**: Calculates total calories, protein, carbs, and fat for selected food items.
- **User-Friendly**: Allows users to input their choices and view detailed nutritional information.

---

## Inputs and Outputs
- **Input**: User's selection of food items from predefined categories.
- **Output**: Total calories, protein, carbs, and fat calculated based on the selected items.

---

## Where to Run

### emu8086
This program was tested on the x86 emulator [emu8086](https://emu8086.en.lo4d.com/windows#:~:text=Tutorial....-,Emu8086%20is%20a%20Microprocessor%20Emulator%20with%20an%20integrated%208086%20Assembler,memory%20and%20input%2Foutput%20devices.). You can use emu8086 to run and debug the code.

### Visual Studio Code
You can also run this assembly program in Visual Studio Code. Follow the steps below to set up and run assembly code in VS Code:

1. **Install Visual Studio Code**: Download and install Visual Studio Code from [here](https://code.visualstudio.com/).

2. **Install MASM or TASM**: Ensure you have MASM or TASM installed on your system to assemble and link the code.

3. **Install the Code Runner Extension**:
   - Open Visual Studio Code.
   - Go to the Extensions view by clicking on the Extensions icon in the Activity Bar on the side of the window.
   - Search for "Code Runner" and install it.

4. **Set Up Your Workspace**:
   - Create a folder for your assembly project.
   - Place your `.asm` files in the folder.

5. **Configure Tasks**:
   - Create a `tasks.json` file in the `.vscode` folder inside your project directory.
   - Add the following configuration to assemble and run your assembly code:
     ```json
     {
       "version": "2.0.0",
       "tasks": [
         {
           "label": "Build Assembly",
           "type": "shell",
           "command": "ml",
           "args": ["/c", "/coff", "${file}"],
           "group": {
             "kind": "build",
             "isDefault": true
           }
         },
         {
           "label": "Run Assembly",
           "type": "shell",
           "command": "link",
           "args": ["/subsystem:console", "${fileBasenameNoExtension}.obj"],
           "group": {
             "kind": "build",
             "isDefault": true
           }
         }
       ]
     }
     ```

6. **Run Your Code**:
   - Open your `.asm` file in Visual Studio Code.
   - Press `Ctrl+Shift+B` to build the assembly code.
   - Run the executable file generated in the terminal.

---

## Remarks
- Ensure the code is thoroughly tested before running.
- This project is a practical example of using assembly language for nutritional tracking.

---

## Contributor
- **Muhammad Muneeb**