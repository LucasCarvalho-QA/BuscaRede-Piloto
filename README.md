
# Testes automatizados - Busca Rede

Um tutorial sobre como configurar e executar um teste


## Configuração de Ambiente
    1. Baixar o Ruby+Devkit 3.2.2-1 (x64) em: https://rubyinstaller.org/downloads/
    2. Após a instalação, execute o script abaixo no prompt de comando (cmd). Em caso de sucesso, a versão instalada será exibida
```bash
  ruby -v
```
## Baixando do repositório para a máquina local    
### Gerando chave de autenticação
    1. Selecione o menu "Personal access token"
![Personal access token](https://learn.microsoft.com/en-us/azure/devops/repos/git/media/select-personal-access-tokens.jpg?view=azure-devops)

    2. Selecione "New Token"
![New access token](https://learn.microsoft.com/en-us/azure/devops/repos/git/media/select-new-token.png?view=azure-devops)

    3. Selecione a expiração pra 90 dias e "Read, write & manage" como permissão
![Personal access token permission](https://i.ibb.co/PYzkPGf/new-access-token.png)

    4. Copie o access token gerado e salve (será usado nos próximos passos), ele não será exibido de novo. Se perder, é possível criar outro.
![access token generated](https://learn.microsoft.com/en-us/azure/devops/repos/git/media/copy-token-to-clipboard.png?view=azure-devops)  

### Clonando projeto
    1. No repositório, busque o o botão "Clone"
![Botão clone](https://learn.microsoft.com/en-us/azure/devops/repos/git/media/clone/visual-studio-2019/common/azure-repo.png?view=azure-devops)

    2. Copie o endereço e salve em algum bloco de notas
![Salvando o endereço .git](https://learn.microsoft.com/en-us/azure/devops/repos/git/media/clone/visual-studio-2019/common/azure-clone-repo.png?view=azure-devops)

    3. Agora, na URL copiada do git, troque o nome da organização pelo Access Token gerado

    Exemplo:
        Access token: 3ci6vwtj57tsb5zkfwsanxmbx3zgz3ahuaqe2jqhsgzs7ro52
        URL git: https://ub-Institucional@dev.azure.com/ub-Institucional/SQUADS/_git/RNP


        https://<alterar_organização_para_Access_token>@dev.azure.com/ub-Institucional/SQUADS/_git/RNP

        https://3ci6vwtj57tsb5zkfwsanxmbx3zgz3ahuaqe2jqhsgzs7ro52@dev.azure.com/{Organization}/{Project}/_git/RNP

    
    4. Adicione o comando "git clone" e faça o clone do projeto para sua máquina (troque pela sua chave)
        
        git clone https://3ci6vwtj57tsb5zkfwsanxmbx3zgz3ahuaqe2jqhsgzs7ro52@dev.azure.com/ub-Institucional/SQUADS/_git/RNP  

    
    5. Acesse a pasta do seu projeto
        
        cd RNP

## Criando uma branch local
    6. Defina um nome para sua branch, pode ser por exemplo user story + seu nome
        
        git checkout -b 123456_ciclano

## Subindo código para o Azure DevOps
    Tudo certo com o seu código? Hora de subir para o azure. 
    
    7. Para adicionar TODAS as suas alterações, digite:

        git add .

    8. Agora, monte o seu commit e lembre-se de escrever uma mensagem coerente com a sua alterar_organização_para_Access_token

        git commit -m "Inclusão dos testes automatizados de Login"

    9. Subindo tudo para a sua branch no azure

        git push origin 123456_ciclano


    
## Execução

    10. Para executar tudo, basta escrever o comando "cucumber" na linha de comando, ou selecione algum teste em específico como no exemplo abaixo:

        cucumber -t "@pesquisaSimples_validando_resultados"