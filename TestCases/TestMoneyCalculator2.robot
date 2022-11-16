*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/ElementsKeywords.robot
Resource    ../Resources/ExcelKeywords.robot
Resource    ../Resources/ConfKeywords.robot
Test Setup    ConfKeywords.Open the Webpage and Max    ${URL}    ${browser}
Test Teardown    ConfKeywords.Close Evrything

*** Variables ***
${URL}    https://www.moneycontrol.com/fixed-income/calculator/fixed-deposit-calculator.htmlCorporates
${browser}    chrome
${testData}    TestData\\TestData.xlsx
${sheetName}    Sheet1

*** Test Cases ***
TC1
    ${rows}    ExcelKeywords.Get the Number of Rows    ${testData}    ${sheetName}
    FOR    ${row}    IN RANGE    2    ${rows}+1
        @{Data}    ExcelKeywords.Read the Whole Row    ${testData}    ${sheetName}    ${row}
        ElementsKeywords.Input the Principle    ${Data}[0]
        ElementsKeywords.Input the RateOfInterest    ${Data}[1]
        ElementsKeywords.Input the PeriodOne    ${Data}[2]
        ElementsKeywords.Input the PeriodTwo    ${Data}[3]
        ElementsKeywords.Input the Frequency    ${Data}[4]
        ElementsKeywords.Calculate
        ${x}    ElementsKeywords.Read the MaturityValue
        IF    ${x} == ${Data}[5]
            ExcelKeywords.Fill Cell Green    ${testData}    ${sheetName}    ${row}    ${9}    Pass
        ELSE
            ExcelKeywords.Fill Cell Red    ${testData}    ${sheetName}    ${row}    ${9}    Fail
        END
        ElementsKeywords.Clear the Data
        Should Match Regexp    string    pattern
    END
    