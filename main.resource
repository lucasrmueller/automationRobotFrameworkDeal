*** Settings ***
Library         FakerLibrary        locale=pt-BR
Library         SeleniumLibrary
Library         Collections
Library         DateTime
Library         String
Library         RequestsLibrary
Library         libs/CSVLibrary.py

## Utils
Resource        Utils/Comum.robot
Resource        Utils/BDDpt-BR.robot


# PageObjects
Resource        Resource/Resource.robot
Resource        Resource/PO/HomeSiteDeal.robot
Resource        Resource/PO/Google.robot


*** Variables ***
## Variable Global
${SHORT_TIMEOUT} =  10
${TIMEOUT} =  30