*** Settings ***
Documentation    Login page for sauce demo
Resource    ../Page/SwagLabs.robot
Resource    ../Resources/Generic.robot
Resource    ../Page/Products.robot
Library    String
Library    Collections
Test Setup    Open The Session
Test Teardown    Close The Sessions

*** Variables ***
${page_name}    Swag Labs

*** Test Cases ***
Verify unsuccessful login attempt
    SwagLabs.Enter the credential and hit login button    ${username}    ${invalid_password}
    SwagLabs.Validate error message

Verify successful login attempt
    SwagLabs.Enter the credential and hit login button    ${username}    ${password}
    Generic.Verify the page    ${page_name}

Make a successful purchase and verify the purchase
    SwagLabs.Enter the credential and hit login button    ${username}    ${password}
    Generic.Verify the page    ${page_name}
    Products.Add all desired products to cart and verify the list
    Products.Checkout the product
    Products.Make a purchase and verify the purchase
