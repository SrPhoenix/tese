Remover tabelas de estado e fazer enums (remover FK primeiro) Half Done

Recriar o diagrama da db para mostrar ao stor

Alterar tipo das tabelas para byte

Fazer mais uma tabela para o histórico do preço das peças em inventário de cada dealership




----------------------------------- + ---------------------------------------

# Todo


Adicionar Um novo utilizador o administrador do sistema, irá criar e alterar tipos de tarefas
Adicionar começo de solicitação de compras por ultrapassar o threshold, após o fim da manutenção

Adicionar tabela vehicleType dos dealerships
add step number in eval task
Add notes to MechanicTasks

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