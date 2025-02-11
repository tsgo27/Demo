# Modelo de Sistema para Desenvolvimento para Iniciantes

O Demo - Sistema Modelo para Desenvolvedores, foi criado como uma referência prática para estudantes universitários em formação, oferecendo uma base sólida para o aprendizado de desenvolvimento de sistemas.

O projeto adota a arquitetura MVC (Model-View-Controller), que organiza de forma clara as camadas de dados, lógica de negócios e interface, facilitando a manutenção e a escalabilidade do código. Ele também conta com configurações de segurança implementadas, proporcionando um ambiente confiável para experimentação.

Além disso, o modelo já possui uma configuração de conexão com o banco de dados estruturada, exigindo apenas que o usuário insira o nome do banco e a senha para utilizá-lo.

![tela-login](https://github.com/user-attachments/assets/7f69a013-b0b9-4556-82fb-05c698243c71)




---

![img-usuário](https://github.com/user-attachments/assets/e8f29454-33dc-43fb-955e-56bfb9247ea4)


---

## Tecnologia Utilizada no Projeto

- **Linguagem de Programação**: PHP  
- **IDE Utilizada no Desenvolvimento**: Visual Studio Code  
- **Banco de Dados**: MySQL  
- **Back-End**: PHP  

---

## Funcionalidades Configuradas

O sistema já vem com as seguintes funcionalidades configuradas e prontas para uso:

- **Proteção CSRF**: O sistema possui proteção contra CSRF, garantindo a segurança nas requisições feitas pelo usuário.
  
- **Bloqueio de Login**: O sistema registra tentativas de login, se um usuário errar mais de 5 vezes, o acesso é bloqueado por 5 minutos, prevenindo ataques de força bruta.

- **Controle de Acesso**: O sistema também permite o bloqueio de contas de usuários, seja por motivo de férias ou qualquer outra razão. Isso garante que apenas usuários autorizados tenham acesso ao sistema, mantendo o controle de segurança e evitando acessos indevidos.
  
- **URLs Amigáveis**: As URLs do sistema são amigáveis e facilitam a navegação.
  
- **Página de Erro 403**: Caso o usuário tente acessar uma página sem permissão, será exibida uma página de erro 403.
  
- **Página de Erro 404**: Caso a página solicitada não seja encontrada, o sistema exibe uma página de erro 404 personalizada.
  
- **Página de Erro de Conexão com Banco de Dados**: Caso haja falha na conexão com o banco de dados, o sistema exibirá uma página de erro específica. Além disso, o arquivo `.env` permite habilitar o modo de debug para exibir os erros diretamente na página de erro de conexão, facilitando a identificação do problema.


---

## Variáveis de Ambiente

Para executar o projeto, o usuário deve configurar primeiro um servidor local, como o XAMPP, ou qualquer servidor de sua preferência. Após isso, é necessário importar o banco de dados chamado db_demo, que está localizado na pasta database do projeto.
Antes de configurar a conexão com o banco de dados, o estudante deve copiar o arquivo **.env.example** localizado na raiz do projeto e renomeá-lo para **.env** Esse arquivo contém as configurações necessárias para a conexão com o banco de dados, incluindo o nome do banco, usuário e senha, conforme os seguintes parâmetros:

DB_NAME=db_demo

DB_USER=root

DB_PASSWORD=

---

Após importar o banco de dados, o usuário pode acessar o sistema utilizando os seguintes dados de login:

- **Matrícula**: 123456789  
- **Senha**: admin  

Esses dados fornecem acesso inicial ao sistema, permitindo que o usuário personalize demo conforme suas necessidades.


---

## Autores

- Desenvolvedor sua equipe



---

## Licença
Copyright © 2025 Demo.

Este projeto é licenciado [MIT](https://choosealicense.com/licenses/mit/)
