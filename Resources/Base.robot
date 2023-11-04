*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}      your_website_url

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
    
