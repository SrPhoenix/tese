Remover tabelas de estado e fazer enums (remover FK primeiro) Half Done

Recriar o diagrama da db para mostrar ao stor

Alterar tipo das tabelas para byte

Fazer mais uma tabela para o histórico do preço das peças em inventário de cada dealership




----------------------------------- + ---------------------------------------
 
# Todo - Semana 10/03-16/03

# Todo - Semana 17/03-23/03

Compras e visualização do stock do warehouse manager

Autorização de compras no workshop manager




# TDO - semana 24-30

Implementar Criação de clientes
Implementar Criar utilizadores no Warehouse manager


# TODO 

Checar se vale a pena tirar o delivery e delivery details e juntar a transaction com o purchase details 

Final do Purchase mudar status da tarefa se existir


Cagar primeiro caso seja uma tarefa, fazer so para restock normal


Meter modal full screen sem diminuires
resolver layout
resolver log out


# TODO
## Use Cases
Receção 
Use Case 1.1 – Marcar uma manutenção                                DONE                       
Use Case 1.2 – Definir detalhes da manutenção                       DONE
Use Case 1.3 – Recolher informação sobre um pedido de manutenção        
Use Case 1.4 – Pedir autorização ao cliente                         DONE
Use Case 1.5 – Entrega do veículo                                   DONE                           
Use Case 1.6 – Invalidar Tarefa                                     


Oficina
Use Case 2.1 – Ver lista de tarefas pendentes                       DONE
Use Case 2.2 – Fazer a avaliação do veículo                         DONE
Use Case 2.3 – Elaborar lista de peças necessárias                  DONE
Use Case 2.4 – Recolher peças no Armazém                            DONE
Use Case 2.6 – Manutenção do veículo                                DONE
Use Case 2.7 - Fazer o relatório do conserto                        
Use Case 2.8 – Tarefa Requer Alteração                              DONE

Armazém
Use Case 3.1 – Visualizar as várias peças que o armazém possui      DONE
Use Case 3.2 – Solicitar serviço de compras                         DONE
Use Case 3.3 – Registar novas peças na base de dados                DONE

Chefe de Oficina
User case 4.1 – Atribuir tarefas a funcionários                     DONE
Use Case 4.2 – Autorizar compras                                    DONE
Use Case 4.3 – Ver histórico de manutenções efetuadas               
Use Case 4.4 – Elaborar estatísticas                                
User case 4.5 – Atribuir cargos a funcionários                      
User case 4.6 – Autorizar alteração                                 DONE
User case 4.7 – Adicionar Tarefa                                    
User case 4.8 – Criar funcionário                                   

Aplicação do Cliente
Use Case 5.1 – Visualizar o estado atual da manutenção
Use Case 5.2 – Notificar o cliente do fim da manutenção
Use Case 5.3 – Avaliação do serviço prestado

Administrador
User case 6.1 – Criar Tipos de Tarefas


## Fluxos completos
Criar manutenção sem espinhas e sem partes
Criar manutenção Sem Stock
Criar manutenção com Stock
Criar manutenção Faltam tarefas
Criar manutenção Parte errada
Criar manutenção com atraso
Criar manutenção com Report

## mini fluxos 
### Mecanico
continuar tarefa

### chefe de oficina
Ver transições de inventário
Ver Manutenções ativas e passadas
Criar funcionários
Ver relatorios
Ver estatisticas (Quais?)





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