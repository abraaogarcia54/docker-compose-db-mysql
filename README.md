# Docker MySQL - db_mysql

Este repositório contém um **Docker Compose** para subir uma instância MySQL (`db_mysql`) para desenvolvimento.  
Inclui persistência de dados, mas é possível apagar os dados para reiniciar o banco do zero.

---

## ⚡ Pré-requisitos

- Docker instalado
- Docker Compose instalado

---

## 🧹 Como apagar os dados

Se quiser reiniciar o banco do zero, apague a pasta de dados:

```bash
rm -rf ./data/mysql

```
## 🚀 Como iniciar o container

No terminal, dentro da pasta do projeto:

```bash
docker compose up -d


