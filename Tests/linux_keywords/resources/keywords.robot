*** Settings ***
Resource    variables.robot

*** Keywords ***

Print Message ${message} To Console
    [Documentation]    Keyword validate if robot can properly execute keywords
    ...                and use varibales by printing message to Console.
    Log To Console    ${message}
