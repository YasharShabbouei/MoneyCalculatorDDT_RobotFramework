*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/ElementsKeywords.robot
Resource    ../Resources/ExcelKeywords.robot
Resource    ../Resources/ConfKeywords.robot

Test Setup    ConfKeywords.Open the Webpage and Max    ${URL}    ${browser}
Test Teardown    ConfKeywords.Close Evrything

Library    DataDriver    ${testData}    sheet_name=${sheetName}
Test Template    Test using the DDT

*** Variables ***
${URL}    https://www.moneycontrol.com/fixed-income/calculator/fixed-deposit-calculator.htmlCorporates
${browser}    chrome
${testData}    TestData\\TestData.xlsx
${sheetName}    Sheet1

*** Test Cases ***
TC1    ${Principle}    ${Rate of Interest}    ${Period One}
    ...    ${Period Two}    ${Frequency}    ${Maturity Value}
    
    

*** Keywords ***
Test using the DDT
    [Arguments]    ${Principle}    ${Rate of Interest}    ${Period One}
    ...    ${Period Two}    ${Frequency}    ${Maturity Value}
    ElementsKeywords.Input the Principle    ${Principle}
    ElementsKeywords.Input the RateOfInterest    ${Rate of Interest}
    ElementsKeywords.Input the PeriodOne    ${Period One}
    ElementsKeywords.Input the PeriodTwo    ${Period Two}
    ElementsKeywords.Input the Frequency    ${Frequency}
    ElementsKeywords.Calculate
    ${x}    ElementsKeywords.Read the MaturityValue
    ${Maturity}    Convert To Number    ${Maturity Value}
    Should Be Equal    ${x}    ${Maturity}
    ElementsKeywords.Clear the Data