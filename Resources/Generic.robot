*** Settings ***
Documentation    Open Sauce demo page and verify the loging page 
Library    SeleniumLibrary
Library    Collections
Library    String


*** Variables ***
${url}    https://www.saucedemo.com/
${username}    standard_user
${password}    secret_sauce
${invalid_password}    secretsauce
${error_message_login_page}    Epic sadface: Username and password do not match any user in this service
@{Add_To_Cart_Items}=         Sauce Labs Backpack    Sauce Labs Fleece Jacket    Sauce Labs Onesie
${first_name}    xyz
${last_name}    abc
${postal_code}    110089
${successful_purchase_msg}    Thank you for your order!



*** Keywords ***
Open The Session
    Open Browser    ${url}    browser=chrome    options=add_experimental_option("detach",${true})
    Maximize Browser Window

Close the sessions
    Close Browser
    
Verify the page 
    [Arguments]    ${page_title}
    Title Should Be    ${page_title}