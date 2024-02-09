Dado('que o usuário esteja na página de Busca Rede') do
    @pesquisaSimples_Page.load
end

Quando('o valor de estado é preenchido com {string}') do |estado|
    @pesquisaSimples_Page.input_estado(estado)
end

Quando('o valor de cidade é preenchido com {string}') do |cidade|
    @pesquisaSimples_Page.input_cidade(cidade)
end

Quando('o plano selecionado é {string}') do |plano|
    @pesquisaSimples_Page.input_plano(plano)
end

Quando('quando é realizada uma pesquisa simples') do
    @pesquisaSimples_Page.button_pesquisar()
end

Então('o sistema DEVE retornar uma lista de resultados da busca') do
    @pesquisaSimples_Page.validar_que_ha_resultados_exibidos()
end

Então ('o sistema DEVE retornar uma lista com {string} resultados') do |quantidade_esperada| 
    @pesquisaSimples_Page.validar_quantidade_de_resultados(quantidade_esperada)
end