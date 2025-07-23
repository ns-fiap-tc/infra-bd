#!/bin/bash

# Carrega as variáveis do arquivo .env
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "[terraform] Erro: Arquivo .env não encontrado."
    exit 1
fi

# Verifica se o método foi passado como argumento
if [ -z "$1" ]; then
    echo "[terraform] Erro: Nenhum método especificado (plan, apply, etc.)."
    exit 1
fi

METHOD=$1
shift

PARAMS="$@"

terraform $METHOD $PARAMS \
-var "aws_region=$AWS_REGION" \
-var "db_lanchonete_username=$DB_LANCHONETE_USERNAME" \
-var "db_lanchonete_password=$DB_LANCHONETE_PASSWORD" \
-var "db_lanchonete_identifier=$DB_LANCHONETE_IDENTIFIER" \
-var "db_lanchonete_name=$DB_LANCHONETE_NAME" \
-var "db_categoria_username=$DB_CATEGORIA_USERNAME" \
-var "db_categoria_password=$DB_CATEGORIA_PASSWORD" \
-var "db_categoria_identifier=$DB_CATEGORIA_IDENTIFIER" \
-var "db_categoria_name=$DB_CATEGORIA_NAME" \
-var "db_produto_username=$DB_PRODUTO_USERNAME" \
-var "db_produto_password=$DB_PRODUTO_PASSWORD" \
-var "db_produto_identifier=$DB_PRODUTO_IDENTIFIER" \
-var "db_produto_name=$DB_PRODUTO_NAME" \
-var "db_pagamento_username=$DB_PAGAMENTO_USERNAME" \
-var "db_pagamento_password=$DB_PAGAMENTO_PASSWORD" \
-var "db_pagamento_name=$DB_PAGAMENTO_NAME" 