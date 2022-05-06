*** Settings ***
Resource    ../../resources/resources.robot

*** Variables ***
${WITHDRAW_BTN_LOCATOR}    xpath=//button[@class='mat-focus-indicator mat-button mat-button-base'][contains(.,'Desassociar')]
${W_CONFIRM_BTN_LOCATOR}   xpath=//button[contains(.,'Confirmar')]
${EXPECTED_MSG_LOCATOR}    xpath=//span[contains(.,'Curso desassociado com sucesso')]
*** Keywords ***
E clico em Desassociar
    Click Element    ${WITHDRAW_BTN_LOCATOR}

Quando confirmo o processo de desassociar o curso
    Click Element    ${W_CONFIRM_BTN_LOCATOR}

Então a página não deve conte o curso "${CLASS}"
    Wait Until Element Is Visible    ${EXPECTED_MSG_LOCATOR}
    Page Should Not Contain    ${CLASS}