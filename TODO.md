
# TODO 

## important


### Warehouse manager
Final do Purchase mudar status da tarefa se existir                     DONE
Fazer form criar purchase                                               DONE
fazer form finalizar compra                                             DONE
fazer form registar entrega                                             DONE

Como criar inventário                                                   DONE

Separar compras por ação e compras para os detalhes (tabelas diferentes)


### mechanic
Adicionar quantidade em stock do tipo de peça no processo de avaliação
No processo de avaliação dizer se existe alguma compra à espera de entrega para essas peças e a data prevista de chegar


### rececionista
Adicionar previsão das peças caso n haja em stock na finalização da manutenção

### chefe de oficina 
Separar compras por ação e compras para os detalhes (tabelas diferentes)



### Sistema 
Tarefas com peças em falta não podem ser atribuidas

MeanDeliveryInDays in DealershipInventory nullable
MinimumStockLevel in DealershipInventory nullable
MaximumStockLevel in DealershipInventory nullable
ReorderPoint in DealershipInventory nullable

Criar MeanDeliveryInDays on purchase ou assim




## it can wait


### Warehouse manager
scroll da página ser só no conteudo e n na página inteira (prov scroll no container) 

### mechanic
scroll da página ser só no conteudo e n na página inteira (prov scroll no container) 


### rececionista
scroll da página ser só no conteudo e n na página inteira (prov scroll no container) 
calendário com filtros
Reduzir o calendario 

### chefe de oficina 
scroll da página ser só no conteudo e n na página inteira (prov scroll no container) 
calendário com filtros
Reduzir o calendario 


### Outros

relatório de entrada do veículo na manutenção (?)
Faturação
botão na bancada para n ter de clicar 
Momento de inicio de budget ?? esta no finalizar manutenção





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
Criar manutenção Sem Stock
Criar manutenção com Stock
Criar manutenção Faltam tarefas
Criar manutenção Parte errada
Criar manutenção com atraso
Criar manutenção com Report

Criar manutenção sem espinhas e sem partes DONE
Fazer uma compra                           DONE

## mini fluxos 
### Mecanico
continuar tarefa

### chefe de oficina
Ver transições de inventário                DONE
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
O que fazer se o veículo não passa no controlo de qualidade?
