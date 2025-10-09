# Priorização dos Casos de Teste de API

### Prioridade Alta: Fluxo Principal do Usuário (Happy Path)

Estes são os testes essenciais que garantem que o usuário possa realizar a ação principal do aplicativo: encontrar um filme, fazer uma reserva e pagar. Qualquer falha aqui impede o negócio de funcionar.

* **Autenticação e Perfil**:

    * `CT-AUTH-001`: Testar o cadastro de um novo usuário com dados válidos.

    * `CT-AUTH-003`: Testar o login de um usuário com credenciais válidas.

* **Visualização de Filmes e Sessões**:

    * `CT-MOVIES-001`: Testar a listagem de todos os filmes sem filtros.

    * `CT-MOVIES-006`: Testar a obtenção de detalhes de um filme por ID válido.

    * `CT-SESSIONS-001`: Testar a listagem de todas as sessões de filmes.

    * `CT-SESSIONS-008`: Testar a obtenção de detalhes de uma sessão por ID válido.

* **Fluxo de Reserva:**

    * `CT-RESERVATIONS-002`: Testar a criação de uma nova reserva com dados válidos.

    * `CT-RESERVATIONS-003`: Testar a criação de uma reserva com dados inválidos ou assentos já ocupados.

### 2. Prioridade Média: Fluxos Secundários e de Gestão de Usuário

Esses testes garantem funcionalidades importantes que não impedem diretamente o fluxo de compra, mas são cruciais para a experiência do usuário e para o suporte.

* **Autenticação e Perfil:**

    * `CT-AUTH-004`: Testar o login de um usuário com credenciais inválidas.

    * `CT-AUTH-005`: Testar a obtenção do perfil do usuário autenticado.

    * `CT-AUTH-006`: Testar a obtenção do perfil do usuário sem token de autenticação.

    * `CT-AUTH-007`: Testar a obtenção do perfil do usuário com token inválido.

    * `CT-AUTH-008`: Testar a atualização do perfil de usuário com dados válidos.

    * `CT-AUTH-009`: Testar a atualização do perfil com senha atual incorreta.

* **Reservas e Visualização:**

    * `CT-RESERVATIONS-001`: Testar a listagem de reservas do usuário autenticado.

    * `CT-RESERVATIONS-004`: Testar a criação de uma reserva para uma sessão não encontrada.

    * `CT-RESERVATIONS-009`: Testar a obtenção de detalhes de uma reserva não encontrada (Admin).

* **Visualização de Filmes e Sessões:**

    * `CT-MOVIES-007`: Testar a obtenção de detalhes de um filme com ID inválido.

    * `CT-MOVIES-008`: Testar a obtenção de detalhes de um filme não encontrado.

    * `CT-SESSIONS-009`: Testar a obtenção de detalhes de uma sessão não encontrada.

### 3. Prioridade Baixa: Fluxos de Administração e Configuração

Esses testes cobrem funcionalidades que são usadas internamente (por administradores) ou que se aplicam apenas ao ambiente de desenvolvimento. Eles podem ser deixados para o final, quando o fluxo principal já estiver estável.

* **Gerenciamento de Filmes:**

    * `CT-MOVIES-002` até `CT-MOVIES-017`: Todos os testes de criação, atualização e exclusão de filmes.

* **Gerenciamento de Reservas (Admin):**

    * `CT-RESERVATIONS-005` até `CT-RESERVATIONS-018` (exceto `CT-RESERVATIONS-009`, que é de prioridade média): Todos os testes de gerenciamento de reservas por administradores.

* **Gerenciamento de Sessões, Teatros e Usuários:**

    * Todos os testes de criação, atualização e exclusão de sessões, teatros e usuários (`CT-SESSIONS-002` a `CT-SESSIONS-024`, `CT-THEATERS-001` a `CT-THEATERS-019` e `CT-USERS-001` a `CT-USERS-018`).

* **Endpoints de Configuração (Setup):**

    * Todos os testes relacionados aos endpoints `/setup` (`CT-SETUP-001` até `CT-SETUP-006`).

# Priorização dos Casos de Teste de Web (front)

*  **Prioridade Alta**: Aqui estão os testes essenciais para o fluxo principal de um usuário, garantindo que as funcionalidades mais importantes estejam operacionais para o público em geral. A falha em qualquer um desses cenários impede o uso básico da aplicação.

    * `CT-WEB-AUTH-001`: Registro de novo usuário.

    * `CT-WEB-AUTH-003`: Login com credenciais válidas.

    * `CT-WEB-MOVIE-001`: Exibição da página inicial.

    * `CT-WEB-MOVIE-002`: Navegação da lista de filmes.

    * `CT-WEB-MOVIE-003`: Exibição da página de detalhes do filme e acesso à seleção de assentos.

    * `CT-WEB-RESERVE-001`: Seleção de assentos disponíveis.

    * `CT-WEB-RESERVE-003`: Processo de checkout e finalização da compra.

    * `CT-WEB-NAV-001`: Navegação geral do cabeçalho.

* **Prioridade Média**: Esses testes cobrem cenários de falha comuns e funcionalidades que, embora importantes para a experiência do usuário, não interrompem o fluxo principal de receita.

    * `CT-WEB-AUTH-002`: Cadastro com e-mail duplicado.

    * `CT-WEB-AUTH-004`: Login com credenciais inválidas.

    * `CT-WEB-AUTH-005`: Logout da conta.

    * `CT-WEB-AUTH-006`: Atualização do nome de perfil.

    * `CT-WEB-RESERVE-002`: Seleção de assentos já reservados.

    * `CT-WEB-RESERVE-004`: Visualização das reservas.

    * `CT-WEB-MOVIE-004`: Visualização dos horários de sessões.

    * `CT-WEB-NAV-003`: Acesso a rotas personalizadas (Minhas Reservas e Perfil).

* **Prioridade Baixa**: Esses testes se concentram na usabilidade e na experiência em diferentes ambientes. Eles são importantes, mas podem ser realizados após a validação das funcionalidades mais críticas.

    * `CT-WEB-NAV-002`: Navegação em diferentes tamanhos de tela (responsividade).