*** Settings ***
Resource    ../main.resource

Test Setup      Comum.Abrir Navegador
Test Teardown   Comum.Fechar Navegador

*** Variable ***
${Valor_Busca} =  "Deal - Convergência de Dados e Estratégias Digitais para ..."

*** Test Case ***
Teste 001 - Validar pagina da Deal esta aberta							
    [Documentation]  Deal - T001: Validar pagina da Deal esta aberta						
    #[Tags]  Atual
    Dado     Usuário acessou a pagina pela url
    Então    Apresenta a tela de "Home" devidamente carregada
    

Teste 002 - Validar menus superiores da tela Home
    [Documentation]  Deal - T002: Validar menus superiores da tela Home						
    #[Tags]  Atual
    Dado    Usuário acessou a pagina pela url
    E       Apresenta a tela de "Home" devidamente carregada
    Quando  Clicou no menu "Nossas Entregas"
    Então   Apresenta a tela de "Nossas Entregas" devidamente carregada

    
Teste 003 - Fazer buscas no site Google
    [Documentation]  Deal - T003: Fazer buscas no site Google					
    [Tags]  Atual
    Dado    Usuário acessou a pagina do google
    E       Inseriu no campo de busca  ${Valor_Busca}
    Quando  Clicou no botão de pesquisa google
    Então   Apresenta a tela de resultado da Pesquisa
    E       Clicou no primeiro resultado  
