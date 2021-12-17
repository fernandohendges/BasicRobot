*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Commons/abrir_navegador.robot   

*** Variables ***
${CAMPO_PROCURAR}                        //*[@id="search_query_top"]  
${BOTAO_PROCURAR}                        //*[@name="submit_search"]    
${CONFERIR_PRODUTO}                      //*[@id="center_column"]/h1 
${IMAGEM_BLOUSE}                         //*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"] 
${LABEL_ESTOQUE}                         //*[@id="center_column"]//link[@itemprop="availability"][@href="http://schema.org/InStock"] 
${ITEM_NAO_EXISTENTE}                    ItemNãoExistente
${MENSAGEM_DE_ERRO}                      No results were found for your search "ItemNãoExistente"
${CATEGORIA_MULHER}                      //a[@title="Women"]
${CATEGORIA_SUMMER_DRESSES}              //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a
${CATEGORIA_DE_PRODUTOS}                 //*[@id="columns"]  
${CAMISETA}                              //*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img
${BOTAO_ADD_CARTAO}                      //*[@id="add_to_cart"]/button/span
${BOTAO_PROCEED_TO_CHECKOUT}             //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span
${CARRINHO_DE_COMPRAS}                   //*[@id="header"]/div[3]/div/div/div[3]/div/a
${SUMARIO_CARRINHO}                      //span[contains(.,"Summary")]
${VALIDACAO_CARRINHO_VAZIO}              //p[contains(.,"Your shopping cart is empty.")]
${BOTAO_SIGN_IN}                         //*[@id="header"]/div[2]/div/div/nav/div[1]/a
${CAMPO_EMAIL}                           //input[@id="email_create"]  
${BOTAO_CREATACCOUNT}                    //*[@id="SubmitCreate"]/span
${ESPERA}                                3
${BOTAO_MR}                              //*[@id="account-creation_form"]/div[1]/div[1]/div[1]/label
${YOUR_PERSONAL_INFORMATION}             //*[@id="account-creation_form"]/div[1]/h3
${CAMPO_NOME}                            //*[@id="customer_firstname"]  
${CAMPO_ULTIMO_NOME}                     //*[@id="customer_lastname"]
${CAMPO_SENHA}                           //*[@id="passwd"] 
${CAMPO_DIA}                             document.querySelector("#authentication").click()
${CAMPO_MES}                             document.querySelector("#months").click()
${CAMPO_ANO}                             document.querySelector("#years").click();  
${DIA}                                   //select[@id='days']/option[@value=15]
${MES}                                   //select[@id='months']/option[@value=4]
${ANO}                                   //select[@id='years']/option[@value=1993]
${CAMPO_ENDERECO}                        //*[@id="address1"]
${CAMPO_CEP}                             //*[@id="postcode"]
${CAMPO_CIDADE}                          //*[@id="city"]
${CAMPO_ESTADO}                          document.querySelector("#id_state").click();     
${ESTADO}                                //select[@id="id_state"]/option[@value='32']
${CELULAR}                               //*[@id="phone_mobile"]
${REGISTRAR_CONTA}                       //*[@id="submitAccount"]/span
${COLUNA_CENTRAL}                        //*[@id="center_column"]/p
${EMAIL_FIXO}                            @testerobot.com


&{PESSOA}                                Nome=Fernando   
...                                      Celular=988277059
...                                      Cidade=New York
...                                      Sobrenome=Hendges
...                                      Endereco=Rua Amaro Antônio Vieira
...                                      Cep=88034
...                                      Senha=123456




*** Keywords ***

Caso de Teste 01: Pesquisar produto existente 
Acessar a página home do site
    Abrir navegador
    
Digitar o nome do produto "${produto}" no campo de pesquisa 
    Input Text                     ${CAMPO_PROCURAR}    ${produto}
     
Clicar no botão pesquisar 
    Wait Until Element Is Visible  ${BOTAO_PROCURAR}
    Click Element                  ${BOTAO_PROCURAR}

Conferir se o produto "Blouse" foi listado no site
    Wait Until Element Is Visible  ${CONFERIR_PRODUTO}
    Title Should Be                Search - My Store
    Page Should Contain Element    ${IMAGEM_BLOUSE}
    Page Should Contain Element    ${LABEL_ESTOQUE}


Caso de Teste 02: Pesquisar produto não existente
Conferir se a página do home foi exibida
    Title Should Be  My Store

Digitar o nome do produto "ItemNãoExistente" no campo de pesquisa
    Wait Until Element Is Visible    ${CAMPO_PROCURAR}
    Input Text                       ${CAMPO_PROCURAR}           ${ITEM_NAO_EXISTENTE}

Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""
    Wait Until Element Is Visible    ${COLUNA_CENTRAL}   
    Element Text Should Be           ${COLUNA_CENTRAL}           ${MENSAGEM_DE_ERRO} 
    
Caso de teste 03: Listar produtos
Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
     Wait Until Element Is Visible   ${CATEGORIA_MULHER}  
     Mouse over                      ${CATEGORIA_MULHER}  
     
