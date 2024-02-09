Quando('pesquisa avançada é selecionada') do
  @pesquisaAvancada_Page.button_pesquisa_avancada
end

Quando('o valor de cep é preenchido com {string}') do |cep|
  @pesquisaAvancada_Page.input_cep(cep)
end

Quando('o procedimento é preenchido com {string}') do |procedimento|
    @pesquisaAvancada_Page.input_procedimento(procedimento)
end

Quando('quando é realizada uma pesquisa avancada') do
    @pesquisaAvancada_Page.button_realizar_pesquisa_avancada
end


Quando('o valor de estado é preenchido com {string} na pesquisa avancada') do |estado|
    @pesquisaAvancada_Page.input_estado_pesquisa_avancada(estado)
end

Quando('o valor de cidade é preenchido com {string} na pesquisa avancada') do |cidade|
    @pesquisaAvancada_Page.input_cidade_pesquisa_avancada(cidade)
end

Quando('o valor de Tipo de Estabelecimento é preenchido com {string}') do |tipo_estabelecimento|
    @pesquisaAvancada_Page.input_tipo_estabelecimento(tipo_estabelecimento)
end

Quando('o valor de CEP é preenchido com {string} na pesquisa avancada') do |cep|
    @pesquisaAvancada_Page.input_cep(cep)
end