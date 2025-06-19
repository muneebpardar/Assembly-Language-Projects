
# Easypaisa Simulation

## Project Description
The Easypaisa Simulation is an assembly language program that mimics the functionality of the Easypaisa application. It allows users to perform various financial operations such as balance checking, depositing, withdrawing, bill payments, ticket purchases, and food ordering.

---

## Features
- **Balance Checking**: View the current balance.
- **Depositing and Withdrawing**: Add or withdraw money from the account.
- **Bill Payments**: Pay utility bills directly.
- **Ticket Purchases**: Buy tickets for transportation or events.
- **Food Ordering**: Order food items and calculate the total cost.

---

## Inputs and Outputs
- **Input**: User's selection of operations and relevant details (e.g., amount, bill type, ticket type).
- **Output**: Updated balance and confirmation of completed transactions.

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
- This project is a practical example of using assembly language for simulating financial applications.

---

## Contributor
- **Muhammad Muneeb**