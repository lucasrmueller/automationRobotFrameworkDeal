*** Settings ***
Resource    ../main.resource

*** Variable ***
${BROWSER} =  chrome


*** Keywords ***
Abrir Navegador
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window  
    Go To  https://www.deal.com.br/


Remover Caracteres Especiais
    [Arguments]  ${arg1}
    ${arg1} =  Replace String  ${arg1}  Pinto  Bento
    ${arg1} =  Replace String  ${arg1}  - EI  EI
    ${arg1} =  Replace String  ${arg1}  - ME  ME
    ${arg1} =  Remove String  ${arg1}  .
    ${arg1} =  Remove String  ${arg1}  /
    ${arg1} =  Remove String  ${arg1}  -
    ${arg1} =  Remove String  ${arg1}  ,
    ${arg1} =  Remove String  ${arg1}  R$
    ${arg1} =  Remove String  ${arg1}  [
    ${arg1} =  Remove String  ${arg1}  ]
    ${arg1} =  Remove String  ${arg1}  '
    ${arg1} =  Replace String  ${arg1}  ç  c
    ${arg1} =  Replace String  ${arg1}  á  a
    ${arg1} =  Replace String  ${arg1}  é  e
    ${arg1} =  Replace String  ${arg1}  í  i
    ${arg1} =  Replace String  ${arg1}  ó  o
    ${arg1} =  Replace String  ${arg1}  ú  u
    ${arg1} =  Replace String  ${arg1}  â  a
    ${arg1} =  Replace String  ${arg1}  ê  e
    ${arg1} =  Replace String  ${arg1}  ô  o
    ${arg1} =  Replace String  ${arg1}  ã  a
    ${arg1} =  Replace String  ${arg1}  õ  o
    [Return]  ${arg1}


Colocar Data Formato Brasileiro
    [Arguments]  ${dtnasc}
    ${stringdt}  Convert To String  ${dtnasc}
    @{dt}        Split String  ${stringdt}  -
    ${data}      Catenate  ${dt[2]}  /  ${dt[1]}  /  ${dt[0]}
    ${data}      Remove String  ${data}  ${SPACE}
    [Return]     ${data}


Remover Caracteres Especiais de Telefone 
    [Arguments]  ${tel}
    ${tel}      Remove String  ${tel}  ${SPACE}
    ${tel}      Remove String  ${tel}  -  (  )  /
    ${tel}      Get Substring  ${tel}  -11
    [Return]  ${tel}


clickWait
    [Arguments]  ${element}  ${waitElement}
    FOR  ${ITEM}  IN RANGE  0  10
        Run Keyword and Ignore Error  Wait Until Element Is Visible  ${element}  ${timeout}
        Run Keyword and Ignore Error  Click Element  ${element}
        ${progress}  Run Keyword and Ignore Error  Wait Until Element Is Visible  ${waitElement}  ${timeout}
        Exit For Loop If  '${progress[0]}'=='PASS'
    END
    
Fechar Navegador
    Close All Browsers
