#language:pt

Funcionalidade: Adicionar item ao carrinho
    Para que eu possa comprar jogos clássicos na lojinha
    Sendo um usuário cadastrado
    Posso adicionar itens no meu carrinho

    @add_game @login @clean_cart
    Cenario: Adicionar ao carrinho

        Dado que eu quero comprar "F-Zero" do "Super Nintendo"
        Quando eu adiciono este item ao carrinho
        Então devo ver o alerta "Você adicionou F-Zero ao seu carrinho!"
    
    @clean_cart
    Cenario: Usuário não logado

        Dado que eu quero comprar "Golden Axe" do "Mega Drive"
        Quando eu adiciono este item ao carrinho
        Então devo ver o alerta "Você deve estar logado para adicionar um produto!"
