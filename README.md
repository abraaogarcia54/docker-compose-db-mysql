# Instalação WSL | Docker Desktop | Docker Compose MySQL - Sql-Server

Este repositório contém a instalação e verificação do WSL e do Docker Desktop e a criação de um **Docker Compose** para subir uma instância MySQL e Sql-Server para desenvolvimento.  
Inclui persistência de dados.

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

## Instalar o Docker Desktop

* [Download Docker Desktop](https://www.docker.com/products/docker-desktop/)
  
* Durante a instalação, marque a opção “Use WSL 2 instead of Hyper-V”

* Abra o Docker Desktop e aguarde ele inicializar.


## 🚀 Como iniciar o container

No terminal, dentro da pasta do projeto:

```bash
docker compose up -d
```

## 🧹 Como apagar os dados

Se quiser reiniciar o banco do zero, apague a pasta de dados:

```bash
rm -rf ./data/mysql
