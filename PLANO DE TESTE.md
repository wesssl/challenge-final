# Plano de Testes — Cinema App

**Versão:** 1.0

**Data de início:** 29/09/2025

**Autor(a):** Wesley Lima

---

## 1. Introdução e Escopo

**Contexto:** O objetivo deste documento é definir a estratégia de teste para o projeto **Cinema app**, que consiste em uma aplicação web em Node.js.

### Escopo de Teste

**Em Escopo:**
* Fluxos de usuário.
* Todas as funcionalidades do **front-end** e do **back-end**, por priorização dos principais fluxos.
* Validações de formulários.
* Interações com a API.

**Fora de Escopo:**
* Testes de carga.
* Testes de segurança aprofundados.
* Testes de usabilidade extensivos.


## 2. Estratégia de Testes

A estratégia inicial será baseada em **testes exploratórios** para familiarização do testador com a aplicação.

Após sua conclusão, o testador partirá para os **testes de API**, mapeando e testando os *happy paths* através da ferramenta **Postman**.

As funcionalidades de alto risco serão mapeadas e priorizadas para testes e **automação com Robot Framework**, para garantir a estabilidade do sistema em futuras atualizações.

---

## 3. Análise inicial dos User Stories e Testes Exploratórios

Nesta seção, farei uma breve análise das **User Stories** e seus Critérios de Aceite para uso posterior na elaboração dos testes API (tanto manuais quanto automatizados).

Também elaborei um teste exploratório com uma timebox de 2:30h para me familiarizar com a aplicação e fazer uma checkagem inicial dos critérios de aceite. O teste alinha com os critérios de aceite, e a condição de sucesso é a conformidade com eles. **Obs.: O sucesso nessa etapa não indica ausência de falhas. Para referência, veja os resultados dos testes manuais e dos testes automatizados.**


[Análise dos US e Testes Exploratórios](US-Testes-exploratorios.md)

## 4. Mapeamento dos Endpoints

Durante o mapeamento, fiz um mapa-mental a mão para me familiarizar com a API. Após esse mapeamento, fiz um novo mapeamento através de AI Generativa usando o próprio Swagger da aplicação em .pdf para melhor organização no plano de teste.

[Mapeamento dos Endpoints](mapeamento-endpoints.md)

## 5. Casos de Teste

Nessa seção irei mapear os casos de teste referentes a cada uma das possíveis respostas da API.

