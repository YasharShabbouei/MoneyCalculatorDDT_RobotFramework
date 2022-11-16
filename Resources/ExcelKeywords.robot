*** Settings ***
Library    ..${/}ExternalCodes${/}ReadWriteExcel.py

*** Keywords ***
Get the Number of Rows
    [Arguments]    ${fileName}    ${sheetName}
    ${rows}    ReadWriteExcel.Get Row Count    ${fileName}    ${sheetName}
    [Return]    ${rows}

Read Data From Excel Cell
    [Arguments]    ${fileName}    ${sheetName}    ${row}    ${col}
    ${data}    ReadWriteExcel.Read Data    ${fileName}    ${sheetName}    ${row}    ${col}
    [Return]    ${data}

Write Data To Excel Cell
    [Arguments]    ${fileName}    ${sheetName}    ${row}    ${col}    ${data}
    ReadWriteExcel.Write Data    ${fileName}    ${sheetName}    ${row}    ${col}    ${data}

Fill Cell Green
    [Arguments]    ${fileName}    ${sheetName}    ${row}    ${col}    ${data}
    ReadWriteExcel.Fill Green Color    ${fileName}    ${sheetName}    ${row}    ${col}    ${data}

Fill Cell Red
    [Arguments]    ${fileName}    ${sheetName}    ${row}    ${col}    ${data}
    ReadWriteExcel.Fill Red Color    ${fileName}    ${sheetName}    ${row}    ${col}    ${data}

Read the Whole Row
    [Arguments]    ${fileName}    ${sheetName}    ${row}
    @{data}    ReadWriteExcel.Read The Whole Row    ${fileName}    ${sheetName}    ${row}
    [Return]    ${data}