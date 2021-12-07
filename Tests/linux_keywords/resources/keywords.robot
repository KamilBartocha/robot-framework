*** Settings ***
Resource    variables.robot
Library     OperatingSystem
Library     Collections
Library     String
Library     ../../../utils/math_operations.py

*** Keywords ***
Get Dict With NIC Statistics Via Ethtool On ${port_name} Port
    [Documentation]    Creates dictionary with counter values via ethtool.
    ${dict_counters}     Create Dictionary
    @{output}    Execute Linux    /usr/sbin/ethtool -S ${port_name}
    @{output}    Evaluate    @{output}\[1:]
    FOR    ${item}    IN    @{output}
        ${counter_name}     Should Match Regexp    ${item}    [a-z]\\w+
        ${counter_number}    Should Match Regexp    ${item}    \\s\\d+
        Set To Dictionary    ${dict_counters}    ${counter_name}=${counter_number}
    END
    [Return]    ${dict_counters}

Get Counter ${COUNTER_NAME} Value Via Ethtool On ${port_name} Port
    [Documentation]    Gets number of packets(COUNTER_NAME) that occured in
    ...                ethtool on specific port.
    ${counters}    Get Dict With NIC Statistics Via Ethtool On ${port_name} Port
    ${value}    Evaluate    ${counters}[${counter_name}]
    [Return]    ${value}

Get Counter ${counter_name} Value Via NetDev On ${port_name} Port
    [Documentation]    Gets number of packets/bytes reviced or transmited
    ...                that occured in /proc/net/dev on specific port.
    ${val}    Evaluate    ${MAP_VALUES}[${counter_name}]
    ${output}    Execute Linux Command
    ...          cat /proc/net/dev | grep ${port_name}: | awk '{ print $${val} }'
    [Return]    ${output}

Counters Should Be Equal
    [Documentation]    Checks if counters are equal
    [Arguments]    ${c_name}     ${counter_1}    ${counter_2}
    Should Be True    ${counter_1} == ${counter_2}
    ...               msg=${c_name} wrong value! CIMS:${counter_1} Expected:${counter_2}


Error Packets Should Be Equal
    [Documentation]    TODO
    ${ethtool_c}    Get Counter tx_frame_error Value Via Ethtool On arb0p0 Port
    ${netdev_c}    Get Counter errs Value Via NetDev On arb0p0 Port
    Counters Should Be Equal    Errors    ${ethtool_c}    ${netdev_c}
