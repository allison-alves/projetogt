*** Settings ***
Resource    ../../resources/resources.robot

Library    DateTime
Library    Process

*** Variables ***
${CLASS_NAME_LOCATOR}            xpath=//input[contains(@formcontrolname,'nome')]
${CLASS_WORKLOAD_LOCATOR}        xpath=//input[contains(@type,'number')]
${CLASS_TYPE_LOCATOR}            xpath=//mat-select[contains(@formcontrolname,'tipo')]
${CLASS_ACESS_LINK_LOCATOR}      xpath=//input[contains(@formcontrolname,'url')]
${CLASS_DESCRIPTION_LOCATOR}     xpath=//textarea[contains(@formcontrolname,'descricao')]
${CLASS_DATE_BTN_LOCATOR}        xpath=//button[contains(@type,'button')]
${CLASS_LOCATOR}                 xpath=//span[@class='mat-option-text'][contains(.,'Teste')]
${CLASS_SAVE_BTN_LOCATOR}        xpath=//button[contains(.,'Salvar')]
${CLASS_SAVED_MSG_LOCATOR}       xpath=//span[contains(.,'Curso associado com sucesso')]
*** Keywords ***
Dado que estou na página de associar um novo curso
    Login
    Wait Until Element Is Visible    xpath=//span[@class='mat-button-wrapper'][contains(.,'VER MAIS')][1]
    Click Element    xpath=//span[@class='mat-button-wrapper'][contains(.,'VER MAIS')][1]
    Wait Until Element Is Visible    xpath=//a[@routerlink='../associar-curso'][contains(.,'Adicionar curso')]
    Click Element    xpath=//a[@routerlink='../associar-curso'][contains(.,'Adicionar curso')]
E preencho o nome do curso com "${CLASS_NAME}"
    Sleep     2
    Input Text    ${CLASS_NAME_LOCATOR}    ${CLASS_NAME}
    Set Suite Variable    ${CLASS_NAME}
    Sleep    2
E preencho a carga horária do curso com "${WORKLOAD}" horas
    Input Text    ${CLASS_WORKLOAD_LOCATOR}    ${WORKLOAD}

E seleciono o tipo de curso de testes
    Sleep    2
    Click Element    ${CLASS_TYPE_LOCATOR} 
    Wait Until Element Is Visible   ${CLASS_LOCATOR} 
    Click Element    ${CLASS_LOCATOR}

E preencho o link do curso com "${CLASS_URL}"
    Sleep    1
    Input Text    ${CLASS_ACESS_LINK_LOCATOR}    ${CLASS_URL}

E preencho a descrição do curso com "${DESCRIPTION}"
    Sleep    1
    Input Text    ${CLASS_DESCRIPTION_LOCATOR}    ${DESCRIPTION}

E seleciono a data atual
    ${CURRENT_DAY_R}    Get Current Date    result_format=%m/%d/%Y
    Sleep    1
    Input Text    xpath=//input[contains(@formcontrolname,'data_inicio')]    ${CURRENT_DAY_R}

Quando clico em salvar
    Click Element    ${CLASS_SAVE_BTN_LOCATOR}

Entao vejo a mensagem "${EXPECTED_MSG}"
    Wait Until Element Is Visible    ${CLASS_SAVED_MSG_LOCATOR}
    ${CLASS_SAVED_MSG}    Get Text    ${CLASS_SAVED_MSG_LOCATOR}
    Should Be Equal    ${CLASS_SAVED_MSG}    ${EXPECTED_MSG}
    Wait Until Page Contains    ${CLASS_NAME}
    Page Should Contain    ${CLASS_NAME}