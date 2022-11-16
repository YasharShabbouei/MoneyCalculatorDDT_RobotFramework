*** Settings ***
Library    SeleniumLibrary

Variables    ..${/}PageObjects${/}MoneyControlElements.py


*** Keywords ***
Click the Cookies Confirm
    Click Button    ${btn_confirm}
    
Input the Principle
    [Arguments]    ${principleValue}
    Input Text    ${Principal}    ${principleValue}

Input the RateOfInterest
    [Arguments]    ${RateOfInterestValue}
    Input Text    ${RateOfInterest}    ${RateOfInterestValue}

Input the PeriodOne
    [Arguments]    ${PeriodOneValue}
    Input Text    ${PeriodOne}    ${PeriodOneValue}

Input the PeriodTwo
    [Arguments]    ${PeriodTwoValue}
    Select From List By Label    ${PeriodTwo}    ${PeriodTwoValue}

Input the Frequency
    [Arguments]    ${FrequencyValue}
    Select From List By Label    ${Frequency}    ${FrequencyValue}

Calculate
    Click Image    ${btn_Calculate}

Read the MaturityValue
    ${x}    Get Text    ${MaturityValue}
    ${maturity}    Convert To Number    ${x}
    [Return]    ${maturity}

Clear the Data
    Click Image    ${btn_clear}