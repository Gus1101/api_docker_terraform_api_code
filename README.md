# O projeto mais simples do mundo para aprender sobre API, Docker e Terraform

Este projeto foi criado com o objetivo de ser uma introdução prática aos conceitos de **API com FastAPI**, **Docker** e **Infraestrutura como Código com Terraform**.

---

## 📁 Estrutura

A estrutura de pastas do projeto é a seguinte:

```text
api_docker_terraform_api_code/
├── Dockerfile
├── infra_aws.tf
├── requirements.txt
└── src/
    └── backend/
        └── fake_api/
            └── fake_api_data.py
```

- O arquivo `Dockerfile` contém as instruções para construir a imagem Docker da aplicação.
- O `requirements.txt` define as dependências do projeto, como `fastapi`, `faker`, `uvicorn`, entre outras.
- O `infra_aws.tf` contém a configuração de infraestrutura como código (IaC) utilizando Terraform, criando uma rede VPC e uma instância EC2 (`t2.micro`).
- O diretório `src/backend/fake_api/` contém o código da API. O arquivo `fake_api_data.py` é responsável pelos endpoints da aplicação.

---

## ✅ Requisitos

Para executar este projeto no seu ambiente local, é necessário ter instalado:

- [Docker](https://www.docker.com/)
- [Terraform](https://www.terraform.io/)
- Uma conta válida na [AWS](https://aws.amazon.com/)

Vídeos úteis:
- 📦 Instalação do Docker: [Link de vídeo](https://www.youtube.com/watch?v=Lgh8JgcYFwM&pp=ygUTZG9ja2VyIGluc3RhbGHDp8Ojbw%3D%3D)
- 🏗️ Instalação do Terraform: [Link de vídeo](https://www.youtube.com/watch?v=bSrV1Dr8py8&pp=ygUedGVycmFmb3JtIGluc3RhbGHDp8OjbyB3aW5kb3dz)
- ☁️ Criação de conta na AWS: [Link de vídeo](https://www.youtube.com/watch?v=JM_hBTrt9bk&pp=ygUJYXdzIGNvbnRh)

Claramente é mais fácil pedir ajuda ao GPT. Porém, caso goste de vídeos, fique a vontade.

---

## 🚀 Passo a passo

### 1. Clone o repositório

```bash
git clone https://github.com/Gus1101/api_docker_terraform_api_code
cd api_docker_terraform_api_code
```

### 2. Construa a imagem Docker da aplicação (opcional, caso queira testar localmente)

```bash
docker build -t fake-api .
docker run -p 8000:8000 fake-api
```

### 3. Provisione a infraestrutura com o Terraform

Certifique-se de que suas credenciais AWS estão configuradas corretamente (`aws configure`).

```bash
terraform init
terraform apply
```

Durante a execução, o Terraform solicitará confirmação. Após a criação, será exibido o **IP público da instância EC2**.

---

## 🌐 Acessando a API

Com a instância EC2 em execução, acesse os seguintes endpoints no navegador ou via Postman:

- Listar dados de cliente fictício:

  ```text
  http://<ip_publico_da_ec2>:8000/customer/data
  ```

- Listar múltiplos registros:

  ```text
  http://<ip_publico_da_ec2>:8000/customer/data/<quantidade>
  ```

  Exemplo:

  ```text
  http://<ip_publico_da_ec2>:8000/customer/data/5
  ```

---

## 🧹 Destruir a infraestrutura

Quando terminar, destrua os recursos criados para evitar cobranças na AWS:

```bash
terraform destroy
```

---

## 🛠️ Tecnologias usadas

- [FastAPI](https://fastapi.tiangolo.com/)
- [Docker](https://www.docker.com/)
- [Terraform](https://www.terraform.io/)
- [AWS EC2](https://aws.amazon.com/ec2/)
- [Faker](https://faker.readthedocs.io/en/master/)

---

## 📌 Observações

Este é um projeto educacional. Use com responsabilidade e verifique as configurações de segurança na AWS antes de disponibilizar publicamente qualquer API.

---

## ✨ Autor

Desenvolvido por [@Gus1101](https://github.com/Gus1101)
