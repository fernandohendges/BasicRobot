*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${BROWSER}           Headless Chrome
${URL}               http://automationpractice.com/index.php
${OPTIONS}           add_experimental_option('excludeSwitches',['enable-logging'])  # desabilita o log do chromedriver no console

*** Keywords ***
Abrir navegador
    Open Browser    ${URL}  ${BROWSER}  options=${OPTIONS}

Fechar navegador    
    Close Browser