# Plano de Testes — Cinema App

**Versão:** 1.0

**Data de início:** 29/09/2025

**Autor(a):** Wesley Lima

---

## 1. Introdução e Escopo

**Contexto:** O objetivo deste documento é definir a estratégia de teste para o projeto **Cinema app**, que consiste em uma aplicação web em Node.js.

### Escopo de Teste

**Em Escopo:**
* Todas as funcionalidades do **front-end** e do **back-end**.
* Fluxos de usuário.
* Validações de formulários.
* Interações com a API.

**Fora de Escopo:**
* Testes de carga.
* Testes de segurança aprofundados.
* Testes de usabilidade extensivos.

---

## 2. Estratégia de Testes

A estratégia inicial será baseada em **testes exploratórios** para familiarização do testador com a aplicação.

Após sua conclusão, o testador partirá para os **testes de API**, mapeando e testando os *happy paths* através da ferramenta **Postman**.

As funcionalidades de alto risco serão mapeadas e priorizadas para testes e **automação com Robot Framework**, para garantir a estabilidade do sistema em futuras atualizações.

---

## 3. Análise inicial dos User Stories e Testes Exploratórios

Nesta seção, farei uma breve análise das User Stories e seus Critérios de Aceite para uso posterior na elaboração dos testes API (tanto manuais quanto automatizados).

Também elaborei um teste exploratório com uma timebox de 2:30h para me familiarizar com a aplicação e fazer uma checkagem inicial dos critérios de aceite. O teste alinha com os critérios de aceite, e a condição de sucesso é a conformidade com eles. **Obs.: O sucesso nessa etapa não indica ausência de falhas. Para referência, veja os resultados dos testes manuais e dos testes automatizados.**

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

* US AUTH-001 - Cadastro

```
Critérios de Aceite

- Input necessário: nome, e-mail, senha

- Não pode e-mail duplicado

- Deve ser redirecionado para login

Teste Exploratório

- Payload:

    - Nome: User Example

    - E-mail: example@example.com

    - Senha e confirmação: qatest123

    - Considerações finais: Sucesso
```
* US AUTH-002 - LogIn

```
Critérios de Aceite

    - Input necessário: e-mail e senha

    - Apenas credenciais válidas

    - Sessão mantida por token JWT

    - Deve ser redirecionado para página inicial

Teste Exploratório:

- Payload (válido):

    - E-mail: example@example.com

    - Senha: qatest123

    - Considerações finais: Sucesso
```

* US AUTH-003 - LogOut

```
Critérios de Aceite

    - Exige que o usuário esteja autenticado

    - LogOut através do menu de navegação

    - Perde acesso a rotas protegidas

    - Token JWT é excluído

Teste Exploratório

    - Considerações finais: Sucesso
```

* US-AUTH-004 - Edição do Cadastro

```
Critérios de Aceite

    - Deve exigir que o usuário esteja autenticado

    - Deve exibir informações do usuário

    - Usuário pode editar nome

    - Sistema deve indicar visualmente os campos que foram alterados

    - Sistema deve confirmar sucesso na edição após salvar

    - Interface deve exibir mensagem de alteração

    - Página de perfil separada da página de reservas

Teste Exploratório

    - Considerações finais: Sucesso
```

* US-HOME-001 - Página inicial atrativa

```
Critérios de Aceite

    - Página inicial deve exibir banner do cinema

    - Sessão destacada com filmes em cartaz

    - Layout adaptável para vários dispositivos

    - Links rápidos para as principais áreas

    - Acesso rápido através do cabeçalho

    - Usuários autenticados veem opções personalizadas do menu

Teste Exploratório

    - Considerações finais: Sucesso
```

* US-MOVIE-001 - Navegação da lista de filmes

```
Critérios de Aceite

    - Exibição da lista em layout de grid

    - Posters grandes de alta qualidade

    - Cards devem conter: título, classificação, gêneros, duração do filme e data de lançamento

    - Usuário consegue acessar detalhes do filme com um clique

Teste exploratório:

    - Considerações finais: Sucesso
```

* US-MOVIE-002: Visualizar Detalhes do Filme

```
Critérios de Aceite

    - Detalhes devem incluir sinopse, elenco, diretor, data de lançamento, duração

    - Página deve mostrar pôster do filme e horários de sessões disponíveis

    - Reserva deve ser acessada a partir das sessões disponíveis

Teste exploratório

    - Considerações finais: Sucesso
```

* US-SESSION-001: Visualizar Horários de Sessões

