# Análise dos US e Testes Exploratórios

### Papéis de Usuário

* **Visitante:** Usuário não autenticado

* **Usuário:** Usuário regular autenticado

* **Administrador:** Usuário com privilégios de administrador.


### User Stories e Testes

```
Informação do ambiente de testes

Versão da aplicação: v1.0

Versão do navegador: Version 140.0.7339.133 (Official Build) (arm64)

Sistema Operacional:  macOS Tahoe Version 26.0 (25A354)

Data de início: 30/09/2025 02:15 PM

Data de fim: 30/09/2025 04:45 PM
```

### US AUTH-001 - Cadastro


#### Critérios de Aceite

* Input necessário: nome, e-mail, senha

* Não pode e-mail duplicado

* Deve ser redirecionado para login

#### Teste Exploratório

* Payload:

    * Nome: User Example

    * E-mail: example@example.com

    * Senha e confirmação: qatest123

    * Considerações finais: `Sucesso`

### US AUTH-002 - LogIn


#### Critérios de Aceite

* Input necessário: e-mail e senha

* Apenas credenciais válidas

* Sessão mantida por token JWT

* Deve ser redirecionado para página inicial

#### Teste Exploratório:

* Payload (válido):

    * E-mail: example@example.com

    * Senha: qatest123

    * Considerações finais: `Sucesso`


### US AUTH-003 - LogOut


#### Critérios de Aceite

* Exige que o usuário esteja autenticado

* LogOut através do menu de navegação

* Perde acesso a rotas protegidas

* Token JWT é excluído

#### Teste Exploratório

* Considerações finais: `Sucesso`


### US-AUTH-004 - Edição do Cadastro


#### Critérios de Aceite

* Deve exigir que o usuário esteja autenticado

* Deve exibir informações do usuário

* Usuário pode editar nome

* Sistema deve indicar visualmente os campos que foram alterados

* Sistema deve confirmar sucesso na edição após salvar

* Interface deve exibir mensagem de alteração

* Página de perfil separada da página de reservas

#### Teste Exploratório

* Considerações finais: `Sucesso`


### US-HOME-001 - Página inicial atrativa


#### Critérios de Aceite

* Página inicial deve exibir banner do cinema

* Sessão destacada com filmes em cartaz

* Layout adaptável para vários dispositivos

* Links rápidos para as principais áreas

* Acesso rápido através do cabeçalho

* Usuários autenticados veem opções personalizadas do menu

#### Teste Exploratório

* Considerações finais: `Sucesso`


### US-MOVIE-001 - Navegação da lista de filmes


#### Critérios de Aceite

* Exibição da lista em layout de grid

* Posters grandes de alta qualidade

* Cards devem conter: título, classificação, gêneros, duração do filme e data de lançamento

* Usuário consegue acessar detalhes do filme com um clique

#### Teste exploratório:

* Considerações finais: `Sucesso`


### US-MOVIE-002: Visualizar Detalhes do Filme


#### Critérios de Aceite

* Detalhes devem incluir sinopse, elenco, diretor, data de lançamento, duração

* Página deve mostrar pôster do filme e horários de sessões disponíveis

* Reserva deve ser acessada a partir das sessões disponíveis

#### Teste exploratório

* Considerações finais: `Sucesso`


### US-SESSION-001: Visualizar Horários de Sessões


#### Critérios de Aceite

* Usuário deve conseguir ver os horários de sessão disponíveis

* Deve conter informação de: data, hora, teatro e disponibilidade

* Usuário deve conseguir acessar e navegar na seleção de assentos

#### Teste exploratório

* Considerações finais: `Sucesso`


### US-RESERVE-001: Selecionar Assentos para Reserva


#### Critérios de Aceite

* Layout de assentos visível

* Assentos codificados por cores dependendo da disponibilidade

* Usuário deve conseguir escolher mais de um assento

* Usuário náo pode selecionar assentos já reservados

* Sistema deve mostrar sub-total a medida que os assentos são selecionados

#### Teste exploratório

* Considerações finais: `Sucesso`


### US-RESERVE-002: Processo de Checkout


#### Critérios de Aceite

* Redirecionado para a página de checkout após selecionar assentos

* Deve exibir assentos selecionados, valor total da compra

* Deve exibir opções de pagamento: (cartão de crédito, débito, PIX, transferência)

* Sistema deve processar pagamento e confirmar reserva

* Deve confirmar visualmente a reserva do assento

* Assentos reservados devem ser marcados como ocupados

#### Teste exploratório


* Considerações finais: `Sucesso`


### US-RESERVE-003: Visualizar Minhas Reservas

#### Critérios de Aceite

* Usuário pode acessar lista de suas reservas através do link "Minhas Reservas" no menu

* Reservas são exibidas em formato de card com informações visuais claras

* Cada reserva exibe filme, data, horário, cinema, assentos, status e método de pagamento

* Usuário pode visualizar o pôster do filme associado à reserva

* Sistema exibe indicadores visuais de status da reserva (confirmada, pendente, cancelada)

* Usuário pode acessar página dedicada de reservas separada das informações de perfil

#### Teste Exploratório

* Considerações finais: `Sucesso`


### US-NAV-001: Navegação Intuitiva


#### Critérios de Aceite

* Cabeçalho está presente em todas as páginas com links para áreas principais

* Menu é responsivo e se adapta a diferentes tamanhos de tela (versão móvel)

* Usuário logado tem acesso à seções personalizadas como "Minhas Reservas" e "Perfil"

* Breadcrumbs ou elementos de navegação indicam o caminho atual do usuário

* Links diretos para retornar à página anterior quando apropriado

* Feedback visual indica a página atual no menu de navegação