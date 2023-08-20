*** Settings ***
Library    String
Library    Collections
Library    resources/MathLibrary.py

*** Variables ***
${var1}    0
${var2}    0

*** Keywords ***
Add two values
    [Arguments]    ${val1}    ${val2}
    [Documentation]    TODO
    ${result}    Evaluate    ${val1} + ${val2}
    RETURN    ${result}

*** Test Cases ***
Variable should not be empty test
    [Documentation]    TODO
    [Tags]    01
    Set Suite Variable    ${var1}    1
    Set Local Variable    ${var2}    0
    Should Be True    ${var1} == 1
    Log To Console    done

Add values test
    [Documentation]    TODO
    [Tags]    02
    Set Local Variable    ${var1}    3
    ${var2}    Set Variable    4
    ${result}    Add two values    ${var1}    ${var2}
    Should Be True    ${result} == 7
    Log To Console    ${result}

Internal Library Test
    [Tags]    03
    ${var_l}    Create List     ${2}    ${2}    ${1}
    log to console    ${var_l}
    ${result}    Sum List    ${var_l}
    Should be True    ${result} == 5