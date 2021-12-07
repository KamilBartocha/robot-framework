*** Settings ***
Documentation    This Test Suite covers linux cmd keywords
Resource         resources/keywords.robot
Force Tags       PRINT

*** Test Cases ***
Print To Console
    [Documentation]    Checks robot works, TC should print some msg to Console
    Print Message ${hello_msg} To Console
