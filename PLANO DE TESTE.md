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

## 9. Registro de Incidente (Bug Report)

## 10. Cobertura

## 11. Cronograma

| Atividade | Responsável | Início Estimado | Fim Estimado | Status |
| :--- | :--- | :--- | :--- | :--- |
| Confeccão do Plano de Teste | Wesley | 30/09/2025 | 01/10/2025 | Concluído |
| Análise inicial dos User Stories e Testes Exploratórios | Wesley | 01/10/2025 | 02/10/2025 | Concluído |
| Mapeamento dos endpoints e Casos de Teste | Wesley | 02/10/2025 | 03/10/2025 | Concluído |
| Riscos, Priorização e Testes de API com Postman | Wesley | 03/10/2025 | 06/10/2025 | Concluído |
| Testes Automatizados (Robot Framework) | Wesley | 05/10/2025 | 10/10/2025 | Em Andamento |
| Registro de Incidente e Relatório | Wesley | 08/10/2025 | 11/10/2025 | Tarefas Pendentes |

## 12. Histórico de uso de GenAI

Nesta seção irei catalogar todos os casos de uso de GenAI durante a confecção do plano de teste e execução dos testes, para referência posterior.

| Caso de Uso | Data | Arquivos Complementares | Precisou de correções? |
| :--- | :--- | :--- | :--- |
| Mapeamento dos endpoints | 01/09/2025 | swagger.pdf | SIM
| Mapeamento dos casos de teste dos endpoints | 02/09/2025 | swagger.pdf, USER STORIES.md, PLANO DE TESTE.md | SIM
| Desenvolvimento dos testes de API no Postman | 03/09/2025 | swagger.pdf, test-cases.md, PLANO DE TESTE.md, mapeamento-endpoints.md | SIM
