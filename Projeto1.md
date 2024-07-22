# PROJETO 1
## Criar um fluxo de dados extraindo informações de uma API, tratar e modelar os dados usando SQL no DataBricks e disponibilizar as tabelas finais para consumo

### Origem dos dados: 
https://randomuser.me/api/

Essa API gera dados randomicos de informações pessoais, precisamos trazer esses dados para nosso DataLake e criar uma tabela de cadastro que seja atualizada de forma incremental toda vez que a API for chamada.


### DataFactory
Criar um pipeline que vai ser responsável por chamar a API e armazenar o resultado no DataLake (Camada Bronze)

### DataBricks
Criar notebooks que leiam o arquivo gerado pelo DataFactory e transforme ele em uma tabela tipo Delta.
Aplicar todos os tratamentos necessários para cada coluna importada.
Criar queries para transferir dados entre as camadas bronze, prata e ouro.
Vincular os notebooks para serem executados no DataFactory.

Criar um gatilho de execução
Criar Queries para consumir os dados finais com agregações de usuários/cidade, usuários por idade, 


 que