Clicar na sub categoria "Summer Dresses"
    Click Element                    ${CATEGORIA_SUMMER_DRESSES}

Conferir se página com os produtos da categoria selecionada foi exibida
    Wait Until Element Is Visible    ${CATEGORIA_MULHER}
    Page Should Contain Element      ${CATEGORIA_DE_PRODUTOS}


Caso de teste 04: Adicionar produtos no carrinho
Digitar o nome do produto "t-shirt" no campo de pesquisa
    Wait Until Element Is Visible    ${CAMPO_PROCURAR}
    Input Text                       ${CAMPO_PROCURAR}   t-shirt

Clicar no botão de pesquisa
    Wait Until Element Is Visible    ${BOTAO_PROCURAR}
    Click Element                    ${BOTAO_PROCURAR}

Clicar no botão "Add to cart" do produto
    Wait Until Element Is Visible    ${CAMISETA}
    Click Element                    ${CAMISETA}
    Wait Until Element Is Visible    ${BOTAO_ADD_CARTAO}
    Click Element                    ${BOTAO_ADD_CARTAO}

Clicar no botão "Proceed to checkout"
    Wait Until Element Is Visible    ${BOTAO_PROCEED_TO_CHECKOUT}
    Click Element                    ${BOTAO_PROCEED_TO_CHECKOUT}

Verificar se a tela do carrinho de compras foi exibido, juntamente com os dados do produto adicionado e os devidos valores
    Wait Until Element Is Visible    ${CARRINHO_DE_COMPRAS} 
    Page Should Contain Element      ${SUMARIO_CARRINHO}


Caso de teste 05: Validar carrinho vazio
Clicar no ícone carrinho de compras no menu superior direito 
    Wait Until Element Is Visible    ${CARRINHO_DE_COMPRAS}
    Click Element                    ${CARRINHO_DE_COMPRAS}
     
Conferir se é exibida a mensagem de carrinho vazio  
    Wait Until Element Is Visible    ${VALIDACAO_CARRINHO_VAZIO} 
    Element Should Be Visible        ${VALIDACAO_CARRINHO_VAZIO} 


Caso de teste 06: Adicionar Cliente 
Clicar no botão superior direito "Sign in"
    Wait Until Element Is Visible    ${BOTAO_SIGN_IN}
    Click Element                    ${BOTAO_SIGN_IN}

Inserir um e-mail válido
    Wait Until Element Is Visible    ${CAMPO_EMAIL}   
    ${STRING_ALEATORIA}=             Generate Random String  
    ${EMAIL}   Set Variable          ${PESSOA.Nome}${PESSOA.Sobrenome}${STRING_ALEATORIA}${EMAIL_FIXO} 
    Input Text                       ${CAMPO_EMAIL}          ${EMAIL}      

Clicar no botão "Create na account"
    Wait Until Element Is Visible    ${BOTAO_CREATACCOUNT}
    Click Element                    ${BOTAO_CREATACCOUNT}

Preencher os campos obrigatórios
    Wait Until Page Contains Element  ${YOUR_PERSONAL_INFORMATION}
    Wait Until Element Is Visible     ${BOTAO_MR}
    Click Element                     ${BOTAO_MR}  
    Wait Until Element Is Visible     ${CAMPO_NOME}
    Input Text                        ${CAMPO_NOME}            ${PESSOA.Nome} 
    Wait Until Element Is Visible     ${CAMPO_ULTIMO_NOME}
    Input Text                        ${CAMPO_ULTIMO_NOME}     ${PESSOA.Sobrenome} 
    Sleep                             ${ESPERA}
    Execute JavaScript                ${CAMPO_DIA}
    Wait Until Element Is Visible     ${DIA}
    Click Element                     ${DIA}      
    Sleep                             ${ESPERA}
    Execute JavaScript                ${MES}
    Sleep                             ${ESPERA}
    Execute JavaScript                ${CAMPO_ANO}    
    Wait Until Element Is Visible     ${ANO}
    Click Element                     ${ANO}
    Wait Until Element Is Visible     ${CAMPO_ENDERECO}
    Input Text                        ${CAMPO_ENDERECO}        ${PESSOA.Endereco} 
    Wait Until Element Is Visible     ${CAMPO_CEP}
    Input Text                        ${CAMPO_CEP}             ${PESSOA.Cep}
    Wait Until Element Is Visible     ${CAMPO_CIDADE}
    Input Text                        ${CAMPO_CIDADE}          ${PESSOA.Cidade}  
    Sleep                             ${ESPERA}
    Execute JavaScript                ${CAMPO_ESTADO} 
    Wait Until Element Is Visible     ${ESTADO}
    Click Element                     ${ESTADO}
    Wait Until Element Is Visible     ${CELULAR}
    Input Text                        ${CELULAR}               ${PESSOA.Celular}  
    Wait Until Element Is Visible     ${CAMPO_SENHA}     
    Input Text                        ${CAMPO_SENHA}           ${PESSOA.Senha}

Clicar em "Register" para finalizar o cadastro
    Wait Until Element Is Visible     ${REGISTRAR_CONTA}     
    Click Element                     ${REGISTRAR_CONTA}







           



    