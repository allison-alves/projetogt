*** Settings ***
Resource    ../../resources/resources.robot


*** Variables ***
${DETAIL_BTN_LOCATOR}    xpath=//mat-card[contains(.,'Automação Com Robot Framework Situação : A fazerDetalhes')]//a[contains(.,'Detalhes')]
${STATUS_LOCATOR}        xpath=//div[@class='col-12 col-md-12 col-lg-6 pt-3'][contains(.,'Situação: A fazer')]
${DURATION_LOCATOR}      xpath=//b[contains(.,'20h')]
${LINK_LOCATOR}          xpath=//a[@href='https://robotframework.org/']
*** Keywords ***
Dado que estou na página de cursos associados
    Login
    Wait Until Element Is Visible    xpath=//span[@class='mat-button-wrapper'][contains(.,'VER MAIS')][1]
    Click Element    xpath=//span[@class='mat-button-wrapper'][contains(.,'VER MAIS')][1]
    
E visualizo o curso criado com o nome "${CLASS_NAME}"
    Wait Until Element Is Visible    xpath=//p[contains(.,'${CLASS_NAME}')]
    Page Should Contain Element      xpath=//p[@class='titulo-curso'][contains(.,'${CLASS_NAME}')]


E clico em detalhes para visualizar os dados
    Click Element  ${DETAIL_BTN_LOCATOR}
    Sleep    3

E verifico se a situação do curso é "${Status}"
    Element Should Contain    ${STATUS_LOCATOR}    ${Status}
    
E verifico se a duração do curso é "${COURSE_DURATION}"
    Element Should Contain    ${DURATION_LOCATOR}    ${COURSE_DURATION}

E verifico se o tipo de curso é "${TYPE}"
    Element Should Contain    xpath=//div[@class='row pt-4'][contains(.,'Tipo de curso: Teste')]    ${TYPE}

E verifico se a data foi cadastrada com a data atual
    ${DATE}    Get Current Date  result_format=%d/%m/%Y
    Element Should Contain    xpath=//div[@class='col-12 col-lg-6 mt-2'][contains(.,'Data prevista de inicio: ${DATE} Alterar')]    ${DATE}

E verifico se a data prevista final está correta
    ${FINISH_DATE}    Get Current Date    increment=6 day  result_format=%d/%m/%Y
    Element Should Contain    xpath=//div[@class='col-12 col-lg-6 pt-2 pr-5'][contains(.,'Data prevista de conclusão: ${FINISH_DATE}')]    ${FINISH_DATE}

E verifico se o link de acesso está redirecionado corretametne
    ${URL}    SeleniumLibrary.Get Element Attribute    ${LINK_LOCATOR}    href
    Should be equal  ${url}  https://robotframework.org/

Entao concluo que os dados foram registrados corretamente
    No Operation