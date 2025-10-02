# Casos de Teste

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