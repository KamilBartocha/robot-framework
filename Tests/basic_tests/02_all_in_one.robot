*** Settings ***
Library    ../../utils/os_operations.py
Test Setup    Log To Console    "start"
Test Teardown    Log To Console    "koniec"

*** Variables ***
${var1}    2
${var2}    3
${var3}    Ala
${cmd_ls}    ls ~/
@{list_var}    1    2    3    4

*** Keywords ***
Sum two values
    [Documentation]    TODO
    Should Not Be Empty    ${var1}
    Should Not Be Empty    ${var2}
    ${result}    Evaluate    ${var1} + ${var2}
    Log To Console    ${result}

Execute os command
    [Documentation]    TODO
    [Arguments]    ${command}
    ${rc}    Execute os Command    ${command}
    Should Not Be Empty    ${rc}


*** Test Cases ***
Sum values
    Sum two values

Execute command and except not empty return
    ${result}    Execute local command    ${cmd_ls}
    Set Local Variable    ${result}
    Should Not Be Empty    ${result}