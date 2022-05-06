*** Settings ***
Resource    ../../resources/resources.robot


*** Variables ***
${START_BLOCATOR}            xpath=//a[contains(.,'Início')]
${CLASSES_LOCATOR}           xpath=//a[@routerlink='cursos'][contains(.,'Catálogo de Cursos')]
${FEEDBACK_LOCATOR}          xpath=//a[@routerlink='feedback'][contains(.,'Feedbacks')]
${LOGOUT_LOCATOR}            xpath=//a[contains(.,'Sair')]
${CLASSES_TITLE_LOCATOR}     xpath=//p[@class='title'][contains(.,'Cursos')]
*** Keywords ***
Dado que o usuário encontra-se na página inicial
    Dado que estou na página inicial
    Entao irei visualizar uma mensagem de boas-vindas com meu nome "Olá, Allison Alves."
E navegou pelo menu superior
    No Operation
Quando clicou em início
    Click Element    ${START_BLOCATOR}
Quando clicou em cursos
    Click Element    ${CLASSES_LOCATOR}
Quando clicou em feedbacks
    Click Element    ${FEEDBACK_LOCATOR}
Quando clicou em sair
    Click Element    ${LOGOUT_LOCATOR}
Entao retornou para a página inicial
    Entao irei visualizar uma mensagem de boas-vindas com meu nome "Olá, Allison Alves."
Entao foi redirecionado para a página de cursos
    Wait Until Element Is Visible    ${CLASSES_TITLE_LOCATOR}
    SeleniumLibrary.Element Text Should Be    ${CLASSES_TITLE_LOCATOR}    Cursos
    Sleep    2
Entao foi redirecionado para a página de feedbacks
    ${location}    Get Location
    Should Be Equal    ${location}    ${location}
    Sleep    2
Entao efetuou o logout com sucesso
   Entao foi redirecionado para a página de feedbacks