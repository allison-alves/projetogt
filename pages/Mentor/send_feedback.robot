*** Settings ***
Resource    ../../resources/resources.robot

*** Variables ***
${TEXTAREA_LOCATOR}            xpath=//textarea[contains(@rows,'6')]
${SENDTEXT_BTN_LOCATOR}        xpath=//a[contains(.,'ENVIAR')]

*** Keywords ***
Dado que estou na página de feedback
    Login
    Sleep    5
    Click Element    xpath=//a[@routerlink='feedback'][contains(.,'Feedbacks')]
E começo a digitar a mensagem "${TEXTAREA_MSG}" de feedback
    Set Test Variable    ${TEXTAREA_MSG}
    Sleep    2
    Wait Until Element Is Visible    ${TEXTAREA_LOCATOR}
    Input Text    ${TEXTAREA_LOCATOR}    ${TEXTAREA_MSG}

Quando clico em Enviar
    Wait Until Element Is Enabled    ${SENDTEXT_BTN_LOCATOR}
    Click Element    ${SENDTEXT_BTN_LOCATOR}

Entao o feedback é registrado com sucesso
    Wait Until Element Is Visible    xpath=//span[contains(.,'Feedback enviado com sucesso')]
    ${CURRENT_DATE}    Get Current Date    result_format=%d/%m/%Y - %H:%M
    Element Should Contain    //mat-card[@class='mat-card mat-focus-indicator feedback-card mt-2'][contains(.,'Allison Alves${TEXTAREA_MSG}${CURRENT_DATE}')]    ${CURRENT_DATE}  AND  ${TEXTAREA_MSG}
    Element Should Contain    xpath=(//mat-card-title[contains(.,'Allison Alves')])    Allison Alves