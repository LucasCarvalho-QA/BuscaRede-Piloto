class BuscaRede < SitePrism::Page
    include Capybara::DSL

    set_url ENVIRONMENT['server']
  
    def input_estado(estado)
      sleep(2)
      find('#s2id_select-state > .select2-choice > .select2-arrow > b').click
      find('#s2id_autogen1_search').set(estado)
      find('.select2-match').click
    end
  
    def input_cidade(cidade)
      sleep(2)
      find('#s2id_select-city > .select2-choice > .select2-arrow > b').click
      find('#s2id_autogen2_search').set(cidade)
      find('.select2-match').click
    end

    def input_plano(plano)
      sleep(1)
      find('#s2id_select-plan > .select2-choice > .select2-arrow > b').click
      find('#s2id_autogen3_search').set(plano)
      find('#select2-results-3').click
    end

  
    def button_pesquisar
      find('.btn-search').click
    end

    def button_realizar_pesquisa_avancada
      sleep(3)
      find('.search-button').click
    end

    def button_limpar_pesquisa
      find('[ng-disabled="listening || searchFormFields.state.isLoading || searchFormFields.city.isLoading || loadAccreditedRequest.isLoading"]').click
    end

    def button_pesquisa_avancada
      find('[ng-disabled="loadAccreditedRequest.isLoading"]').click
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
  