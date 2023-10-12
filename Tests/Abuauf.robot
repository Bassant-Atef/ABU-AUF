*** Settings ***
Documentation   Automation test for AbuAuf
Library         SeleniumLibrary

*** Variables ***

*** Test Cases ***
Test Case 1
    [Documentation]                     Making an order as logged user -Login with valid data only
    [Tags]                              001 Smoke
    Open Browser                        https://frontend.woosonicpwa.com/login      Firefox
    Maximize Browser Window
    Input Text                          css:[data-testid=input-username]            mitchdesignstest@gmail.com
    Input Password                      css:[data-testid=input-password]            Mitch1
    Click Button                        تسجيل الدخول
    Sleep                               3sec
    Page Should Contain                 مرحبا
    Sleep                               3sec
    Go To                               https://frontend.woosonicpwa.com/offers
    Wait Until Element Is Visible       css:[data-testid=add_to_cart-button]        timeout=30s
    Click Element                       css:[data-testid=add_to_cart-button]
    Go To                               https://frontend.woosonicpwa.com/cart
    Wait Until Element Is Visible       css:[data-testid=open_coupon-button]        timeout=30s
    Click Element                       css:[data-testid=open_coupon-button]
    Page Should Contain Button          اضف
    Input Text                          css:[data-testid=input-coupon]              CTest
    Click Button                        css:[data-testid=button-submit]
    Page Should Contain                 خطأ في البرومو كود
    Sleep                               5sec
    Input Text                          css:[data-testid=input-coupon]              ${EMPTY}
    Input Text                          css:[data-testid=input-coupon]              testojja
    Click Button                        css:[data-testid=button-submit]
    Page Should Contain                 تم تطبيق البرومو كود بنجاح
    Click Link                          css:[data-testid=checkout-link]
    Sleep                               15sec
    Wait Until Element Is Visible       css:[data-testid=button-next_step]        timeout=60s
    Click Element                       css:[data-testid=button-next_step]
    Sleep                                30sec
    Execute JavaScript                   window.scrollTo(1406, 922)
    Scroll Element Into View             css:[data-testid=checkbox-terms]
    Click Element                        css:[data-testid=checkbox-terms]
    Click Button                         css:[data-testid=button-submit]
    Page Should Contain                  شكرا لك

Test Case 2
    [Documentation]                     Making an order as logged user [As a gift]
    [Tags]                              002 Smoke
    Open Browser                        https://frontend.woosonicpwa.com/login      Firefox
    Maximize Browser Window
    Input Text                          css:[data-testid=input-username]            mitchdesignstest@gmail.com
    Input Password                      css:[data-testid=input-password]            Mitch1
    Click Button                        تسجيل الدخول
    Page Should Contain                 مرحبا
    Sleep                               3sec
    Go To                               https://frontend.woosonicpwa.com/offers
    Wait Until Element Is Visible       css:[data-testid=add_to_cart-button]        timeout=30s
    Click Element                       css:[data-testid=add_to_cart-button]
    Go To                               https://frontend.woosonicpwa.com/cart
    Wait Until Element Is Visible       css:[data-testid=open_coupon-button]        timeout=30s
    Click Element                       css:[data-testid=open_coupon-button]
    Page Should Contain Button          اضف
    Input Text                          css:[data-testid=input-coupon]              CTest
    Click Button                        css:[data-testid=button-submit]
    Page Should Contain                 خطأ في البرومو كود
    Sleep                               5sec
    Input Text                          css:[data-testid=input-coupon]              ${EMPTY}
    Input Text                          css:[data-testid=input-coupon]              testojja
    Click Button                        css:[data-testid=button-submit]
    Page Should Contain                 تم تطبيق البرومو كود بنجاح
    Click Link                          css:[data-testid=checkout-link]
    Wait Until Page Contains            css:[data-testid=radio-gift]    timeout=30s
    Select Radio Button                 css:[data-testid=radio-gift]    value=gift

*** Keywords ***
