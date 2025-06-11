
# TODO 
<!-- vehicle without owner ABS025 -->
## important


Rececionista e workshop manager
- task do calendario mostrar o nome da tarefa e separá-las
- adicionar filtro por mecânico

ajeitar reset password e confirm email page quando nao se está logged in        

Show tarefas no calendario aparece mal  

Recepcionist tools to resend confirm email and reset password (maybe separados até)

Admin tools to manually assign deliveries to users.


Rececionista -> ao invalidar alteração, apenas fazer com que seja mantido como era antes
             -> adicionar caso, invalidar tarefa


- System -> Maintenance Change precisa de ser mudado (Ou n precisa de maintenanceId ou é preciso mais uma tabela)

Client score form investigar mais que perguntas fazer

Review Design of every page
- Rececionista -> calendario tem de mudar
               -> retirar client expected score do definir detalhes da manutenção

permitir dealership admin ou admin to adicionar vehicletype ao owner

Testar fluxo client sem owner e vehicle sem vehicle owner

### Fazer fluxo manutenção da propria entidade
- sem 
    - clientid
    - expected budget
    - budget
    - expected conclusion date
    - ClientEntity
- Não há rececionista
- Um operador/gestor cria a manutenção para o veículo
- todas as tasks criadas pelo mecânico são válidas
- todas as tasks completas levam à finalização da manutenção
- no report remover informação não utilizada


### Remove dealership
- Remover tabela dealership                                                         DONE
- Alterar tabelas para ligarem se ao owner                                          DONE
- Adicionar Module ao owner (criar tabela para n interagir com a outra)             DONE
    - Maintenance                                                                   DONE
    - Fleet management                                                              DONE
- criar tabela ownerpartnership                                                     DONE
    - criar ligação entre owner                                                     DONE    
        - owner 1 faz sugestão onwer 2                                                  
        - owner 2 aceita                                                            DONE
- Só consegue fazer manutenções das suas bicicletas ou bicicletas de parceiro (com parceria manutenção)         DONE
    - E com clientes que não estão relacionados a entidades? Vehicles sem VehicleOwner?
- mudar navbar para ter o nome do projeto                                                                       DONE
- chefe de oficina e gestor são contas/pessoas diferentes?                              
    - Segundo loulei, parece que não
    - Permitir gestor ver as mesmas operações do chefe de oficina ? 
        - É preciso página extra para manutenção
        - É preciso página extra para inventário, transações, compras, atrasos e partes em falta


### Client

### Warehouse manager

### mechanic
testar criar fazer varias tasks de uma vez                  
on chrome leave pause task                                  
continue, faz continue da tarefa                            


### rececionista

### chefe de oficina 

### Sistema 

Criar MeanDeliveryInDays on purchase ou assim                                   
Adicionar razão ao maintenance change?   
VER NOTAS DA REUNIAO COM O TIAGO            


FAZER UNIT TESTS

### obsolete
- warehouse -> Criar compra com tarefa do tipo wait part atribuida e sem compras não inválida e não entregue     
<!-- Trocar pneus pode requerer remover 2 peças -->
<!-- Alterar Tasks type para meter quantidade necessária  -->

<!-- Adicionar quantity real ao inventário (é alterada com o registo de compras e finalização de tarefas)
- a quantidade disponivel é decrescentada na criação de tarefas e na saida de waitPart e é somada na invalidação, registo -->

client - Create Maintenance                                                                                         DONE
    - create Client without personal information                                                                    DONE
    - add code to maintenance                                                   (optional)                              
    - add userId to maintenance (or add the maintenance code to the user)                                           DONE
    - send link by email to configure password                                                                      DONE
    - put maintenance code/Email first to assure is the correct user            (optional)
    - show page ResetPassword                                                                                       DONE
    - merge confirmEmail with resetPassword in another page (ConfirmEmailAndResetPassword.cshtml + .cs)             DONE


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
Use Case 1.3 – Recolher informação sobre um pedido de manutenção    DONE   
Use Case 1.4 – Pedir autorização ao cliente                         DONE
Use Case 1.5 – Entrega do veículo                                   DONE                           
Use Case 1.6 – Invalidar Tarefa                                     DONE


Oficina
Use Case 2.1 – Ver lista de tarefas pendentes                       DONE
Use Case 2.2 – Fazer a avaliação do veículo                         DONE
Use Case 2.3 – Elaborar lista de tarefas necessárias                DONE
Use Case 2.4 – Recolher peças no Armazém                            DONE
Use Case 2.6 – Manutenção do veículo                                DONE
Use Case 2.7 - Fazer o relatório do conserto                        DONE
Use Case 2.8 – Tarefa Requer Alteração                              DONE

Armazém
Use Case 3.1 – Visualizar as várias peças que o armazém possui      DONE
Use Case 3.2 – Solicitar serviço de compras                         DONE
Use Case 3.3 – Comprar peças                                        DONE
Use Case 3.4 – Registar novas peças na base de dados                DONE
Use Case 3.5 – Alterar estado da tarefa                             DONE

Chefe de Oficina
User case 4.1 – Atribuir tarefas a funcionários                     DONE
Use Case 4.2 – Autorizar compras                                    DONE
Use Case 4.3 – Ver histórico de manutenções efetuadas               DONE
Use Case 4.4 – Elaborar estatísticas                                DONE    
User case 4.5 – Atribuir cargos a funcionários                      DONE
User case 4.6 – Autorizar alteração                                 DONE
User case 4.7 – Adicionar Tarefa                                    DONE    
User case 4.8 – Criar funcionário                                   DONE

Aplicação do Cliente
Use Case 5.1 – Visualizar o estado atual da manutenção              DONE
Use Case 5.2 – Notificar o cliente do fim da manutenção             DONE
Use Case 5.3 – Avaliação do serviço prestado                        DONE
Use Case 5.4 – Avaliação expectável do serviço                      DONE
Use Case 5.5 – Ver manutenções passadas                             DONE

Administrador
User case 6.1 – Criar Tipos de Tarefas                              DONE
User case 6.2 – Criar Concessionários                               DONE
User case 6.3 – Criar Partes de veículos                            DONE
User case 6.4 – Alterar tabela de preço das partes                  DONE
User case 6.5 – Adicionar tipo de veículo ao concessionário         DONE
User case 6.6 – Adicionar tarefas de Avaliação                      DONE



## Fluxos completos

Criar manutenção com Stock                  DONE
Criar manutenção Sem Stock                  DONE
Criar manutenção Faltam tarefas             DONE
Criar manutenção Parte errada               DONE
Criar manutenção com atraso                 DONE
Criar manutenção com Report                 DONE
Criar manutenção com compra em atraso       DONE
Fazer uma compra em atraso                  DONE

Criar manutenção sem espinhas e sem partes  DONE
Fazer uma compra                            DONE

## mini fluxos 
### Mecanico
continuar tarefa                            DONE

### chefe de oficina
Ver transições de inventário                DONE
Ver Manutenções ativas e passadas           DONE
Criar funcionários                          DONE
Ver relatorios                              DONE
Ver estatisticas (Quais?)                   DONE





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


