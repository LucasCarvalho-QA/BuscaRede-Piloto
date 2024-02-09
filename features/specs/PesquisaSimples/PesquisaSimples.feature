#language: pt

Funcionalidade: Pesquisa Simples

    Funcionalidade de pesquisa simples 
    
    #Execução
    # cucumber -t "@pesquisaSimples"
    # cucumber -t "@pesquisaSimples" --format json --out features/logs/report.json

    @pesquisaSimples
    Cenário: Busca simples por Estado e Cidade DEVE retornar resultados
        Dado que o usuário esteja na página de Busca Rede
        Quando o valor de estado é preenchido com "São Paulo"
        E o valor de cidade é preenchido com "São Paulo"           
        E quando é realizada uma pesquisa simples  
        Então o sistema DEVE retornar uma lista de resultados da busca

    @pesquisaSimples_validando_resultados
    Cenário: Busca simples por Estado e Cidade DEVE retornar resultados
        Dado que o usuário esteja na página de Busca Rede
        Quando o valor de estado é preenchido com "Rio de Janeiro"
        E o valor de cidade é preenchido com "Rio de Janeiro"           
        E quando é realizada uma pesquisa simples  
        Então o sistema DEVE retornar uma lista com "4.480" resultados

    @pesquisaSimples_enviando_plano
    Cenário: Busca simples por Estado e Cidade DEVE retornar resultados
        Dado que o usuário esteja na página de Busca Rede
        Quando o valor de estado é preenchido com "São Paulo"
        E o valor de cidade é preenchido com "São Paulo" 
        E o plano selecionado é "AMS"          
        E quando é realizada uma pesquisa simples  
        Então o sistema DEVE retornar uma lista com "1.032" resultados