

# Terraform import - Usando o import block

- Essa feature foi adicionada a partir da versão 1.5 do terraform e tem como objetivo facilitar a vida para importar recursos existentes na sua cloud.

### Vantagens

- Pode-se fazer vários imports de uma só vez adicionando blocos com as referências para os IDs dos recursos:

```

import {
    to = aws_instance.import_1
    id = "i-045cf5c99fe04c199"
}

import {
    to = aws_instance.import_2
    id = "i-045cf5c99fe04c123"
}

import {
    to = aws_s3_bucket.my_bkt
    id = "tst-bkt-in-my-account"
}

```

### Desvantagens - Nem tudo são flores

-É preciso ficar atento aos elementos que são importados e exportados para o arquivo ".tf", pois pode apresentar atributos que serão apenas conhecidos em tempo de execução. 


## Passo a passo

1. Criar arquivo "imports.tf"

2. Incluir nesse arquivo os blocos de import referenciando os recursos nos qual desejam-se importar.

3. Executar os comandos do terraform para obter ao final o um arquivo com o terraform do recurso gerado e também o respectivo "tfstate".

```
# Realiza init
> terraform init

# Realiza o plan para gerar um arquivo de saída com o código do recurso
> terraform plan -generate-config-out="generated.tf"

# Realiza o validate
> terraform validate

# Refaz o plan
> terraform plan

# Realiza o apply para obter o tfstate da sua infra da aws.
> terraform apply 
```