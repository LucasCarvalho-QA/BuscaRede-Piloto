class PesquisaAvancada_Page < SitePrism::Page
    include Capybara::DSL

    set_url ENVIRONMENT['server'] 

    def button_realizar_pesquisa_avancada
      find('.search-button').click
    end

    def button_limpar_pesquisa
      find('[ng-disabled="listening || searchFormFields.state.isLoading || searchFormFields.city.isLoading || loadAccreditedRequest.isLoading"]').click
    end

    def button_pesquisa_avancada
      find('[ng-disabled="loadAccreditedRequest.isLoading"]').click
    end   
    
    #Pesquisa Avançada - Campos
    def input_cep(cep)
      find('.address-block > :nth-child(1) > label > .ng-pristine').set(cep)
    end

    def input_estado_pesquisa_avancada(estado)
      find('#s2id_select-state > .select2-choice > .select2-arrow > b').click
#      find('#s2id_autogen4_search').set(estado)
      find(:xpath, '//*[@id="s2id_autogen4_search"]').set(estado)
      find('.select2-match').click      
    end

    def input_cidade_pesquisa_avancada(cidade)
        find('#s2id_select-city > .select2-choice > .select2-arrow > b').click
        find('#s2id_autogen5_search').set(cidade)
        find('.select2-match').click
    end

    def input_nome_credenciado(nome)
      find(':nth-child(6) > label > .ng-pristine').set(nome)
    end

    def input_procedimento(procedimento)
      find('.procedures-container > label > .ng-pristine').set(procedimento)
    end

    def input_tipo_estabelecimento(tipo_estabelecimento)
      find('#s2id_type-of-establishment-select > .select2-choice > .select2-arrow > b').click
      find('#select2-chosen-6').set(tipo_estabelecimento)
      find('.select2-match').click
    end

    def input_especialidade(especialidade)
      find('#s2id_specialty-select > .select2-choice > .select2-arrow > b').click
      find('#select2-chosen-7').set(especialidade)
      find('.select2-match').click
    end
    
    def validar_que_ha_resultados_exibidos
      find('.content-container')
      find('.controls > .pagination-content > .ng-pristine')
    end

    def validar_quantidade_de_resultados(quantidade_esperada)
      quantidade_encontrada = find('.actions > .ng-binding').text
      quantidade_encontrada = extrair_numero(quantidade_encontrada)
      expect(quantidade_encontrada).to eq(quantidade_esperada)
    end

    #Validacoes
    def extrair_numero(texto)      
      resultado = texto.match(/[\d.,]+/)          
      resultado ? resultado[0] : nil
    end
    
  end
  