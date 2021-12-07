*** Settings ***
Resource    variables.robot
Library     ../../../utils/math_operations.py

*** Keywords ***
Print Message ${message} To Console
    [Documentation]    Keyword validate if robot can properly execute keywords
    ...                and use varibales by printing message to Console.
    Log To Console    ${message}

Sum List Check
    [Documentation]    Check sum list internal keyword
    ${sum}    Sum List    ${odd_list}
    Log To Console    ${sum}