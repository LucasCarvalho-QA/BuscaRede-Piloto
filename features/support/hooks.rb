require 'report_builder'

# Before sem uma tag executa antes de todos os cenários
Before do     
    @pesquisaSimples_Page = BuscaRede.new
    @pesquisaAvancada_Page = PesquisaAvancada_Page.new
end

# Use um hook Before para obter o nome do cenário antes de cada cenário
Before do |scenario|
  Capybara.current_session.instance_variable_set(:@nome_do_cenario, scenario.name)
end

World do
  nome_do_cenario = Capybara.current_session.instance_variable_get(:@nome_do_cenario)
  OpenStruct.new(nome_do_cenario: nome_do_cenario)
end

# Before com tag executa antes do cenário que estiver com esta tag comentada
Before('@exemplo') do
end

# After sem uma tag executa depois de todos os cenários
After do
end
  
# Anexar os prints ao relatório
After do |scenario|    
     sleep 1
     nome_cenario = scenario.name.tr(' ', '_').downcase!
     nome_cenario = nome_cenario.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/,'')     
     screenshot = "features/logs/shots/#{nome_cenario}.png"
     page.save_screenshot(screenshot)
     attach(screenshot, 'image/png')    
end

 at_exit do
    features_folder = File.expand_path('../..', __FILE__)
    current_time = Time.now.strftime('%d-%m-%Y_%H-%M')
    original_path = File.join(features_folder, 'logs', 'features.html')

    unless ENV['TF_BUILD'] #verifica se nao esta executando no pipelines
      new_path = File.join(features_folder, 'logs', "features_#{current_time}.html")
      File.rename(original_path, new_path) if File.exist?(original_path)
    end

    options = {
      json_path:    'features/logs/report.json',  # Caminho para o arquivo JSON do Cucumber
      report_path:  'features/logs/relatorioBuilder',       # Caminho e nome do arquivo de relatório sem a extensão
      report_types: [:html, :json],                   # Tipos de relatório
      report_title: 'Título do Relatório',            # Título do Relatório
      include_images: true,                           # Incluir imagens (se necessário)
      voice_commands: true,                           # Comandos de voz (se necessário)
      theme: 'night',
      additional_info: {'Ambiente' => 'QA', 'Browser' => 'Chrome'} # Informações adicionais
    }

    ReportBuilder.build_report options
 end