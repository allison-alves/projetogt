*** Settings ***
Resource    ../../resources/resources.robot

*** Variables ***
${USERNAME_INPUT_MS}        css:input[id="i0116"]
${BUTTON_MS}                css:input[id="idSIButton9"]
${PASSWORD_INPUT_MS}        css:input[id="i0118"]
${NEXT_BUTTON_MS}           css:input[id="idBtn_Back"]
*** Keywords ***
Login
    [Documentation]    Validar se o usuario com perfil mentor consegue realizar o login com sucesso.
    [Tags]    login_mentor
    Go To    ${URL}
    Wait Until Element Is Visible    ${USERNAME_INPUT_MS}
    Set Log Level    NONE
    Input Text    ${USERNAME_INPUT_MS}    ${USERNAME}
    Click Element    ${BUTTON_MS}
    
    Sleep    2
    Wait Until Element Is Visible    ${PASSWORD_INPUT_MS}
    Input Password    ${PASSWORD_INPUT_MS}    ${PASSWORD}
    Click Element    ${BUTTON_MS}
    
    Set Log Level    INFO
    Sleep    2
    Wait Until Element Is Visible    ${NEXT_BUTTON_MS}
    Click Element    ${NEXT_BUTTON_MS}
    
