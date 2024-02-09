#language: pt

Funcionalidade: Pesquisa Avançada

    Funcionalidade de pesquisa avancada 

    @pesquisaAvancada_CEP
    Cenário: Busca avançada por CEP DEVE retornar resultados
        Dado que o usuário esteja na página de Busca Rede
        Quando pesquisa avançada é selecionada
        E o valor de CEP é preenchido com "22041011" na pesquisa avancada        
        E quando é realizada uma pesquisa avancada  
        Então o sistema DEVE retornar uma lista de resultados da busca