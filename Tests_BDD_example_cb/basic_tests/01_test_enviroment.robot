*** Settings ***
Documentation    This Test Suite covers calculator
Resource         resources/keywords.robot
Force Tags       Calculator

*** Test Cases ***
Test Calculator Add Two Numbers
    Given Select two numbers
    When Sum two numbers
    Then Sum equals desired value
