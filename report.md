## Report de Bugs

** Relatório de Bugs ** 

* BUG-001

    * ID do Incidente: `CT-AUTH-004`

    * Título: `Falha ao fazer login com credenciais inválidas`

    * Prioridade: `Baixa`

    * Severidade: `Baixa`

    * Descrição: `O teste CT-AUTH-004, que visava testar o login com credenciais inválidas, falhou.`

    * Passos para Reproduzir:

        `O teste tentou fazer login com credenciais inválidas (login_invalid).`

    * Resultado Esperado: `O sistema deveria retornar um status code 400.`

    * Resultado Real: `O sistema retornou o status code 401 (Unauthorized), indicando que o endpoint de login não estava validando corretamente a requisição.`

    * Evidências: `Log do Robot Framework e Relatório do Robot Framework.`

* BUG-002

    * ID do Incidente: `CT-AUTH-007`

    * Título: `Falha ao obter informações do usuário com token inválido`

    * Prioridade: `Baixa`

    * Severidade: `Baixa`

    * Descrição: `O teste CT-AUTH-007, que tentava obter informações do usuário usando um token inválido (token_wrong), falhou.`

    * Passos para Reproduzir:

        `O teste tentou acessar o endpoint /auth/me com um token inválido.`

    * Resultado Esperado: `O sistema deveria retornar um status code 403 (Forbidden).`

    * Resultado Real: `O sistema retornou o status code 401 (Unauthorized).`

    * Evidências: `Log do Robot Framework e Relatório do Robot Framework`.

## Resumo da Execução

Um total de 13 testes foram executados, resultando em 11 aprovados e 2 falhas. O tempo total de execução foi de 4 segundos.