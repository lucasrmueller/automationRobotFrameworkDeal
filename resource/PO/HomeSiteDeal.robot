*** Settings ***

Resource   ../../main.resource

*** Variable ***
${ICONE_DEAL_HOME} =  xpath:/html/body/div[1]/div/section[1]/div/div/div/section/div/div[1]/div/div[2]/div/a/img
${MENU_NOSSAS_ENTREGAS} =  xpath://*[@id="menu-1-f4a8485"]/li[2]/a[contains(., 'Nossas Entregas')]
${PAGINA_NOSSAS_ENTREGAS} =  xpath:/html/body/div[1]/div/section[4]/div/div[1]/div/div/div/div/div[2]/span/a[contains(., 'Nossas Entregas')]



*** Keywords ***
Verificar Página Deal "Home"
    Wait Until Page Contains Element  ${ICONE_DEAL_HOME}  timeout=${TIMEOUT}


Clicar no menu "Nossas Entregas"
    Wait Until Element Is Visible  ${MENU_NOSSAS_ENTREGAS}  timeout=${TIMEOUT}
    Click Element  ${MENU_NOSSAS_ENTREGAS}


Verificar Página "Nossas Entregas"
    Wait Until Element Is Visible  ${PAGINA_NOSSAS_ENTREGAS}  timeout=${TIMEOUT}