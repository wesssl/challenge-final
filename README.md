# challenge-final

Challenge final. Projeto desenvolvido para a conclusão do Programa de Bolsas da empresa Compass UOL. Trilha "AWS, AI & Software Quality Engineering".


[PLANO DE TESTE](PLANO%20DE%20TESTE.md)


---

## Informações de Execução

Esta seção detalha os pré-requisitos e os comandos necessários para executar os testes automatizados do projeto utilizando o **Robot Framework**.

### Pré-requisitos e Instalação

[Front do Projeto](https://github.com/juniorschmitz/cinema-challenge-front)

[Back do Projeto](https://github.com/juniorschmitz/cinema-challenge-back)

Para rodar os testes, você precisa ter o **Python** (versão 3.6 ou superior) e o **Pip** (gerenciador de pacotes do Python) instalados em sua máquina.

Em seguida, instale as bibliotecas e dependências necessárias para a automação de API e Web.

```bash
# Instala o Robot Framework
pip install robotframework

# Instala a biblioteca para testes de API
pip install robotframework-requests

# Instala a biblioteca para testes Web (Selenium)
pip install robotframework-seleniumlibrary

```

### Como Executar os Testes

É importante dar **Run nos Seeds do projeto**, como ensinado no seu `README.md`. Os dados criados serão usados nos testes

```bash
node src/utils/seedData.js
node src/utils/seedMoreMovies.js
node src/utils/seedSessions.js
```

Utilize os comandos a seguir no terminal para executar os testes. O comando -d especifica o diretório onde os arquivos de log e relatórios serão salvos.

```bash
# Executa os testes de API e salva os logs na pasta 'logs_api'
robot -d logs/logs_api api_test.robot

# Executa os testes Web e salva os logs na pasta 'logs_web'
robot -d logs/logs_web web_test.robot
```