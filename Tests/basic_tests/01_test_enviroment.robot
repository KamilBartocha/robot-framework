*** Settings ***
Documentation    This Test Suite covers linux cmd keywords
Resource         resources/keywords.robot
Test Tags       PRINT

*** Test Cases ***
Print To Console
    [Documentation]    Checks if robot works, TC should print some msg to Console
    Print Message ${hello_msg} To Console
Sum List
    [Documentation]    Call sum list keyword
    Sum List Check
