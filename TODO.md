Remover tabelas de estado e fazer enums (remover FK primeiro) Half Done

Recriar o diagrama da db para mostrar ao stor

Alterar tipo das tabelas para byte

Fazer mais uma tabela para o histórico do preço das peças em inventário de cada dealership




----------------------------------- + ---------------------------------------

# Todo - Semana 10/03-16/03

Adicionar tabela maitenanceTaskStep DONE
    - MaintenanceTaskType PK
    - Step Num PK
    - Nome
    - Descrição



Criar Use Case criar utilizadores DONE

Alterar página inicial do chefe de oficina e do rececionista para ser como a criação de horários do paco2


Implementar finalização dos detalhes da manutenção


# Todo - Semana 17/03-23/03

Compras e visualização do stock do warehouse manager

Autorização de compras no workshop manager

# TDO - semana 24-30

Implementar Criação de clientes
Implementar Criar utilizadores no Warehouse manager






# Caso De uso 
## Validação de stock
Verifica o número de peças em stock consoante se estão a cima de um threshold

Acontece:
- Após uma manutenção

## Verifica se a peça existe
Acontece:
- Após manutenção passa para o estado 3 (Aguardar manutenção)
- Após maintenance change



# Dúvidas
Pergunta, durante a manutenção um mecânico descobre um problema?