*** Settings ***
Resource    ../Resources/Generic.robot
Library    String
Library    Collections


*** Keywords ***
Enter the credential and hit login button
    [Arguments]    ${username}    ${password}
    Input Text    user-name    ${username}
    Input Password    password    ${password}
    Click Element    css:#login-button


Validate error message
    Wait Until Element Is Visible    (//h3[contains(text(),'Epic sadface: Username and password do not match a')])[1]

