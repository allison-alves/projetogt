*** Settings ***
Resource    ../../resources/resources.robot
Library    XML
Library    OperatingSystem

*** Variables ***
${CLASS_CATALOG_LOCATOR}        xpath=//a[@routerlink='cursos'][contains(.,'Catálogo de Cursos')]
${CLASS_REMOVE_LOCATOR}         xpath=//mat-card[contains(.,'Automação Com Robot FrameworkVER MAIS')]
${MORE_BTN_LOCATOR}             xpath=//mat-card[contains(.,'Automação Com Robot FrameworkVER MAIS')]//a[contains(.,'VER MAIS')]
${REMOVE_BTN_LOCATOR}           xpath=//span[@class='mat-button-wrapper'][contains(.,'Remover')]
${CONFIRM_BTN_LOCATOR}          xpath=//button[@class='mat-focus-indicator button-blue mat-button mat-button-base'][contains(.,'Confirmar')]
${REMOVED_MSG_LOCATOR}          xpath=//span[contains(.,'Curso excluído com sucesso')]
${CLASS_REMOVED}                Automação Com Robot Framework
*** Keywords ***
Dado que estou na página de catalogo de cursos
    Login
    Sleep    5   
    Click Element    xpath=//a[@routerlink='cursos'][contains(.,'Catálogo de Cursos')]
E visualizo o curso robot framework
    No Operation

E clico no botão "VER MAIS"
    Sleep    5
    Click Element    ${MORE_BTN_LOCATOR}

E clico no botao de Remover
    Sleep    5
    Click Element    ${REMOVE_BTN_LOCATOR}

Quando confirmao a remoção
    Wait Until Element Is Visible    ${CONFIRM_BTN_LOCATOR}
    Click Element    ${CONFIRM_BTN_LOCATOR}
    Sleep    2
Então recebo a mensagem "${REMOVED_MSG}"
    Wait Until Element Is Visible    ${REMOVED_MSG_LOCATOR}
    SeleniumLibrary.Element Text Should Be    ${REMOVED_MSG_LOCATOR}    ${REMOVED_MSG}
    Click Element    ${CLASS_CATALOG_LOCATOR}
    Page Should Not Contain    ${CLASS_REMOVED}