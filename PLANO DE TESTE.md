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

---

## 4. Mapeamento dos Endpoints

Durante o mapeamento, fiz um mapa-mental a mão para me familiarizar com a API. Após esse mapeamento, fiz um novo mapeamento através de AI Generativa usando o próprio Swagger da aplicação em .pdf para melhor organização no plano de teste.

[Mapeamento dos Endpoints](mapeamento-endpoints.md)

---

## 5. Casos de Teste

Nessa seção irei mapear os casos de teste referentes a cada uma das possíveis respostas da API.

[Casos de teste](test-cases.md)

---

## 6. Riscos do Produto e Priorização

Com base nos User Stories e no cronograma disposto, aqui analisarei os riscos e a priorização dos casos de teste, focando nos fluxos mais críticos para o negócio.

[Priorização dos Casos de Teste](priorizacao-teste.md)

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



## 7. Testes de API com Postman

Realizei os testes manuais e automatizados para os endpoints da API, com foco nos casos de teste de alta prioridade definidos no meu plano. Para isso, utilizei o Postman como principal ferramenta de execução.

A execução dos testes de alta prioridade foi concluída com sucesso, validando a funcionalidade e a estabilidade dos principais fluxos de negócio da aplicação. Os resultados confirmaram que a API está se comportando como esperado, com respostas e códigos de status corretos em cenários de sucesso e de falha.

[Report: Testes de API de Alta Prioridade](Postman/CinemaApp_HighPriority_Report.json)

---

## 8. Testes Automatizados (Robot Framework)

Para garantir a estabilidade do sistema em futuras atualizações e sprints, as funcionalidades de alto risco e os happy paths serão automatizados. A automação será desenvolvida utilizando o **Robot Framework**, que permite a criação de testes de API legíveis e de fácil manutenção.

O foco inicial da automação será o fluxo principal de reserva da aplicação, que foi identificado como de alta prioridade. 

**Os casos de teste que foram automatizados são**:

* Automação de testes de API:

    * `CT-AUTH-001`: Testar o cadastro de um novo usuário com dados válidos.

    * `CT-AUTH-003`: Testar o login de um usuário com credenciais válidas.

    * `CT-MOVIES-001`: Testar a listagem de todos os filmes sem filtros.

    * `CT-MOVIES-006`: Testar a obtenção de detalhes de um filme por ID válido.

    * `CT-SESSIONS-001`: Testar a listagem de todas as sessões de filmes.

    * `CT-SESSIONS-008`: Testar a obtenção de detalhes de uma sessão por ID válido.

    * `CT-RESERVATIONS-002`: Testar a criação de uma nova reserva com dados válidos.

    * `CT-RESERVATIONS-003`: Testar a criação de uma reserva com dados inválidos ou assentos já ocupados.

    * `CT-API-INFO-001`: Testar a obtenção de informações gerais da API.

* Automação Web (Front-end)

    * `CT-WEB-AUTH-001`: Testar o cadastro de um novo usuário com dados válidos.

    * `CT-WEB-AUTH-003`: Testar o login com credenciais válidas.

    ```bash
    * `CT-WEB-MOVIE-001`: Testar a exibição da página inicial.

    * `CT-WEB-MOVIE-002`: Testar a navegação da lista de filmes.

    * `CT-WEB-MOVIE-003`: Testar a exibição da página de detalhes do filme e acesso à seleção de assentos.

    * `CT-WEB-RESERVE-001`: Testar a seleção de assentos disponíveis.

    * `CT-WEB-RESERVE-003`: Testar o processo de checkout e finalização da compra.

    * `CT-WEB-NAV-001`: Testar a navegação do cabeçalho em todas as páginas.
    ```

## 9. Registro de Incidente (Bug Report)

### [Report de Bugs](report.md)

Para o registro de bugs, utilizaremos a seguinte padronização:

### `Código do Bug`

**ID do Incidente**: `Sequencial e Único`

