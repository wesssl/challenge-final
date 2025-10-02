# Mapeamento dos Endpoints

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