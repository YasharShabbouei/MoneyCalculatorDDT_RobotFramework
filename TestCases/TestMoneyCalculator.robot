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
        ${Principle}    ExcelKeywords.Read Data From Excel Cell
        ...    ${testData}    ${sheetName}    ${row}    ${1}
        ${rate}    ExcelKeywords.Read Data From Excel Cell
        ...    ${testData}    ${sheetName}    ${row}    ${2}
        ${PeriodOne}    ExcelKeywords.Read Data From Excel Cell
        ...    ${testData}    ${sheetName}    ${row}    ${3}
        ${PeriodTwo}    ExcelKeywords.Read Data From Excel Cell
        ...    ${testData}    ${sheetName}    ${row}    ${4}
        ${interest}    ExcelKeywords.Read Data From Excel Cell
        ...    ${testData}    ${sheetName}    ${row}    ${5}
        ${Maturity}    ExcelKeywords.Read Data From Excel Cell
        ...    ${testData}    ${sheetName}    ${row}    ${6}

        ElementsKeywords.Input the Principle    ${Principle}
        ElementsKeywords.Input the RateOfInterest    ${rate}
        ElementsKeywords.Input the PeriodOne    ${PeriodOne}
        ElementsKeywords.Input the PeriodTwo    ${PeriodTwo}
        ElementsKeywords.Input the Frequency    ${interest}
        ElementsKeywords.Calculate
        ${x}    ElementsKeywords.Read the MaturityValue
        #${result}    Should Be Equal    ${x}    ${Maturity}
        IF    ${x} == ${Maturity}
            ExcelKeywords.Fill Cell Green    ${testData}    ${sheetName}    ${row}    ${8}    Pass
        ELSE
            ExcelKeywords.Fill Cell Red    ${testData}    ${sheetName}    ${row}    ${8}    Fail
        END
        ElementsKeywords.Clear the Data
    END
    