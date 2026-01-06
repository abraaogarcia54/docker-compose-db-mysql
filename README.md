# Docker MySQL - db_mysql

Este repositório contém um **Docker Compose** para subir uma instância MySQL (`db_mysql`) para desenvolvimento.  
Inclui persistência de dados, mas é possível apagar os dados para reiniciar o banco do zero.

---

## ⚡ Pré-requisitos

* Windows 10/11 com WSL 2 habilitado
* Docker Desktop instalado (configurado para usar WSL 2)
* Docker Compose (vem junto com o Docker Desktop)

---

## 🛠️ Instalação no Windows

Verificar se o WSL 2 está instalado
Abra o PowerShell e rode:

```bash
wsl --list --verbose
```

* Se não houver distribuições listadas ou der erro, rode:

```bash
wsl --install
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