**Título**: `Resumo conciso do bug, ex: "Falha ao logar com credenciais válidas"`

**Ambiente**: `Desenvolvimento, Staging, Produção`

**Prioridade**: `Crítica, Alta, Média, Baixa`

**Severidade**: `Crítica, Alta, Média, Baixa`

**Prioridade**: `Alta, Média, Baixa`

**Descrição**:
`Detalhes do problema, incluindo o comportamento inesperado do sistema.`

**Passos para Reproduzir**:
`Lista numerada e clara de como reproduzir o bug, ex: "1. Acessar a página de login. 2. Inserir credenciais válidas. 3. Clicar em Entrar."`

**Resultado Esperado**:
`O que a aplicação deveria fazer, ex: "O usuário deve ser redirecionado para a página inicial."`

**Resultado Real**:
`O que a aplicação realmente fez, ex: "O sistema exibe uma mensagem de erro: 'Invalid credentials'."`

**Evidências**:
`Anexar capturas de tela, vídeos ou logs do console para ajudar na análise.`

## 10. Cobertura


### 1. Cobertura de Endpoints da API
Esta métrica mostra quantos dos endpoints de API foram cobertos por pelo menos um caso de teste.

* Total de Endpoints de API Documentados: `30`

* Endpoints Cobertos pelo Plano de Testes (virtualmente): `30`

* Porcentagem de Cobertura Virtual: `(30 / 30) * 100 = 100%`

* Endpoints Cobertos nos testes de Prioridade Alta (executados): `9`

### Porcentagem de Cobertura de testes de API de Prioridade Alta: `(9 / 30) * 100 = 30%`

### 2. Cobertura de Testes Web
Aqui estão as métricas de cobertura específicas para os seus testes web.

* Total de Histórias de Usuário / Funcionalidades We `12`

* Funcionalidades Cobertas nos testes (virtualmente): `9`

* Porcentagem de Cobertura Virtual: `(9 / 12) * 100 = 75% `

* Histórias de Usuário / Funcionalidades Cobertas nos testes de Prioridade Alta (executados): `2`

* Casos de Teste de Prioridade Alta (executados): `17`

### Porcentagem de Cobertura de Testes de Web de Prioridade Alta: `(2 / 17) * 100 = 12%`

## 11. Cronograma

| Atividade | Responsável | Início Estimado | Fim Estimado | Status |
| :--- | :--- | :--- | :--- | :--- |
| Confeccão do Plano de Teste | Wesley | 30/09/2025 | 01/10/2025 | Concluído |
| Análise inicial dos User Stories e Testes Exploratórios | Wesley | 01/10/2025 | 02/10/2025 | Concluído |
| Mapeamento dos endpoints e Casos de Teste | Wesley | 02/10/2025 | 03/10/2025 | Concluído |
| Riscos, Priorização e Testes de API com Postman | Wesley | 03/10/2025 | 06/10/2025 | Concluído |
| Testes Automatizados (Robot Framework) | Wesley | 05/10/2025 | 10/10/2025 | Concluído |
| Registro de Incidente e Relatório | Wesley | 08/10/2025 | 11/10/2025 | Concluído |

## 12. Histórico de uso de GenAI

Nesta seção irei catalogar todos os casos de uso de GenAI durante a confecção do plano de teste e execução dos testes, para referência posterior.

| Caso de Uso | Data | Arquivos Complementares | Precisou de correções? |
| :--- | :--- | :--- | :--- |
| Mapeamento dos endpoints | 01/09/2025 | swagger.pdf | SIM
| Mapeamento dos casos de teste dos endpoints | 02/09/2025 | swagger.pdf, USER STORIES.md, PLANO DE TESTE.md | SIM
| Desenvolvimento dos testes de API no Postman | 03/09/2025 | swagger.pdf, test-cases.md, PLANO DE TESTE.md, mapeamento-endpoints.md | SIM
