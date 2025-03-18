Remover tabelas de estado e fazer enums (remover FK primeiro) Half Done

Recriar o diagrama da db para mostrar ao stor

Alterar tipo das tabelas para byte

Fazer mais uma tabela para o histórico do preço das peças em inventário de cada dealership




----------------------------------- + ---------------------------------------
 
# Todo - Semana 10/03-16/03


Implementar finalização dos detalhes da manutenção

Fazer avaliação do veículo
- Adicionar search de partes por categoria DONE
- Apenas meter vehicle part type select quando a task tem vehicletypepart DONE
- Enviar tarefas para criar para o backend DONE
- Adicionar parte à tarefa para o backend DONE
- Ficha tecnica do veículo dinamica DONE


# Todo - Semana 17/03-23/03

Compras e visualização do stock do warehouse manager

Autorização de compras no workshop manager

# TDO - semana 24-30

Implementar Criação de clientes
Implementar Criar utilizadores no Warehouse manager


# TODO 

Meter modal full screen sem diminuires
resolver layout
resolver log out
Change maintenance task type hours para float em vez de int
DealershipVehiclePartTypes naviagtion category


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