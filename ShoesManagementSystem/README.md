# Shoes Management System

## Project Description
The Shoes Management System is an assembly language program designed to manage shoe inventory and sales. It tracks stock, calculates total sales, and displays statistics for different shoe categories. This project demonstrates the use of assembly language for inventory management and sales tracking.

---

## Features
- **Inventory Management**: Tracks the stock of shoes in different categories.
- **Sales Calculation**: Calculates total sales based on user purchases.
- **Statistics Display**: Provides detailed statistics for shoe categories and sales.

---

## Inputs and Outputs
- **Input**: User's selection of shoe categories and quantities.
- **Output**: Updated inventory, total sales, and category statistics.

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
- This project is a practical example of using assembly language for inventory and sales management.

---

## Contributor
- **Muhammad Muneeb**