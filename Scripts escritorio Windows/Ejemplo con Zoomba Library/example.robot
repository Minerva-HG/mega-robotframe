*** Settings ***
Library    RPA.Windows
Library    RPA.Robocorp.Process
Library    OperatingSystem

*** Variables ***
${CalculatorApp}    calc.exe
${calculation}    5*5

*** Test Cases ***
Calcular Operación
    Open Calculator
    Enter Calculation    5*5
    Click Button    multiply
    Enter Calculation    58*23
    Click Button    equals
    Click Button    divide
    Enter Calculation    78-23
    Click Button    equals
    ${result}    Get Result
    Log    El resultado de la operación es ${result}
    Close Application

*** Keywords ***
Open Calculator
    Run    ${CalculatorApp}
    Sleep    4s

Enter Calculation
    [Arguments]    ${calculation}
    Input    CalculatorEdit    ${calculation}

Click Button
    [Arguments]    ${button_name}
    Click Button    CalculatorButton    ${button_name}

Get Result
    ${result}    Get Text    CalculatorResult
    [Return]    ${result}

Close Application
    Terminate Process    calc.exe