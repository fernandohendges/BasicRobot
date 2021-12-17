*** Settings ***
Resource             ../Resource/Resource.robot
Test Teardown        Fechar navegador   

*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente 
        Acessar a página home do site
        Digitar o nome do produto "Blouse" no campo de pesquisa 
        Clicar no botão pesquisar 
        Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
        Acessar a página home do site
        Digitar o nome do produto "ItemNãoExistente" no campo de pesquisa 
        Clicar no botão pesquisar 
        Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""

Caso de teste 03: Listar produtos
        Acessar a página home do site 
        Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
        Clicar na sub categoria "Summer Dresses"
        Conferir se página com os produtos da categoria selecionada foi exibida

Caso de teste 04: Adicionar produtos no carrinho
        Acessar a página home do site
        Digitar o nome do produto "t-shirt" no campo de pesquisa
        Clicar no botão de pesquisa 
        Clicar no botão "Add to cart" do produto
        Clicar no botão "Proceed to checkout"
        Verificar se a tela do carrinho de compras foi exibido, juntamente com os dados do produto adicionado e os devidos valores

Caso de teste 05: Validar carrinho vazio
        Acessar a página home do site
        Clicar no ícone carrinho de compras no menu superior direito
        Conferir se é exibida a mensagem de carrinho vazio 

Caso de teste 06: Adicionar Cliente
        Acessar a página home do site
        Clicar no botão superior direito "Sign in"
        Inserir um e-mail válido
        Clicar no botão "Create na account"
        Preencher os campos obrigatórios
        Clicar em "Register" para finalizar o cadastro


        
