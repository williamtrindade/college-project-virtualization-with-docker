# Infraestrutura Docker com Apache para Backend e Frontend
___

## Requisitos do trabalho
- Colocar o seu de POOW1 no GitHub. Pode ser também qualquer outro projeto passado de outra disciplina desde que tenha uma interface Web e Banco de Dados.
- O projeto em si não será objeto de avaliação, apenas o seu funcionamento no ambiente virtualizado.
- Escrever um Dockerfile para build de uma imagem para clonar o projeto do GitHub, compilar o projeto e instalar todos os módulos necessários para sua execução.
- Expor o serviço na porta 8080, bem como os logs do servidor em um volume que pode ser acessado no SO Host.
- Colocar o comando correto para inicialização do projeto no ENTRYPOINT.
- Criar um docker-compose.yml também para facilitar o processo de build-deploy da aplicação.
- Entregar os códigos, juntamente com um vídeo (ou link para o vídeo) demonstrando o funcionamento.
___
## System Design
<img width="1444" alt="shapes at 25-06-30 01 57 13" src="https://github.com/user-attachments/assets/63e37054-6424-43a1-a330-dc20b48b885d" />

___
## Aplicação Finfood

![image](https://github.com/user-attachments/assets/3d28028b-bf90-443c-9792-bfca841fa311)
___
Esta configuração utiliza containers Apache separados para o backend (Laravel) e o frontend (Vue.js), proporcionando uma arquitetura robusta e com separação de responsabilidades.
___
## Pré-requisitos

Para executar este projeto, certifique-se de que tem os seguintes softwares instalados na sua máquina:

* [**Docker**](https://www.docker.com/products/docker-desktop/)
* [**Docker Compose**](https://docs.docker.com/compose/install/) (geralmente já vem incluído no Docker Desktop)
* **Git**

## Como Executar

Siga estes passos simples para ter toda a aplicação a funcionar.

### Passo 1: Clone este Repositório (Infraestrutura)

Clone este repositório para a sua máquina local.

```bash
git clone https://github.com/williamtrindade/college-project-virtualization-with-docker
cd college-project-virtualization-with-docker
```

### Passo 2: Crie o .env de Configuração do Ambiente

Este passo é **obrigatório**. Copie o ficheiro de exemplo `.env.example` para criar o seu ficheiro `.env`. É este ficheiro que o Docker Compose irá usar para configurar os serviços.

```bash
cp .env.example .env
```

### Passo 3: Construa e Execute a Aplicação


```bash
docker-compose up --build -d
```


## Acesso à Aplicação

Assim que o comando terminar, a aplicação estará disponível nos seguintes endereços:

* **Frontend (Aplicação Vue.js):** http://localhost:8080
* **Backend (API Laravel):** http://localhost:8081