| Código do Caso | Descrição do caso | Endpoint | Método | Autenticação | Resposta esperada |
| :--- | :--- | :--- | :--- | :--- | :--- |
| CT-AUTH-001 | Testar o cadastro de um novo usuário com dados válidos. | `/auth/register` | POST | Não | `201`: User registered successfully |
| CT-AUTH-002 | Testar o cadastro de um usuário com e-mail já existente. | `/auth/register` | POST | Não | `400`: User already exists or invalid data |
| CT-AUTH-003 | Testar o login de um usuário com credenciais válidas. | `/auth/login` | POST | Não | `200`: Login successful |
| CT-AUTH-004 | Testar o login de um usuário com credenciais inválidas. | `/auth/login` | POST | Não | `400`: Invalid credentials |
| CT-AUTH-005 | Testar a obtenção do perfil do usuário autenticado. | `/auth/me` | GET | Sim (Bearer Token) | `200`: User profile data |
| CT-AUTH-006 | Testar a obtenção do perfil do usuário sem token de autenticação. | `/auth/me` | GET | Não | `401`: Not authorized, no token |
| CT-AUTH-007 | Testar a obtenção do perfil do usuário com token inválido. | `/auth/me` | GET | Sim (Bearer Token inválido) | `403`: Not authorized, invalid token |
| CT-AUTH-008 | Testar a atualização do perfil de usuário com dados válidos. | `/auth/profile` | PUT | Sim (Bearer Token) | `200`: Profile updated successfully |
| CT-AUTH-009 | Testar a atualização do perfil com senha atual incorreta. | `/auth/profile` | PUT | Sim (Bearer Token) | `401`: Current password is incorrect |
| CT-AUTH-010 | Testar a atualização do perfil de um usuário não encontrado. | `/auth/profile` | PUT | Sim (Bearer Token) | `404`: User not found |
| CT-MOVIES-001 | Testar a listagem de todos os filmes sem filtros. | `/movies` | GET | Não | `200`: List of movies |
| CT-MOVIES-002 | Testar a criação de um novo filme com dados válidos (Admin). | `/movies` | POST | Sim (Admin Bearer Token) | `201`: Movie created successfully |
| CT-MOVIES-003 | Testar a criação de um filme com dados de entrada inválidos (Admin). | `/movies` | POST | Sim (Admin Bearer Token) | `400`: Invalid input data |
| CT-MOVIES-004 | Testar a criação de um filme sem autenticação. | `/movies` | POST | Não | `401`: Not authorized |
| CT-MOVIES-005 | Testar a criação de um filme com autenticação de usuário comum. | `/movies` | POST | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-MOVIES-006 | Testar a obtenção de detalhes de um filme por ID válido. | `/movies/{id}` | GET | Não | `200`: Movie details |
| CT-MOVIES-007 | Testar a obtenção de detalhes de um filme com ID inválido. | `/movies/{id}` | GET | Não | `400`: Invalid movie ID format |
| CT-MOVIES-008 | Testar a obtenção de detalhes de um filme não encontrado. | `/movies/{id}` | GET | Não | `404`: Movie not found |
| CT-MOVIES-009 | Testar a atualização de um filme por ID válido (Admin). | `/movies/{id}` | PUT | Sim (Admin Bearer Token) | `200`: Movie updated successfully |
| CT-MOVIES-010 | Testar a atualização de um filme com dados de entrada inválidos (Admin). | `/movies/{id}` | PUT | Sim (Admin Bearer Token) | `400`: Invalid input data |
| CT-MOVIES-011 | Testar a atualização de um filme sem autenticação. | `/movies/{id}` | PUT | Não | `401`: Not authorized |
| CT-MOVIES-012 | Testar a atualização de um filme com autenticação de usuário comum. | `/movies/{id}` | PUT | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-MOVIES-013 | Testar a atualização de um filme não encontrado (Admin). | `/movies/{id}` | PUT | Sim (Admin Bearer Token) | `404`: Movie not found |
| CT-MOVIES-014 | Testar a exclusão de um filme por ID válido (Admin). | `/movies/{id}` | DELETE | Sim (Admin Bearer Token) | `200`: Movie deleted successfully |
| CT-MOVIES-015 | Testar a exclusão de um filme sem autenticação. | `/movies/{id}` | DELETE | Não | `401`: Not authorized |
| CT-MOVIES-016 | Testar a exclusão de um filme com autenticação de usuário comum. | `/movies/{id}` | DELETE | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-MOVIES-017 | Testar a exclusão de um filme não encontrado (Admin). | `/movies/{id}` | DELETE | Sim (Admin Bearer Token) | `404`: Movie not found |
| CT-RESERVATIONS-001 | Testar a listagem de reservas do usuário autenticado. | `/reservations/me` | GET | Sim (Bearer Token) | `200`: User's reservations |
| CT-RESERVATIONS-002 | Testar a criação de uma nova reserva com dados válidos. | `/reservations` | POST | Sim (Bearer Token) | `201`: Reservation created successfully |
| CT-RESERVATIONS-003 | Testar a criação de uma reserva com dados inválidos ou assentos já ocupados. | `/reservations` | POST | Sim (Bearer Token) | `400`: Invalid input data or seats already taken |
| CT-RESERVATIONS-004 | Testar a criação de uma reserva para uma sessão não encontrada. | `/reservations` | POST | Sim (Bearer Token) | `404`: Session not found |
| CT-RESERVATIONS-005 | Testar a listagem de todas as reservas (Admin). | `/reservations` | GET | Sim (Admin Bearer Token) | `200`: List of all reservations |
| CT-RESERVATIONS-006 | Testar a listagem de todas as reservas sem autenticação. | `/reservations` | GET | Não | `401`: Not authorized |
| CT-RESERVATIONS-007 | Testar a listagem de todas as reservas com autenticação de usuário comum. | `/reservations` | GET | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-RESERVATIONS-008 | Testar a obtenção de detalhes de uma reserva por ID válido (Admin). | `/reservations/{id}` | GET | Sim (Admin Bearer Token) | `200`: Reservation details |
| CT-RESERVATIONS-009 | Testar a obtenção de detalhes de uma reserva não encontrada (Admin). | `/reservations/{id}` | GET | Sim (Admin Bearer Token) | `404`: Reservation not found |
| CT-RESERVATIONS-010 | Testar a atualização do status de uma reserva (Admin). | `/reservations/{id}` | PUT | Sim (Admin Bearer Token) | `200`: Reservation updated successfully |
| CT-RESERVATIONS-011 | Testar a atualização do status de uma reserva com transição inválida (Admin). | `/reservations/{id}` | PUT | Sim (Admin Bearer Token) | `400`: Invalid status transition |
| CT-RESERVATIONS-012 | Testar a atualização do status de uma reserva sem autenticação. | `/reservations/{id}` | PUT | Não | `401`: Not authorized |
| CT-RESERVATIONS-013 | Testar a atualização do status de uma reserva com autenticação de usuário comum. | `/reservations/{id}` | PUT | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-RESERVATIONS-014 | Testar a atualização do status de uma reserva não encontrada (Admin). | `/reservations/{id}` | PUT | Sim (Admin Bearer Token) | `404`: Reservation not found |
| CT-RESERVATIONS-015 | Testar a exclusão de uma reserva por ID válido (Admin). | `/reservations/{id}` | DELETE | Sim (Admin Bearer Token) | `200`: Reservation deleted successfully |
| CT-RESERVATIONS-016 | Testar a exclusão de uma reserva sem autenticação. | `/reservations/{id}` | DELETE | Não | `401`: Not authorized |
| CT-RESERVATIONS-017 | Testar a exclusão de uma reserva com autenticação de usuário comum. | `/reservations/{id}` | DELETE | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-RESERVATIONS-018 | Testar a exclusão de uma reserva não encontrada (Admin). | `/reservations/{id}` | DELETE | Sim (Admin Bearer Token) | `404`: Reservation not found |
| CT-SESSIONS-001 | Testar a listagem de todas as sessões de filmes. | `/sessions` | GET | Não | `200`: List of movie sessions |
| CT-SESSIONS-002 | Testar a criação de uma nova sessão com dados válidos (Admin). | `/sessions` | POST | Sim (Admin Bearer Token) | `201`: Session created successfully |
| CT-SESSIONS-003 | Testar a criação de uma sessão com dados de entrada inválidos (Admin). | `/sessions` | POST | Sim (Admin Bearer Token) | `400`: Invalid input data |
| CT-SESSIONS-004 | Testar a criação de uma sessão sem autenticação. | `/sessions` | POST | Não | `401`: Not authorized |
| CT-SESSIONS-005 | Testar a criação de uma sessão com autenticação de usuário comum. | `/sessions` | POST | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-SESSIONS-006 | Testar a criação de uma sessão para um filme ou teatro não encontrado. | `/sessions` | POST | Sim (Admin Bearer Token) | `404`: Movie or Theater not found |
| CT-SESSIONS-007 | Testar a criação de uma sessão com conflito de horário. | `/sessions` | POST | Sim (Admin Bearer Token) | `409`: Session conflict (time overlap) |
| CT-SESSIONS-008 | Testar a obtenção de detalhes de uma sessão por ID válido. | `/sessions/{id}` | GET | Não | `200`: Session details with populated movie and theater |
| CT-SESSIONS-009 | Testar a obtenção de detalhes de uma sessão não encontrada. | `/sessions/{id}` | GET | Não | `404`: Session not found |
| CT-SESSIONS-010 | Testar a atualização de uma sessão por ID válido (Admin). | `/sessions/{id}` | PUT | Sim (Admin Bearer Token) | `200`: Session updated successfully |
| CT-SESSIONS-011 | Testar a atualização de uma sessão com dados de entrada inválidos (Admin). | `/sessions/{id}` | PUT | Sim (Admin Bearer Token) | `400`: Invalid input data |
| CT-SESSIONS-012 | Testar a atualização de uma sessão sem autenticação. | `/sessions/{id}` | PUT | Não | `401`: Not authorized |
| CT-SESSIONS-013 | Testar a atualização de uma sessão com autenticação de usuário comum. | `/sessions/{id}` | PUT | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-SESSIONS-014 | Testar a atualização de uma sessão não encontrada (Admin). | `/sessions/{id}` | PUT | Sim (Admin Bearer Token) | `404`: Session not found |
| CT-SESSIONS-015 | Testar a atualização de uma sessão que já possui reservas (Admin). | `/sessions/{id}` | PUT | Sim (Admin Bearer Token) | `409`: Session has reservations, cannot update |
| CT-SESSIONS-016 | Testar a exclusão de uma sessão por ID válido (Admin). | `/sessions/{id}` | DELETE | Sim (Admin Bearer Token) | `200`: Session deleted successfully |
| CT-SESSIONS-017 | Testar a exclusão de uma sessão sem autenticação. | `/sessions/{id}` | DELETE | Não | `401`: Not authorized |
| CT-SESSIONS-018 | Testar a exclusão de uma sessão com autenticação de usuário comum. | `/sessions/{id}` | DELETE | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-SESSIONS-019 | Testar a exclusão de uma sessão não encontrada (Admin). | `/sessions/{id}` | DELETE | Sim (Admin Bearer Token) | `404`: Session not found |
| CT-SESSIONS-020 | Testar a exclusão de uma sessão com reservas confirmadas (Admin). | `/sessions/{id}` | DELETE | Sim (Admin Bearer Token) | `409`: Cannot delete session with confirmed reservations |
| CT-SESSIONS-021 | Testar a redefinição de assentos em uma sessão por ID válido (Admin). | `/sessions/{id}/reset-seats` | PUT | Sim (Admin Bearer Token) | `200`: Seats reset successfully |
| CT-SESSIONS-022 | Testar a redefinição de assentos em uma sessão sem autenticação. | `/sessions/{id}/reset-seats` | PUT | Não | `401`: Not authorized |
| CT-SESSIONS-023 | Testar a redefinição de assentos em uma sessão com autenticação de usuário comum. | `/sessions/{id}/reset-seats` | PUT | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-SESSIONS-024 | Testar a redefinição de assentos em uma sessão não encontrada (Admin). | `/sessions/{id}/reset-seats` | PUT | Sim (Admin Bearer Token) | `404`: Session not found |
| CT-SETUP-001 | Testar a criação de um usuário admin (somente em ambiente de dev). | `/setup/admin` | POST | Não | `201`: Admin user created successfully |
| CT-SETUP-002 | Testar a criação de um usuário admin com dados inválidos ou e-mail já existente. | `/setup/admin` | POST | Não | `400`: Invalid input data or user already exists |
| CT-SETUP-003 | Testar a criação de um usuário admin em ambiente de produção. | `/setup/admin` | POST | Não | `403`: Not available in production |
| CT-SETUP-004 | Testar a criação de usuários de teste padrão (somente em ambiente de dev). | `/setup/test-users` | POST | Não | `201`: Test users created successfully |
| CT-SETUP-005 | Testar a criação de usuários de teste padrão quando já existem. | `/setup/test-users` | POST | Não | `200`: Test users already exist |
| CT-SETUP-006 | Testar a criação de usuários de teste padrão em ambiente de produção. | `/setup/test-users` | POST | Não | `403`: Not available in production |
| CT-THEATERS-001 | Testar a listagem de todos os teatros. | `/theaters` | GET | Não | `200`: List of theaters |
| CT-THEATERS-002 | Testar a criação de um novo teatro com dados válidos (Admin). | `/theaters` | POST | Sim (Admin Bearer Token) | `201`: Theater created successfully |
| CT-THEATERS-003 | Testar a criação de um teatro com dados de entrada inválidos (Admin). | `/theaters` | POST | Sim (Admin Bearer Token) | `400`: Invalid input data |
| CT-THEATERS-004 | Testar a criação de um teatro sem autenticação. | `/theaters` | POST | Não | `401`: Not authorized |
| CT-THEATERS-005 | Testar a criação de um teatro com autenticação de usuário comum. | `/theaters` | POST | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-THEATERS-006 | Testar a criação de um teatro com nome já existente (Admin). | `/theaters` | POST | Sim (Admin Bearer Token) | `409`: Theater with that name already exists |
| CT-THEATERS-007 | Testar a obtenção de detalhes de um teatro por ID válido. | `/theaters/{id}` | GET | Não | `200`: Theater details |
| CT-THEATERS-008 | Testar a obtenção de detalhes de um teatro não encontrado. | `/theaters/{id}` | GET | Não | `404`: Theater not found |
| CT-THEATERS-009 | Testar a atualização de um teatro por ID válido (Admin). | `/theaters/{id}` | PUT | Sim (Admin Bearer Token) | `200`: Theater updated successfully |
| CT-THEATERS-010 | Testar a atualização de um teatro com dados de entrada inválidos (Admin). | `/theaters/{id}` | PUT | Sim (Admin Bearer Token) | `400`: Invalid input data |
| CT-THEATERS-011 | Testar a atualização de um teatro sem autenticação. | `/theaters/{id}` | PUT | Não | `401`: Not authorized |
| CT-THEATERS-012 | Testar a atualização de um teatro com autenticação de usuário comum. | `/theaters/{id}` | PUT | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-THEATERS-013 | Testar a atualização de um teatro não encontrado (Admin). | `/theaters/{id}` | PUT | Sim (Admin Bearer Token) | `404`: Theater not found |
| CT-THEATERS-014 | Testar a atualização de um teatro com nome já em uso. | `/theaters/{id}` | PUT | Sim (Admin Bearer Token) | `409`: Theater name already in use |
| CT-THEATERS-015 | Testar a exclusão de um teatro por ID válido (Admin). | `/theaters/{id}` | DELETE | Sim (Admin Bearer Token) | `200`: Theater deleted successfully |
| CT-THEATERS-016 | Testar a exclusão de um teatro sem autenticação. | `/theaters/{id}` | DELETE | Não | `401`: Not authorized |
| CT-THEATERS-017 | Testar a exclusão de um teatro com autenticação de usuário comum. | `/theaters/{id}` | DELETE | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-THEATERS-018 | Testar a exclusão de um teatro não encontrado (Admin). | `/theaters/{id}` | DELETE | Sim (Admin Bearer Token) | `404`: Theater not found |
| CT-THEATERS-019 | Testar a exclusão de um teatro com sessões ativas (Admin). | `/theaters/{id}` | DELETE | Sim (Admin Bearer Token) | `409`: Cannot delete theater with active sessions |
| CT-USERS-001 | Testar a listagem de todos os usuários (Admin). | `/users` | GET | Sim (Admin Bearer Token) | `200`: List of users |
| CT-USERS-002 | Testar a listagem de usuários sem autenticação. | `/users` | GET | Não | `401`: Not authorized |
| CT-USERS-003 | Testar a listagem de usuários com autenticação de usuário comum. | `/users` | GET | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-USERS-004 | Testar a obtenção de detalhes de um usuário por ID válido (Admin). | `/users/{id}` | GET | Sim (Admin Bearer Token) | `200`: User details |
| CT-USERS-005 | Testar a obtenção de detalhes de um usuário sem autenticação. | `/users/{id}` | GET | Não | `401`: Not authorized |
| CT-USERS-006 | Testar a obtenção de detalhes de um usuário com autenticação de usuário comum. | `/users/{id}` | GET | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-USERS-007 | Testar a obtenção de detalhes de um usuário não encontrado (Admin). | `/users/{id}` | GET | Sim (Admin Bearer Token) | `404`: User not found |
| CT-USERS-008 | Testar a atualização de um usuário por ID válido (Admin). | `/users/{id}` | PUT | Sim (Admin Bearer Token) | `200`: User updated successfully |
| CT-USERS-009 | Testar a atualização de um usuário com dados de entrada inválidos (Admin). | `/users/{id}` | PUT | Sim (Admin Bearer Token) | `400`: Invalid input data |
| CT-USERS-010 | Testar a atualização de um usuário sem autenticação. | `/users/{id}` | PUT | Não | `401`: Not authorized |
| CT-USERS-011 | Testar a atualização de um usuário com autenticação de usuário comum. | `/users/{id}` | PUT | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-USERS-012 | Testar a atualização de um usuário não encontrado (Admin). | `/users/{id}` | PUT | Sim (Admin Bearer Token) | `404`: User not found |
| CT-USERS-013 | Testar a atualização de um usuário com e-mail já em uso (Admin). | `/users/{id}` | PUT | Sim (Admin Bearer Token) | `409`: Email already in use |
| CT-USERS-014 | Testar a exclusão de um usuário por ID válido (Admin). | `/users/{id}` | DELETE | Sim (Admin Bearer Token) | `200`: User deleted successfully |
| CT-USERS-015 | Testar a exclusão de um usuário sem autenticação. | `/users/{id}` | DELETE | Não | `401`: Not authorized |
| CT-USERS-016 | Testar a exclusão de um usuário com autenticação de usuário comum. | `/users/{id}` | DELETE | Sim (User Bearer Token) | `403`: Forbidden - Admin access required |
| CT-USERS-017 | Testar a exclusão de um usuário não encontrado (Admin). | `/users/{id}` | DELETE | Sim (Admin Bearer Token) | `404`: User not found |
| CT-USERS-018 | Testar a exclusão de um usuário com reservas ativas (Admin). | `/users/{id}` | DELETE | Sim (Admin Bearer Token) | `409`: Cannot delete user with active reservations |
| CT-API-INFO-001 | Testar a obtenção de informações gerais da API. | `/` | GET | Não | `200`: API information and available endpoints |