```
Critérios de Aceite

    - Usuário deve conseguir ver os horários de sessão disponíveis

    - Deve conter informação de: data, hora, teatro e disponibilidade

    - Usuário deve conseguir acessar e navegar na seleção de assentos

Testes exploratórios

    - Considerações finais: Sucesso
```

* US-RESERVE-001: Selecionar Assentos para Reserva

```
Critérios de Aceite

    - Layout de assentos visível

    - Assentos codificados por cores dependendo da disponibilidade

    - Usuário deve conseguir escolher mais de um assento

    - Usuário náo pode selecionar assentos já reservados

    - Sistema deve mostrar sub-total a medida que os assentos são selecionados

Teste exploratório

    - Considerações finais: Sucesso
```

* US-RESERVE-002: Processo de Checkout

```
Critérios de Aceite

    - Redirecionado para a página de checkout após selecionar assentos

    - Deve exibir assentos selecionados, valor total da compra

    - Deve exibir opções de pagamento: (cartão de crédito, débito, PIX, transferência)

    - Sistema deve processar pagamento e confirmar reserva

    - Deve confirmar visualmente a reserva do assento

    - Assentos reservados devem ser marcados como ocupados

Teste exploratório


    - Considerações finais: Sucesso
```

* US-RESERVE-003: Visualizar Minhas Reservas


```
Critérios de Aceite

    - Usuário pode acessar lista de suas reservas através do link "Minhas Reservas" no menu

    - Reservas são exibidas em formato de card com informações visuais claras

    - Cada reserva exibe filme, data, horário, cinema, assentos, status e método de pagamento

    - Usuário pode visualizar o pôster do filme associado à reserva

    - Sistema exibe indicadores visuais de status da reserva (confirmada, pendente, cancelada)

    - Usuário pode acessar página dedicada de reservas separada das informações de perfil

Teste Exploratório

    - Considerações finais: Sucesso
```

* US-NAV-001: Navegação Intuitiva

```
Critérios de Aceite

    - Cabeçalho está presente em todas as páginas com links para áreas principais

    - Menu é responsivo e se adapta a diferentes tamanhos de tela (versão móvel)

    - Usuário logado tem acesso à seções personalizadas como "Minhas Reservas" e "Perfil"

    - Breadcrumbs ou elementos de navegação indicam o caminho atual do usuário

    - Links diretos para retornar à página anterior quando apropriado

    - Feedback visual indica a página atual no menu de navegação
```

## 4. Mapeamento dos Endpoints

Durante o mapeamento, fiz um mapa-mental a mão para me familiarizar com a API. Após esse mapeamento, fiz um através de AI Generativa usando o próprio Swagger da aplicação em .pdf para melhor organização no plano de teste.

### 1. Autenticação (**Auth API**)

**POST** `/auth/register`: Register a new user
* **Corpo da Requisição:** `name`, `email`, `password`.
    * **Respostas:**
        * `201`: User registered successfully
        * `400`: User already exists or invalid data 

**POST** `/auth/login`: Login a user
* **Corpo da Requisição:** `email`, `password`.
    * **Respostas:**
        * `200`: Login successful 
        * `400`: Invalid credentials

**GET** `/auth/me`: Get current user profile
* **Corpo da Requisição:** `Authorization`: Bearer token (header)
    * **Respostas:**
        * `200`: User profile data
        * `401`: Not authorized, no token
        * `403`: Not authorized, invalid token 

**PUT** `/auth/profile`: Update user profile
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `name`, `currentPassword`, `newPassword`.
    * **Respostas:**
        * `200`: Profile updated successfully 
        * `401`: Current password is incorrect 
        * `404`: User not found

### 2. Filmes (**Movies API**)

**GET** `/movies`: Get all movies
* **Corpo da Requisição:** `title` (query), `genre` (query), `sort` (query), `limit` (query), `page` (query)
    * **Respostas:**
        * `200`: List of movies

**POST** `/movies`: Create a new movie
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `title`, `synopsis`, `director`, `genres`, `duration`, `classification`, `poster`, `releaseDate`.
    * **Respostas:**
        * `201`: Movie created successfully
        * `400`: Invalid input data 
        * `401`: Not authorized
        * `403`: Forbidden - Admin access required

**GET** `/movies/{id}`: Get a movie by ID
* **Corpo da Requisição:** `id` (path).
    * **Respostas:**
        * `200`: Movie details 
        * `400`: Invalid movie ID format 
        * `404`: Movie not found 

