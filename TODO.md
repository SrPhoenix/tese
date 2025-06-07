
# TODO 

## important

Review Design of every page
- Rececionista -> calendario tem de mudar
               -> retirar client expected score do definir detalhes da manutenção
               
Client score form investigar mais que perguntas fazer
client reset Password
- dar informação extra no form (phoneNumber, nome do client,....)

- System -> Maintenance Change precisa de ser mudado (Ou n precisa de maintenanceId ou é preciso mais uma tabela)
- workshop manager n tem bola vermelha com uma compra por dar assign

Mudar para ter mensagem de erro em condições:            
    if (!ModelState.IsValid)
    {
        var errors = ModelState.Values.SelectMany(v => v.Errors);
        return BadRequest(errors);
    }

Admin tools to manually assign deliveries to users.
Recepcionist tools to resend confirm email and reset password (maybe separados até)

Show tarefas no calendario aparece mal  
Mudar linha 433 do mecanico para dizer que o veiculo nao tem nenhuma parte dessa categoria para substituir

Ver como fazer varias maintenance ativas no client home page

Remover dealership e transformar em entities

Ver dealership vehicle part type

Rececionista e workshop manager
- task do calendario mostrar o nome da tarefa e separá-las
- adicionar filtro por mecânico

Permitir dar logout do client no telemóvel
Client history
- ver pdf
- meter página mais bonita

rececionista actions offcanvas does not refresh on maintenance finish start
atualizar lista de cards dps de fazer uma ação no client app

Rececionista -> ao invalidar alteração, apenas fazer com que seja mantido como era antes
             -> adicionar caso, invalidar tarefa

Adicionar localizer ao report

Remover caso de uso 2.7

### Client

Add Client personal info in the reset password

Duas páginas

- Current Maintenance
    - container in the middle of page to work fine in mobile
    - progress step like maintenance in the top
    - Title below with info of the step in a card (?)
    - top right the expected conclusion date
    - top left the expected budget 

- Maintenance History
    - List of cards with:
        - vehicle 
        - conclusion date
        - budget
        - button to see more details
        - button to see the report



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
Criar manutenção com Report                 
Criar manutenção com compra em atraso       DONE
Fazer uma compra em atraso                  DONE

Criar manutenção sem espinhas e sem partes DONE
Fazer uma compra                           DONE

## mini fluxos 
### Mecanico
continuar tarefa                            DONE

### chefe de oficina
Ver transições de inventário                DONE
Ver Manutenções ativas e passadas           DONE
Criar funcionários                          DONE
Ver relatorios
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