## 6. Riscos do Produto e Priorização

Com base nos User Stories e no cronograma disposto, aqui analisarei os riscos e a priorização dos casos de teste, focando nos fluxos mais críticos para o negócio.

### Tabela de Riscos

O fluxo de negócio mais importante nesse projeto é a jornada completa de um usuário, desde o registro/login até a conclusão de uma reserva. Portanto, as histórias de usuário relacionadas a esse fluxo principal terão a maior prioridade, visto que a matriz de risco prioriza esse fluxo.

| Risco | Probabilidade | Impacto | Pontuação de Risco |
| :--- | :---: | :---: | :---: |
| Falha de Autenticação | 4 (Alta) | 4 (Alto) | 16 |
| Falha no Fluxo de Reserva | 5 (Muito Alta) | 5 (Crítico) | 25 |
| Exibição Incorreta de Filmes/Sessões | 3 (Média) | 4 (Alto) | 12 |
| Dados de Usuário Desatualizados | 2 (Baixa) | 3 (Médio) | 6 |
| Conflito de Sessões (Admin) | 3 (Média) | 2 (Baixo) | 6 |
| Exclusão de Entidades com Dependências | 2 (Baixa) | 2 (Baixo) | 4 |
| Respostas de API Incorretas | 3 (Média) | 3 (Médio) | 9 |
| Problemas de Permissão (Roles) | 3 (Média) | 4 (Alto) | 12 |
| Performance Lenta na Carga de Dados | 2 (Baixa) | 3 (Médio) | 6 |

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