**PUT** `/movies/{id}`: Update a movie
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `id` (path), `title`, `synopsis`, `director`, `genres`, `duration`, `classification`, `poster`, `releaseDate`.
    * **Respostas:**
        * `200`: Movie updated successfully 
        * `400`: Invalid input data
        * `401`: Not authorized
        * `403`: Forbidden - Admin access required
        * `404`: Movie not found

**DELETE** `/movies/{id}`: Delete a movie
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `id` (path).
    * **Respostas:**
        * `200`: Movie deleted successfully 
        * `401`: Not authorized
        * `403`: Forbidden - Admin access required
        * `404`: Movie not found

### 3. Reservas (**Reservations API**)

**GET** `/reservations/me`: Get all reservations for the current user
* **Corpo da Requisição:** `Authorization`: Bearer token (header).
    * **Respostas:**
        * `200`: User's reservations 
        * `401`: Not authorized 

**POST** `/reservations`: Create a new reservation
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `session`, `seats` (array de objetos com `row`, `number`, `type`), `paymentMethod`.
    * **Respostas:**
        * `201`: Reservation created successfully
        * `400`: Invalid input data or seats already taken 
        * `401`: Not authorized 
        * `404`: Session not found 

**GET** `/reservations`: Get all reservations (admin only)
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `page` (query), `limit` (query).
    * **Respostas:**
        * `200`: List of all reservations 
        * `401`: Not authorized 
        * `403`: Forbidden - Admin access required 

**GET** `/reservations/{id}`: Get a reservation by ID
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `id` (path).
    * **Respostas:**
        * `200`: Reservation details 
        * `401`: Not authorized 
        * `404`: Reservation not found 

**PUT** `/reservations/{id}`: Update reservation status (admin only)
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `id` (path), `status`, `paymentStatus`.
    * **Respostas:**
        * `200`: Reservation updated successfully 
        * `400`: Invalid status transition 
        * `401`: Not authorized 
        * `403`: Forbidden - Admin access required 
        * `404`: Reservation not found 

**DELETE** `/reservations/{id}`: Delete a reservation (admin only)
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `id` (path).
    * **Respostas:**
        * `200`: Reservation deleted successfully
        * `401`: Not authorized
        * `403`: Forbidden - Admin access required 
        * `404`: Reservation not found

### 4. Sessões (**Sessions API**)

**GET** `/sessions`: Get all movie sessions
* **Corpo da Requisição:** `movie` (query), `theater` (query), `date` (query), `limit` (query), `page` (query).
    * **Respostas:**
        * `200`: List of movie sessions

**POST** `/sessions`: Create a new session
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `movie`, `theater`, `datetime`, `fullPrice`, `halfPrice`.
    * **Respostas:**
        * `201`: Session created successfully
        * `400`: Invalid input data
        * `401`: Not authorized
        * `403`: Forbidden - Admin access required
        * `404`: Movie or Theater not found
        * `409`: Session conflict (time overlap)

**GET** `/sessions/{id}`: Get a session by ID
* **Corpo da Requisição:** `id` (path).
    * **Respostas:**
        * `200`: Session details with populated movie and theater
        * `404`: Session not found

**PUT** `/sessions/{id}`: Update a session
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `id` (path), `movie`, `theater`, `datetime`, `fullPrice`, `halfPrice`.
    * **Respostas:**
        * `200`: Session updated successfully
        * `400`: Invalid input data
        * `401`: Not authorized
        * `403`: Forbidden - Admin access required 
        * `404`: Session not found 
        * `409`: Session has reservations, cannot update 

**DELETE** `/sessions/{id}`: Delete a session
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `id` (path).
    * **Respostas:**
        * `200`: Session deleted successfully 
        * `401`: Not authorized 
        * `403`: Forbidden - Admin access required 
        * `404`: Session not found 
        * `409`: Cannot delete session with confirmed reservations 

**PUT** `/sessions/{id}/reset-seats`: Reset all seats in a session to available status
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `id` (path).
    * **Respostas:**
        * `200`: Seats reset successfully 
        * `401`: Not authorized 
        * `403`: Forbidden - Admin access required 
        * `404`: Session not found 

### 5. Configurações (**Setup Endpoints**)

**POST** `/setup/admin`: Create admin user (development only)
* **Corpo da Requisição:** `name`, `email`, `password`.
    * **Respostas:**
        * `201`: Admin user created successfully 
        * `400`: Invalid input data or user already exists 
        * `403`: Not available in production 

**POST** `/setup/test-users`: Create default test users (development only)
* **Corpo da Requisição:** Sem parâmetros.
    * **Respostas:**
        * `200`: Test users already exist 
        * `201`: Test users created successfully 
        * `403`: Not available in production 

