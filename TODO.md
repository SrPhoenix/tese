Remover tabelas de estado e fazer enums (remover FK primeiro) Half Done

Recriar o diagrama da db para mostrar ao stor

Alterar tipo das tabelas para byte

Fazer mais uma tabela para o histórico do preço das peças em inventário de cada dealership




----------------------------------- + ---------------------------------------

# Todo
Criar tabela vehicle type category DONE
Mudar DealershipVehiclePartType category para id (int) DONE
Alterar MaintenanceTasksType vehicle part type para vehicle part category DONE
Adicionar Vehicle type id to maintenance task (nullable) DONE
Adicionar vehicle type (nullable) no eval tasks e no maintenanceTasksType DONE


Adicionar maintenance task à purchase, caso este valor não esteja a null é necessário haver um estado após a validação do chefe de manutenção para o utilizador poder validar tbm DONE

Adicionar purchase id à delivery DONE

Criar task change que altera o vehicle type da tarefa DONE



Adicionar Um novo utilizador o administrador do sistema, irá criar e alterar tipos de tarefas
Adicionar começo de solicitação de compras por ultrapassar o threshold, após o fim da manutenção




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