## 7. Testes Manuais com Postman

## 8. Testes Automatizados (Robot Framework)

## 9. Registro de Incidente (Bug Report)

## 10. Cobertura

## 11. Cronograma

| Atividade | Responsável | Início Estimado | Fim Estimado | Status |
| :--- | :--- | :--- | :--- | :--- |
| Confeccão do Plano de Teste | Wesley | 30/09/2025 | 01/10/2025 | Concluído |
| Análise inicial dos User Stories e Testes Exploratórios | Wesley | 01/10/2025 | 02/10/2025 | Concluído |
| Mapeamento dos endpoints e Casos de Teste | Wesley | 02/10/2025 | 03/10/2025 | Concluído |
| Riscos, Priorização e Testes Manuais com Postman | Wesley | 03/10/2025 | 06/10/2025 | Em Andamento |
| Testes Automatizados (Robot Framework) | Wesley | 05/10/2025 | 10/10/2025 | Tarefas Pendentes |
| Registro de Incidente e Relatório | Wesley | 08/10/2025 | 11/10/2025 | Tarefas Pendentes |

## 12. Histórico de uso de GenAI

Nesta seção irei catalogar todos os casos de uso de GenAI durante a confecção do plano de teste e execução dos testes, para referência posterior.

| Caso de Uso | Data | Arquivos Complementares | Precisou de correções? |
| :--- | :--- | :--- | :--- |
| Mapeamento dos endpoints | 01/09/2025 | swagger.pdf | SIM
| Mapeamento dos casos de teste dos endpoints | 02/09/2025 | swagger.pdf, USER STORIES.md, PLANO DE TESTE.md | SIM
