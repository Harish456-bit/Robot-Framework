*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}      http://65.21.6.71:7060/alstom-icc/#/

#http://127.0.0.1:8080/#/

*** Keywords ***
LaunchBrowser
    OPEN BROWSER    ${url}      ${browser}
    maximize browser window
Launch Headless Chrome
    [Documentation]    Open Chrome in headless mode
    Create Webdriver    Chrome    options=add_argument(--headless)
Input username
    [Arguments]    ${username}
    input text     xpath:(//input[@id='fr'])[1]    ${username}

Input passwd
    [Arguments]    ${password}
    input text     xpath:(//input[@id='fr'])[2]    ${password}
submit
    click element    xpath://button[text()='SUBMIT']
Errormessage
    page should contain    Enter valid username and password
Sucessmessage
    page should contain    EBIScreen TCUI
close
    close all browsers
Login
    LaunchBrowser
    Input username    admin@mail.com
    Input passwd    admin
    submit
    sleep    7
MapZoom-In
    FOR    ${i}    IN    1      5
    click element    xpath://i[contains(@class,'fa-solid fa-magnifying-glass-plus')]
    END
MapZoom-out
    FOR    ${i}    IN    1      5
    click element    xpath://i[contains(@class,'fa-solid fa-magnifying-glass-minus')]
    END
MapHorizontal
    FOR    ${i}    IN    1       5
    DRAG AND DROP BY OFFSET   xpath://*[@id=\"map\"]/div[4]/div[1]/div    -60    0
    END
OpenSchematicView
#    open browser     http://65.21.6.71:7060/alstom-icc/#/home/svg-line    chrome
    sleep    5
    set selenium implicit wait    5
    click element    xpath://i[@class='fa-solid fa-bars']
    click element    xpath://li[text()='Schematic View']
OpenMapview
#    open browser     http://65.21.6.71:7060/alstom-icc/#/home/map-view    chrome
    set selenium implicit wait    5
    click element    xpath://i[@class='fa-solid fa-bars']
    set selenium implicit wait    5
    click element    xpath://li[text()='Map View']

OpenTraingraph
    set selenium implicit wait    10
    click element    xpath://i[@class='fa-solid fa-bars']
    set selenium implicit wait    10
    click element    xpath://span[text()='Train Graph']
