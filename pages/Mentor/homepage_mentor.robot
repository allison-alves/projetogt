*** Settings ***
Resource    ../../resources/resources.robot

*** Variables ***
${WELCOME_LOCATOR}    css:p[class="title"]
${DIVS_CARDS}         xpath=//div[@class='flex-row d-flex justify-content-center m-5 flex-wrap'][contains(.,'Transformer : Eduardo Sabino Desenvolvedor Back-Endeduardo.sabino@labsit.io0Curso(s) a fazer1Curso(s) em andamento2Curso(s) concluído(s)VER MAISÚltimo feedbackTudo que você pode fazer, ou sonha que pode, comece. Ousadia tem genialidade, poder e magiaVER MAIS')]
*** Keywords ***
Dado que estou na página inicial
    Login
Entao irei visualizar uma mensagem de boas-vindas com meu nome "${WELCOME_MSG}"
    Wait Until Element Is Visible    ${DIVS_CARDS} 
    Wait Until Element Is Visible    ${WELCOME_LOCATOR}
    SeleniumLibrary.Element Text Should Be    ${WELCOME_LOCATOR}    ${WELCOME_MSG}