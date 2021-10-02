*** Settings ***
Resource    ../main.resource

*** Variable ***


*** Keywords ***
Usuário acessou a pagina pela url
    TelaHomeSiteDeal.Verificar Página Deal "Home"

Apresenta a tela de "Home" devidamente carregada
    TelaHomeSiteDeal.Verificar Página Deal "Home"

Clicou no menu "Nossas Entregas"
    TelaHomeSiteDeal.Clicar no menu "Nossas Entregas"

Apresenta a tela de "Nossas Entregas" devidamente carregada
    TelaHomeSiteDeal.Verificar Página "Nossas Entregas"
    
Usuário acessou a pagina do google
    Comum.Abrir site do Google

Apresenta a tela do google devidamente carregada
    Google.Verificar Página Google

Inseriu no campo de busca
    [Arguments]  ${arg1}
    Google.Inserir no campo de busca  ${arg1}

Clicou no botão de pesquisa google
    Google.Clicar no botão "Pesquisa Google"

Apresenta a tela de resultado da Pesquisa
    Google.Verificar Página de resultado

Clicou no primeiro resultado
    Clicar no primeiro resultado
    