*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}          http://loadrunnertips.com/LoadRunner_Correlation_Challenge_Mod.aspx
${BROWSER}      Chrome
${COUNT}        2
*** Keywords ***

*** Test Cases ***
Opening
    Open browser    ${URL}   ${BROWSER} 
Click start Button
    Click Button    id:head_btnStart
Enter number in the field
    ${NUMBER_VALUE}     Get Text     id:head_lblMagicno
    Input Text  id:head_txtMacigNo  ${NUMBER_VALUE}
    Click Button    id:head_btnNext
Select default value from dropdown list
    Click Button    id:Button1
Select from table
    ${TABLE_RANGE}  Get Element Count   xpath://*[@id="head_divStep3"]/table/tbody/tr
    ${TABLE_RANGE}  Evaluate    ${TABLE_RANGE}-1
    FOR  ${X}  IN RANGE  ${TABLE_RANGE}
        ${CELL_CONTENT}  Get Table Cell  xpath://*[@id="head_divStep3"]/table  ${COUNT}  3
        IF  "${CELL_CONTENT}" == "On Time"
            Select Checkbox  xpath://*[@id="head_divStep3"]/table/tbody/tr[${COUNT}]/td[4]/input  
        END  
        ${COUNT}  Evaluate  ${COUNT}+1
    END
    Click Button  id:head_btnNext3
    