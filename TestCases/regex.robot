*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${text}    Hello this Is 123-1233-123 in qwe@gmail.com  gdfgdfg  January 1, 2009

*** Test Cases ***
tc1:
    ${regex}    set variable    [A-Z][a-z]*\\s\\d{1,2}
    ${result}    Get Regexp Matches    ${text}    ${regex}
    Log To Console    ${result}