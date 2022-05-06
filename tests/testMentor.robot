*** Settings ***
Resource          ../resources/resources.robot

Test Setup       New Session
Test Teardown    Close Session
*** Test Cases ***

Login
    [Documentation]    Efetua o login com sucesso.
    [Tags]    login
    Login

Caso de teste 01 - Homepage
    [Documentation]    Validar a mensagem de boas vidas da homepage e se aparecem visualmente o navbar e os cards
    [Tags]    home
    Dado que estou na página inicial
    Entao irei visualizar uma mensagem de boas-vindas com meu nome "Olá, Allison Alves."

Caso de teste 02 - Navbar Inicio
    [Documentation]    Validar se ao clicar em início o usuário retornará para a página inicial
    [Tags]    navbar_start
    Dado que o usuário encontra-se na página inicial
    E navegou pelo menu superior
    Quando clicou em início
    Entao retornou para a página inicial

Caso de teste 03 - Navbar Cursos
    [Documentation]    Validar se ao clicar em cursos o usuário é redirecionado para a página de cursos
    [Tags]    navbar_classes
    Dado que o usuário encontra-se na página inicial
    E navegou pelo menu superior
    Quando clicou em cursos
    Entao foi redirecionado para a página de cursos

Caso de teste 04 - Navbar Feedbacks
    [Documentation]    Validar se ao clicar em Feedbacks o usuário é redirecionado para a página de Feedbacks
    [Tags]    navbar_feedbacks
    Dado que o usuário encontra-se na página inicial
    E navegou pelo menu superior
    Quando clicou em feedbacks
    Entao foi redirecionado para a página de feedbacks

Caso de teste 05 - Navbar Logout
    [Documentation]    Validar se ao clicar em sair é efetuado o log out e o usuário sai da aplicação
    [Tags]    logout
    Dado que o usuário encontra-se na página inicial
    E navegou pelo menu superior
    Quando clicou em sair
    Entao efetuou o logout com sucesso

Caso de teste 06 - Associar curso ao Mentor
    [Documentation]    Validar se um curso é associado com sucesso
    [Tags]    class_registration
    Dado que estou na página de associar um novo curso
    E preencho o nome do curso com "Automação Com Robot Framework"
    E preencho a carga horária do curso com "20" horas
    E seleciono o tipo de curso de testes
    E preencho o link do curso com "https://robotframework.org/"
    E preencho a descrição do curso com "O Robot Framework é uma estrutura genérica de automação de teste para testes de aceitação."
    E seleciono a data atual
    Quando clico em salvar
    Entao vejo a mensagem "Curso associado com sucesso"

Caso de teste 07 - Validar os dados do curso criado
    [Documentation]    Validar se os dados do curso que foi criado foram registrados corretamente
    [Tags]    class_verified
    Dado que estou na página de cursos associados
    E visualizo o curso criado com o nome "Automação Com Robot Framework"
    E clico em detalhes para visualizar os dados
    E verifico se a situação do curso é "A fazer"
    E verifico se a duração do curso é "20h"
    E verifico se o tipo de curso é "Teste"
    E verifico se a data foi cadastrada com a data atual
    E verifico se a data prevista final está correta
    E verifico se o link de acesso está redirecionado corretametne
    Entao concluo que os dados foram registrados corretamente

Caso de teste 08 - Desassociar o curso do transformers
    [Documentation]    Validar se o curso foi desassociado com sucesso do transformers
    [Tags]    class_withdraw
    Dado que estou na página de cursos associados
    E visualizo o curso criado com o nome "Automação Com Robot Framework"
    E clico em detalhes para visualizar os dados
    E clico em Desassociar
    Quando confirmo o processo de desassociar o curso
    Então a página não deve conte o curso "Automação Com Robot Framework"

Caso de teste 09 - Remover curso
    [Documentation]    Validar se o curso foi removido com sucesso.
    [Tags]    class_remove
    Dado que estou na página de catalogo de cursos
    E visualizo o curso robot framework
    E clico no botão "VER MAIS"
    E clico no botao de Remover
    Quando confirmao a remoção
    Então recebo a mensagem "Curso excluído com sucesso"

Caso de teste 10 - Enviar feedback
    [Documentation]    Validar se o feedback foi registrado com sucesso
    [Tags]    send_feedback
    Dado que estou na página de feedback
    E começo a digitar a mensagem "Tudo que você pode fazer, ou sonha que pode, comece. Ousadia tem genialidade, poder e magia" de feedback
    Quando clico em Enviar
    Entao o feedback é registrado com sucesso