*** Settings ***

Resource   ../../main.resource

*** Variable ***
${ICONE_GOOGLE_HOME} =  xpath:/html/body/div[1]/div[2]/div/img
${INPUT_BUSCA} =  xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input
${BUTTON_PESQUISA_GOOGLE} =  xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[3]/center/input[1]
${PRIMEIRO_RESULTADO} =  xpath://*[@id="rso"]/div[1]/div/div/div[1]/a/h3


*** Keywords ***
Verificar Página Google
    Wait Until Page Contains Element  ${ICONE_GOOGLE_HOME}  timeout=${TIMEOUT}
    
    
Inserir no campo de busca
    [Arguments]  ${arg1}
    Set Focus To Element  ${INPUT_BUSCA}
    Input Text  ${INPUT_BUSCA}  ${arg1}


Clicar no botão "Pesquisa Google"
    Set Focus To Element  ${BUTTON_PESQUISA_GOOGLE}
    Click Element  ${BUTTON_PESQUISA_GOOGLE}


Verificar Página de resultado
    Wait Until Element Is Visible  ${PRIMEIRO_RESULTADO}  timeout=${TIMEOUT}


Clicar no primeiro resultado
    ${resultado}  Get Text  ${PRIMEIRO_RESULTADO}
    Log  Primeiro resultado apresentado é: ${resultado}

    Set Focus To Element  ${PRIMEIRO_RESULTADO}
    Click Element  ${PRIMEIRO_RESULTADO} 