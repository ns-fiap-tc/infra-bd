# FIAP Tech Challenge - Infra banco de dados

Este é o repositório que contém códigos Terraform para gerenciar infraestrutura na nuvem da aplicação [Lanchonete App](https://github.com/ns-fiap-tc/tech_challenge_fiap). Nele você encontrará arquivos de configuração do Terraform que definem a infraestrutura que cria um banco de dados RDS Postgres na AWS de acordo com a infra-base.

## Passos para o provisionamento

> Para completo funcionamento da plataforma, é necessário seguir o seguinte fluxo de provisionamento:
>
> 1. A provisão do repositório da infra-base; [infra-base](https://github.com/ns-fiap-tc/infra-base)
> 2. A provisão deste repositório: [infra-bd](#como-rodar-o-projeto);
> 3. A provisão da aplicação principal e mock de pagamento em [tech_challenge_fiap](https://github.com/ns-fiap-tc/tech_challenge_fiap).
> 4. A provisão da lambda e api gateway: [lambda](https://github.com/ns-fiap-tc/lambda);

## 🚀 Como rodar o projeto

### 🤖 Via GitHub Actions
<details>
  <summary>Passo a passo</summary>

#### 📖 Resumo
Este repositório possui uma pipeline automatizada chamada `Terraform Deploy` que permite **provisionar a infraestrutura base na AWS automaticamente** sempre que houver um push na branch `main`.

A branch é protegida e só aceita alterações que venham de PRs previamente aprovadas.

> ⚠️ Apenas usuários com acesso ao repositório e às **GitHub Secrets** corretas conseguem utilizar esse fluxo.

#### 🔐 Pré-requisitos
Certifique-se de que as seguintes **secrets** estejam configuradas no repositório do GitHub (`Settings > Secrets and variables > Actions`):
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_SESSION_TOKEN` *(se estiver usando AWS Academy)*
- `TF_VAR_DB_USERNAME`
- `TF_VAR_DB_PASSWORD`

Essas variáveis são utilizadas pelo Terraform para autenticação e execução dos planos na AWS.

#### ⚙️ Etapas da pipeline `Terraform Deploy`
1. 🧾 **Checkout do código**: A action clona este repositório.
2. ⚒️ **Setup do Terraform**: Instala a ferramenta na máquina runner.
3. 📂 **Acesso ao diretório atual**: Todos os arquivos `.tf` são lidos da raiz do repositório.
4. 🔐 **Carregamento das variáveis sensíveis** via secrets.
5. 🧪 **Execução do `terraform init`**: Inicializa o backend e os providers.
6. 🚀 **Execução do `terraform apply`**: Cria ou atualiza a instância de banco de dados no Amazon RDS.

#### 🧭 Diagrama do fluxo

```mermaid
flowchart TD
    G[Push na branch main] --> A[Workflow: Terraform Deploy]

    subgraph Pipeline
        A1[Checkout do código]
        A2[Setup do Terraform]
        A3[Carrega Secrets da AWS e DB]
        A4[terraform init]
        A5[terraform plan]
        A6[terraform apply]
    end

    A --> A1 --> A2 --> A3 --> A4 --> A5 --> A6 --> RDS[Instância PostgreSQL no AWS RDS]
```

#### Benefícios desse fluxo
- 🤖 Automatização do deploy da infraestrutura base
- ✅ Redução de erros manuais
- 🔐 Segurança no uso de credenciais via GitHub Secrets
- 🔁 Reprodutibilidade garantida
- 💬 Transparência nos logs via GitHub Actions

</details>

### 💻 Localmente

<details>
  <summary>Passo a passo</summary>

#### Pré-requisitos

Antes de começar, certifique-se de ter os seguintes itens instalados e configurados em seu ambiente:

1. **Terraform**: A ferramenta que permite definir, visualizar e implantar a infraestrutura de nuvem.
2. **AWS CLI**: A interface de linha de comando da AWS.
3. **Credenciais AWS válidas**: Você precisará de uma chave de acesso e uma chave secreta para autenticar com a AWS (no momento, o repositório usa chaves e credenciais fornecidas pelo [AWS Academy](https://awsacademy.instructure.com/) e que divergem de contas padrão). Tais credenciais devem ser inseridas no arquivo `credentials` que fica dentro da pasta `.aws`

## Como usar

1. **Clone este repositório**:

```bash
git clone https://github.com/ns-fiap-tc/infra-bd
```

2. **Acesse o diretório do repositório**:

```bash
cd infra-bd
```

3. **Defina as variáveis necessárias ao nível de ambiente, criando um arquivo `.env` de acordo com o arquivo `.env.exemplo`. Exemplo:**:

```bash
DB_USERNAME="meu-usuario"
DB_PASSWORD="minha-senha"
DB_NAME="meu-banco-dados"
DB_PORT="1234"
DB_IDENTIFIER="id-meu-banco"
VPC_NAME="minha-vpc"
CLUSTER_NAME="meu-cluster"
```

4. **Inicialize o diretório Terraform**:

```bash
terraform init
```

5. **Visualize as mudanças que serão feitas**:

```bash
./terraform.sh plan
```

6. **Provisione a infraestrutura**:

```bash
./terraform.sh apply -auto-approve
```

7. **Para destruir a infraestrutura provisionada**:

```bash
./terraform.sh destroy -auto-approve
```

</details>

## ✨ Contribuidores

- Guilherme Fausto - RM 359909
- Nicolas Silva - RM 360621
- Rodrigo Medda Pereira - RM 360575
