*** Settings ***
Documentation    This Test Suite covers linux cmd keywords
Resource         resources/keywords.robot
Force Tags       PRINT

*** Test Cases ***
Test Calculate Two Numbers
    Given Select two numbers
    When Sum two numbers
    Then Sum equals desired value
