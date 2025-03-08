Remover tabelas de estado e fazer enums (remover FK primeiro) Half Done

Recriar o diagrama da db para mostrar ao stor

Alterar tipo das tabelas para byte

Fazer mais uma tabela para o histórico do preço das peças em inventário de cada dealership




----------------------------------- + ---------------------------------------

# Todo

Adicionar tabela vehicleType dos dealerships DONE
add step number in eval task DONE
Add notes to MechanicTasks DONE

Mudar FK das tabelas para ter um nome diferente da tabela DONE
Mudar Maintenance task id to guid DONE

mudar status para byte em vez de int DONE

Adicionar tabela maitenanceTaskStep

Deixar mudar sidebar


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