### 6. Teatros (**Theaters API**)

**GET** `/theaters`: Get all theaters
* **Corpo da Requisição:** `type` (query), `sort` (query), `limit` (query), `page` (query).
    * **Respostas:**
        * `200`: List of theaters 

**POST** `/theaters`: Create a new theater
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `name`, `capacity`, `type`.
    * **Respostas:**
        * `201`: Theater created successfully 
        * `400`: Invalid input data 
        * `401`: Not authorized 
        * `403`: Forbidden - Admin access required 
        * `409`: Theater with that name already exists 

**GET** `/theaters/{id}`: Get a theater by ID
* **Corpo da Requisição:** `id` (path).
    * **Respostas:**
        * `200`: Theater details 
        * `404`: Theater not found 

**PUT** `/theaters/{id}`: Update a theater
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `id` (path), `name`, `capacity`, `type`.
    * **Respostas:**
        * `200`: Theater updated successfully 
        * `400`: Invalid input data 
        * `401`: Not authorized 
        * `403`: Forbidden - Admin access required 
        * `404`: Theater not found 
        * `409`: Theater name already in use 

**DELETE** `/theaters/{id}`: Delete a theater
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `id` (path).
    * **Respostas:**
        * `200`: Theater deleted successfully 
        * `401`: Not authorized 
        * `403`: Forbidden - Admin access required 
        * `404`: Theater not found 
        * `409`: Cannot delete theater with active sessions 

### 7. Usuários (**Users API**)

**GET** `/users`: Get all users
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `page` (query), `limit` (query), `role` (query).
    * **Respostas:**
        * `200`: List of users 
        * `401`: Not authorized 
        * `403`: Forbidden - Admin access required 

**GET** `/users/{id}`: Get a user by ID
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `id` (path).
    * **Respostas:**
        * `200`: User details 
        * `401`: Not authorized 
        * `403`: Forbidden - Admin access required 
        * `404`: User not found 

**PUT** `/users/{id}`: Update a user
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `id` (path), `name`, `email`, `role`.
    * **Respostas:**
        * `200`: User updated successfully 
        * `400`: Invalid input data 
        * `401`: Not authorized 
        * `403`: Forbidden - Admin access required 
        * `404`: User not found 
        * `409`: Email already in use 

**DELETE** `/users/{id}`: Delete a user
* **Corpo da Requisição:** `Authorization`: Bearer token (header), `id` (path).
    * **Respostas:**
        * `200`: User deleted successfully 
        * `401`: Not authorized 
        * `403`: Forbidden - Admin access required 
        * `404`: User not found 
        * `409`: Cannot delete user with active reservations 

### 8. Informações da API (**API Info**)

**GET** `/`: Get API information
* **Corpo da Requisição:** Sem parâmetros.
    * **Respostas:**
        * `200`: API information and available endpoints 

## 5. Casos de Teste

## 6. Riscos do Produto e Priorização

## 7. Testes Manuais com Postman

## 8. Testes Automatizados (Robot Framework)

## 9. Registro de Incidente (Bug Report)

## 10. Cobertura

## 11. Cronograma

| Atividade | Responsável | Início Estimado | Fim Estimado | Status |
| :--- | :--- | :--- | :--- | :--- |
| Confeccão do Plano de Teste | Wesley | 30/09/2025 | 01/10/2025 | Em Andamento |
| Análise inicial dos User Stories e Testes Exploratórios | Wesley | 01/10/2025 | 02/10/2025 | Tarefas Pendentes |
| Mapeamento dos endpoints e Casos de Teste | Wesley | 02/10/2025 | 03/10/2025 | Tarefas Pendentes |
| Riscos, Priorização e Testes Manuais com Postman | Wesley | 03/10/2025 | 06/10/2025 | Tarefas Pendentes |
| Testes Automatizados (Robot Framework) | Wesley | 05/10/2025 | 10/10/2025 | Tarefas Pendentes |
| Registro de Incidente e Relatório | Wesley | 08/10/2025 | 11/10/2025 | Tarefas Pendentes |

## 11. Histórico de uso de GenAI

Nesta seção irei catalogar todos os casos de uso de GenAI durante a confecção do plano de teste e execução dos testes, para referência posterior.

| Caso de Uso | Data | Usou arquivos complementares? | Precisou de correções? |
| :--- | :--- | :--- | :--- |
| Mapeamento dos endpoints | 01/09/2025 | SIM, swagger.pdf | SIM
