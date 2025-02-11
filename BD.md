# Tarefas

## Avaliação 

Tarefas para concluir -> Histórico do veículo + Notas do Cliente -> Indicar ações para fazer sobre o veículo -> Peças que precisam de ser substituidas (indicar razão)  -> Peças Necessárias 

## Mudar Peças

Tarefas para concluir 
    -> Peças Necessárias
    -> Peças para ser substituidas

## Manutenção + Controlo de qualidade
 
Tarefas para concluir 


# Histórico do Veículo

## Ficha técnica
Motor
quadro
...

## Outros Dados
Data da última manutenção
kilómetros percorridos desde a ultima manutenção


# Tabelas

## Manutenção

ID do Cliente (FK)  (PK)
ID da Entidade (FK) (PK) 
Matrícula do Veículo (FK) (PK)
Data de Criação
Data da avaliação
Data de Conclusão Esperada
Data de Conclusão
Data de Entrega
Orçamento Esperado
Orçamento
Lista de Tarefas da Avaliação
Lista de Tarefas a Realizar
Lista de Tarefas Realizadas
Notas do Cliente
Avaliação esperada do Cliente
Avaliação do Serviço do Cliente
Número de Horas Esperado
Número de Horas do Serviço



## Tarefas da Avaliação
Id
Nome
Descrição

### Nome
Verificar Apertos
Verificar níveis dos pneus
Verificar o óleo
...



## Tarefas da Manutenção
Id
Nome 
Preço 
Horas

### Nome                                             
Mudança de óleo                 
Apertar os parafusos            
Encher pneus                    
...

## Tarefas do mecânico
Id do mecânico
Id do tipo de tarefa
Id da manutenção
Datetime do trabalho


## Peças
Id
Nome
Data de aquisição
...

## Pedido de Compras
Id
Nome do funcionário
Estado (Pending, Aproved, Disapproved)

## Alteração na manutenção
id da manutenção
Data de Criação
tipo (orçamento, data de conclusão)
novo orçamento
nova data de conclusão