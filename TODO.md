
# TODO 

## important

TESTAR FLUXO  -  Criar manutenção com compra em atraso


### Warehouse manager
Criar compra com tarefa do tipo wait part atribuida e sem compras não inválida e não entregue           
Mostrar número de partes necessárias, as manutenções e tasks associadas e as compras feitas relacionadas a essas partes


### mechanic

testar criar fazre varias tasks de uma vez


### rececionista



### chefe de oficina 


### Sistema 

Criar MeanDeliveryInDays on purchase ou assim                                   
Mudar diagrama de purchase para mudar estado de todas as tarefas com tasks      
Acrescentar use case editar inventory location                        

If mechanic task is assigned after conclusion date dar aviso tem a certeza e criar maintenace change



Workshop invalidar compra -> fazer nova compra -> ....   

checkar se purchase é depois do conclusion date se faz se um maintenancechange ou task change
verificar o fluxo que tinha do delay change


<!-- Trocar pneus pode requerer remover 2 peças -->
<!-- Alterar Tasks type para meter quantidade necessária  -->

<!-- Adicionar quantity real ao inventário (é alterada com o registo de compras e finalização de tarefas)
- a quantidade disponivel é decrescentada na criação de tarefas e na saida de waitPart e é somada na invalidação, registo -->


## it can wait


### Warehouse manager
scroll da página ser só no conteudo e n na página inteira (prov scroll no container) 
Separar compras por ação e compras para os detalhes (tabelas diferentes)

### mechanic
scroll da página ser só no conteudo e n na página inteira (prov scroll no container) 


### rececionista
scroll da página ser só no conteudo e n na página inteira (prov scroll no container) 
calendário com filtros
Reduzir o calendario 
Ver tabela Maintenance final details, meter label mais pequeno ou aumentar o tamanho das labels (dl)


### chefe de oficina 
scroll da página ser só no conteudo e n na página inteira (prov scroll no container) 
calendário com filtros
Reduzir o calendario 
Separar compras por ação e compras para os detalhes (tabelas diferentes)


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
Use Case 2.3 – Elaborar lista de tarefas necessárias                DONE
Use Case 2.4 – Recolher peças no Armazém                            
Use Case 2.6 – Manutenção do veículo                                DONE
Use Case 2.7 - Fazer o relatório do conserto                        
Use Case 2.8 – Tarefa Requer Alteração                              DONE

Armazém
Use Case 3.1 – Visualizar as várias peças que o armazém possui      DONE
Use Case 3.2 – Solicitar serviço de compras                         DONE
Use Case 3.3 – Comprar peças                                        DONE
Use Case 3.4 – Registar novas peças na base de dados                DONE
Use Case 3.5 – Alterar estado da tarefa                             

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
User case 6.2 – Criar Concessionários
User case 6.3 – Criar Partes de veículos
User case 6.4 – Alterar tabela de preço das partes
User case 6.5 – Adicionar tipo de veículo ao concessionário


## Fluxos completos

Criar manutenção com Stock                  DONE
Criar manutenção Sem Stock                  DONE
Criar manutenção Faltam tarefas
Criar manutenção Parte errada
Criar manutenção com atraso
Criar manutenção com Report
Criar manutenção com compra em atraso
Fazer uma compra em atraso                  

Criar manutenção sem espinhas e sem partes DONE
Fazer uma compra                           DONE

## mini fluxos 
### Mecanico
continuar tarefa                            DONE

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
