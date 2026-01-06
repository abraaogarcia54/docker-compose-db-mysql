# Instalação WSL | Docker Desktop | Docker Compose MySQL - Sql-Server

Este repositório contém a instalação e verificação do WSL e do Docker Desktop e a criação de um **Docker Compose** para subir uma instância MySQL e Sql-Server para desenvolvimento.  
Inclui persistência de dados.

---

## ⚡ Pré-requisitos

* Windows 10/11 com WSL 2 habilitado
* Docker Desktop instalado (configurado para usar WSL 2)
* Docker Compose (vem junto com o Docker Desktop)

---

## 🛠️ Instalação do WSL no Windows

Verificar se o WSL 2 está instalado
Abra o PowerShell e rode:

```bash
wsl --list --verbose
```

* Se não houver distribuições listadas ou der erro, rode:

```bash
wsl --install
```

## Instalar o Docker Desktop

* [Download Docker Desktop](https://www.docker.com/products/docker-desktop/)
  
* Durante a instalação, marque a opção “Use WSL 2 instead of Hyper-V”

* Abra o Docker Desktop e aguarde ele inicializar.

---

## Testar o Docker

* No PowerShell, rode

```bash
docker run hello-world
```

## 🚀 Como iniciar o container

No terminal, dentro da pasta do projeto:

```bash
docker compose up -d
```

## 🧹 Como apagar os dados

Se quiser reiniciar o banco do zero, apague a pasta de dados:

```bash
rm -rf ./data/mysql
```

## 🚀 Comandos para importar bancos MySql
--- 

🟩 PASSO 1 — ir até a pasta onde está o backup

```bash
cd db_server/db_mysql
```
--- 

🟩 PASSO 2 — ver o nome do container MySQL

```bash
docker ps
```
---

🟩 PASSO 3 — copiar o arquivo para dentro do container

```bash
docker cp plots.sql db_mysql:/plots.sql
```
---

🟩 PASSO 4 — entrar no container

```bash
docker exec -it db_mysql bash
```
---

🟩 PASSO 5 — criar o banco (se ainda não existir)

```bash
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS plots;"
```
---

🟩 PASSO 6 — importar o backup

```bash
mysql -u root -p plots < /plots.sql
```
---

🟩 PASSO 7 — confirmar que importou

```bash
mysql -u root -p
```

