*** Settings ***
Resource    ../Resources/Generic.robot
Library    String
Library    Collections
Library    SeleniumLibrary
*** Variables ***
${Add_to_cart_string}    Sauce Labs Backpack Sauce Labs Fleece Jacket Sauce Labs Onesie
   

*** Keywords ***
Add all desired products to cart and verify the list
    @{Add_To_Cart_Items}=     Create List     Sauce Labs Backpack    Sauce Labs Fleece Jacket    Sauce Labs Onesie
    FOR    ${item}     IN     @{Add_To_Cart_Items}
        Click Element    xpath://*[text()='${item}']
        Wait Until Element Is Visible    //div[@class='inventory_details_name large_size']
        Click Button    xpath://button[text()='Add to cart']
        Click Button    xpath://button[text()='Back to products']
    END
    Click Element    xpath://a[@class='shopping_cart_link']
    @{cart_list}=    Get Webelements    css:.inventory_item_name
    @{added_item}=    Create List
    FOR    ${elements}    IN     @{cart_list}
        Log    ${elements.text}
        Append To List       ${added_item}    ${elements.text}
    END
    Lists Should Be Equal       ${Add_To_Cart_Items}   ${added_item}

Checkout the product
    Click Element    checkout

Make a purchase and verify the purchase
    Input Text    first-name    ${first_name}
    Input Text    last-name    ${last_name}
    Input Text    postal-code    ${postal_code}
    Click Element    continue
    Click Element    finish
    ${obtained_msg}    Get Text    css:.complete-header
    Should Be Equal As Strings    ${successful_purchase_msg}    ${obtained_msg}



