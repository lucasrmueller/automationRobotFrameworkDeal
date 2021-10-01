*** Settings ***
Resource    ../main.resource

Test Setup      Comum.Abrir Navegador
Test Teardown   Comum.Fechar Navegador

*** Variable ***


*** Test Case ***
Teste 001 - Validar pagina da Deal esta aberta							
    [Documentation]  Deal - T001: Validar pagina da Deal esta aberta						
    #[Tags]  Atual
    Dado         Usuário acessou a pagina pela url
    

Teste 002 - Validar menus superiores da tela Home
    [Documentation]  Deal - T002: Validar menus superiores da tela Home						
    [Tags]  Atual
    Dado    Usuário acessou a pagina pela url
    E       Clicou no menu Nossas Entregas


