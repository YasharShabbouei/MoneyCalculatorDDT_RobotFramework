*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/ElementsKeywords.robot

*** Keywords ***
Open the Webpage and Max
    [Arguments]    ${URL}    ${browser}
    Open Browser    ${URL}    ${browser}
    Maximize Browser Window
    ElementsKeywords.Click the Cookies Confirm

Close Evrything
    Sleep    5s
    Run Keyword If Test Failed    Take Screenshot on Fail
    Close All Browsers

Take Screenshot on Fail
    Capture Element Screenshot    xpath://*[@id="mc_mainWrapper"]/div[2]/div/div[4]/div