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


# Eval Tasks
- Normal
- Troca de peças
- Controlo de qualidade


# Steps

## Step 1 - Criar manutenção
criar maintenance:
- Client Id
- Dealership Id
- Entity Id (Se aplicável)
- Vehicle Id
- Created Date
- Eval Date
- Notas do Cliente (Se aplicável)
- StatusId : 0  (aguardar avaliação)
- Adicionar uma Maintenance Task
    - MaintenanceTaskTypeId : Type -> Avaliação
    - Status : 1 (Aguardar Atribuição)


## Step 2 - Atribuir tarefa de avaliação
Chefe de oficina é notificado que existe uma Maintenance Task no estado 1 e cria uma nova MechanicTask:
- Maintenance Task ID
- Mechanic ID
- Start Date Expected
- End Date Expected

## Step 3 - Avaliação
O Mecânico responsável pela avaliação vê uma tarefa do tipo avaliação para fazer. Esta tarefa consiste:
- Num conjunto de passos, em que cada passo é uma eval task especifica para aquele tipo de veiculo com um conjunto de tipos de tarefas associadas. Alguns exemplos de passos: Troca de peças, Limpeza, Controlo de Qualidade
- Tendo acesso às notas do cliente e ao ver o estado do veículo, o mecânico adiciona as tarefas que acha pertinentes à manutenção com as partes dos veículos necessárias (se aplicável) e com o estado 0 (Aguardar Aprovação)
- Ao terminar a tarefa o estado da manutenção muda para 1 (aguardar aprovação)

## Step 4 - Aprovação
O recepcionista recebe notificação que a avaliação acabou e:
- Define Data De conclusão esperada
- Invalida tarefas (muda para o estado 2) que o cliente não quer (Se aplicável) 
- Define um orçamento esperado (Pré Calculado pela soma do preço das tarefas [Preço das tarefas Preço * Horas + Preço do vehiclePartType])
- Define Número de Horas Esperadas
- Define o resultado do teste de qualidade esperada pelo cliente
- Altera o estado da manutenção para 2 (Aguardar manutenção)
- Altera as tarefas da manutenção no estado 1 (Aguardar Aprovação) para o estado 2 (Aguardar Atribuição)


## Step 5 - Atribuir tarefas de manutenção
Chefe de oficina é notificado que existe uma ou várias tarefas no estado 1 e cria uma nova MechanicTask, alterando a tarefa para o estado 3 (Atribuída):
- Maintenance Task ID
- Mechanic ID
- Start Date Expected
- End Date Expected


## Step 6 - (Optional) Comprar Peças
Condições:
- Existem tarefas para substituir peças que não existem em stock ou o número de peças ultrapassou o threshold

É automaticamente gerado um alerta para o operador de armazém que existem peças em falta. O operador cria uma nova Purchase com:
- Uma data de criação
- O seu Id (Id do operador)
- O estado 0 (Aguardar Aprovação)
- o dealership Id
- Razão (Por a peça não existir em stock, por exemplo)
- Um conjunto de Purchase Details por cada tipo de parte de veículo com:
    - um número de peças
    - O preço do conjunto
    - O Id do tipo de peça
    - A data esperada da entrega
- O preço total da compra calculado pela soma do preço dos conjuntos

## Step 7 - (Optional) Autoriza compra
Condições:
- Ocorreu o passo 6

O chefe da oficina foi notificado que existe uma nova compra por validar e valida:

- Alterando o estado da compra para o estado 1 (válido)
- Alterando o estado da compra para o estado 2 (inválido)

Se a purchase tiver uma manutenção associada, vai para o passo 8


## Step 8 - (Optional) Pedir Autorização ao cliente
Condições:
- Nova maintenance change com as seguintes causas possiveis:
    - Nova tarefa adicionada (Novo budget com possivel nova data de conlusão)
    - Data que a peça chega é superior à data de realizar a tarefa 
    Passos:
        - O recepcionista altera a maintenance change status para 3 (Aprovada) ou 2 (Inválida)

- Nova maintenance task change com as seguintes causas possiveis:
    - Alteração de uma parte de uma tarefa (Novo budget com possivel nova data de conlusão)
    Passos:
        - O recepcionista altera a maintenance task change status para 3 (Aprovada) ou 2 (Inválida)

## Step 9 - (Optional) Comprar peças parte 2
O operador regista em cada purchase details:
- A data da compra das peças

O operador também cria uma nova delivery com :
- o estado 0 (espera da chegada)
- Com uma lista de tipo de peças recebidas
    - Número de peças recebidas
    - Data de chegada esperada
    - o tipo da peça recebida


## Step 10 - (Optional) Registar novas peças
Á medida que as peças vão chegando o operador regista na delivery:
- A data de chegada do tipo da peça que chegou
- o número de peças que chegaram
Quando todas as peças chegarem a delivery passa para o estado 1 (concluida) 


## Step 11 - Concluir uma tarefa
O mecânico atualiza o mechanic task:
- a data de inicio
- a data de fim 
- o estado 4 (Tarefa Concluida com sucesso)

## Step 12 - (Optional) Alterar tarefa
O mecânico cria uma solicitação para alterar uma peça de uma tarefa com:
- uma data de inicio
- o tipo de peça a ser trocado
- estado 0 (Aguardar aprovação)
- o id da tarefa da manutenção

## Step 13 - (Optional) Chefe de oficina Autoriza
O chefe da oficina foi notificado que existe uma alteração de uma tarefa por validar e valida:
- Alterando o estado da compra para o estado 2 (válido)
- Alterando o estado da compra para o estado 3 (inválido)

Ao validar a tarefa é
- alterada o estado da tarefa para o estado 5 (alterada)
- criado uma nova tarefa com os detalhes da alteração e o estado 1 (Aguardar Aprovação)

É criado uma maintenance change e passamos para o passo 8

Depois de aprovada a tarefa é atribuida ao funcionário de novo

## Step 14 - Chefe de oficina adiciona uma tarefa
O chefe de oficina decide adicionar uma nova tarefa à manutenção com o estado 0

É criado uma maintenance change e passamos para o passo 8

Depois de validada a tarefa é atribuida ao funcionário de novo


## Step 11 - Controlo de qualidade  

## Step 15 - Relatório de concerto
É criado um pdf com 
- as tarefas realizadas na manutenção
    - o Preço
    - a peça usada
    - número de horas
    - a data de inicio e fim de tarefas
- As alterações feitas



## Step 16 - notificar cliente

## Step 17 - Entrega do veículo

O rececionista altera a mannutenção:
- adicionando o preço final
- o número de horas finais
- a data de conclusão (data do fim da realização da ultima tarefa)
- data de entrega (Datetime now)
- estado 4 (entregue)


## Step 18 - Cliente avalia o serviço

O cliente altera a manutenção:
- adicionando o cliente score





