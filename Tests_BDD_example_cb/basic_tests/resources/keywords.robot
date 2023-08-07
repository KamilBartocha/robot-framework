*** Settings ***
Resource    variables.robot
Library     ../../../utils/math_operations.py

*** Keywords ***
Print Message ${message} To Console
    [Documentation]    Keyword validate if robot can properly execute keywords
    ...                and use varibales by printing message to Console.
    Log To Console    ${message}

Select two numbers
    [Documentation]    Selects two int numbers from variables
    Set Test Variable    ${num1}
    Set Test Variable    ${num2}

Sum two numbers
    [Documentation]    Sum two numbers and set result as global variable
    ${sum}    Evaluate    ${num1} + ${num2}
    Set Global Variable    ${sum}

Sum equals desired value
    [Documentation]    Checks if sum equals real value
    Should Be Equal As Integers    ${sum}    ${8}
