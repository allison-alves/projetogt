*** Settings ***
Resource    ../../resources/resources.robot

*** Variables ***
${WELCOME_LOCATOR}    css:p[class="title"]
*** Keywords ***
Dado que estou na página inicial
    Login
Entao irei visualizar uma mensagem de boas-vindas com meu nome "${WELCOME_MSG}"
    Wait Until Element Is Visible    xpath=//div[@class='flex-row d-flex justify-content-center m-5 flex-wrap'][contains(.,'Mentor(a) : Eduardo Sabino Desenvolvedor Back-Endeduardo.sabino@labsit.io Mentor(a): Fulaninho Mentorado Desenvolvedor Back-Endfulaninhosmentorado@labsit.io2Curso(s) a fazer1Curso(s) em andamento0Curso(s) concluído(s)VER MAISÚltimo feedbacktesteVER MAIS')]
    Wait Until Element Is Visible    ${WELCOME_LOCATOR}
    SeleniumLibrary.Element Text Should Be    ${WELCOME_LOCATOR}    ${WELCOME_MSG}