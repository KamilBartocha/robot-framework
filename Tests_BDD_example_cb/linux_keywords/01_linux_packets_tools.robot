*** Settings ***
Resource    resources/keywords.robot
Force Tags    LINUX

*** Test Cases ***
TC01 Error Pacets Values Of Should Be Equal
    [Documentation]    TODO
    [Tags]    TS01TC01
    Error Packets Should Be Equal
