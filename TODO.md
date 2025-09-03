
# TODO 
<!-- vehicle without owner ABS025 -->
## important


- permitir Tarefas/manutenção não serem atribuidas, mas o mecânico pode dar claim
- permitir mecânico adicionar tarefa à manutenção sem validação e sem clientid
- associar task a um mecânico com o novo layout
- No final da realização da manutenção acontece as verificações finais que pode levar a voltar a fazer alguma tarefa
    - indicar que verificações falhou 
    - adicionar nova tarefa tagged 
- Mecanico poder adicionar tarefas que fez (criar configuração)
    - adicionar tarefa so requer verificação do manager se for de um cliente 
    - adicionar tarefa so pode ser feito se for manutenção por veiculo e n por task



- mostrar todos os funcionários na home page
- home page mostra nº de horas expectaveis de trabalho sem funcionarios atribuidos
- Ligação vehicle type, vehiclepart e vehiclepart category e permitir alterar no adminPage

- Permitir tarefas pertencerem àquela entidade
- Permitir gestor criar as tarefas
- Permitir adicionar tarefas danificadas à manutenção

### processo de manutenção GERAL


### Compras
- Dps do registo de uma compra perguntar se quer dar notify a outra tarefa se tiver quantidade suficiente para elas         
- Permitir o workshop manager ver as compras passadas                                                                       
- Permitir o workshop cancelar compras antes de finalizar                                                                   
- Não permitir adicionar parts dps de já ter adicionado essa parte                                                          
- Permitir aumentar a quantidade de peças numa compra quando for dar assign
- Não permitir o workshop manager de adicionar part que ja está adicionado na compra 
- adicionar tipo de partes no inventário mas com transparencia ou noutra tab 
- adicionar triangulo a parts perto do reorder point
- Adicionar alerta no inventário da página do warehouse quando tem poucas partes
- Criar Fornecedores
- workshop purchase delay check 
- Merge compras com wait parts
- Add image to vehicle part

- Permitir o gestor criar contratos de fornecedor com um conjunto de peças associadas e o seu preço por peça 
- quando fazer um purchase delay verificar se tem tasks associadas, se tiver tasks associadas verificiar se a manutenção está antes da data de chegada das peças, se tiver criar maintenance change



### Tasks Gerais

Meter atrasos e wait parts dentro das compras (?)
Criar historico de compras (?)

Dealership admin Create maintenance task type adicionar remove substep 

Rececionista e workshop manager                                                     
- task do calendario separar tarefas de diferentes pessoas


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

Remove Client do AspNetUser para não roubar o email ao utilizador

Search User to search for clients too

Criar funcionario, Workshop manager, mandar a palavra passe por email como no client

Ordenar compras por start Date e remover compras à mais de 30 dias

Ver fluxo alteração/adicionar tarefa sem client

Passar os numeros dos estados para enums no projeto todo

Ver tasks a seguir a outras (talvez a penas a qualidade)

Workshop AssignTask  MaintenanceChange MinConclusionDate para NewConclusionDate (?)

Client Page review info submitted

Report redo with the new info

Remove maintenance Change do model do maintenanceTask e ver onde dá erro


### Fazer fluxo manutenção da propria entidade
- sem e não mostrar nos detalhes                                                    DONE
    - clientid                                                                      DONE
    - expected budget                                                               DONE
    - budget                                                                        DONE
    - expected conclusion date                                                      DONE
- Não há rececionista                                                               DONE
- Um operador/gestor cria a manutenção para o veículo                               
- todas as tasks criadas pelo mecânico são válidas                                  DONE
- todas as tasks completas levam à finalização da manutenção                        DONE
- no report remover informação não utilizada                                        DONE
#### Gestor
página da manutenção
- igual á do chefe de oficina, mas apenas com:
    - Inventário
    - manutenções
    - compras
    - página inicila com calendario e atribuição de tarefas
    - historico de manutenções
    - atrasos
    - wait parts (?)

adicionar Partnerships ao overview page com lista de entidades e as parcerias existentes ou que podem ser feitas


#### Remove dealership
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




### Confs
Haver um conf para quando houver alteração de uma tarefa n precisar de ir ao chefe de oficina

#### Task/Vehicle Assign
True:
- Mecanicos vêm várias tarefas por fazer naquele dia
- Chefes de oficina atribuem tarefas e podem ver várias tarefas por fazer
False:
- Mecanicos vêm vários veículos por fazer naquele dia
- Chefes de oficina atribuem veículos e podem ver vários veículos por fazer

#### Conf Eval Task                                                 
True:                                                       DONE
- tarefa feita cria tarefas por realizar                    DONE    

False:                                                      DONE
- tarefa feita cria tarefas realizadas                      DONE




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


### Gestão de contratos públicos
- Criar tabela de contrato
    - Duração
    - Data de Ínicio not null
    - Orçamento
    - Quantidade
    - Data de Fim
    - Lista de peças associadas not null
    - Id not null

- Tab igual á da manutenção ativa com cards com progress bar e data limite
- Detalhes (mostrar apenas os non nullables):
    - Duração
    - Data de Ínicio
    - Orçamento Total
    - Orçamento gasto
    - Orçamento livre (?)
    - Quantidade Total
    - Quantidade gasta
    - Quantidade livre (?)
    - Data de Fim
    - Lista de peças associadas
    - Velocidade Média por mês
    - velocidade média por semana
    - espectativa de conclusão em número de dia/meses (>2 meses muda para em dias)
    - Quando a espectativa é inferior a 2 meses gera alerta por email e aparece asinalado 



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

Criar manutenção com Stock                              DONE                TESTADO
Criar manutenção Sem Stock                              DONE                TESTADO
Criar manutenção Faltam tarefas                         DONE                TESTADO
Criar manutenção Faltam tarefas sem stock               
Criar manutenção Parte errada                           DONE                TESTADO                       
Criar manutenção com atraso                             
Criar manutenção com Report                             DONE                TESTADO
Criar manutenção com compra em atraso                   
Fazer uma compra em atraso                              DONE                
Criar manutenção Sem Stock com compra cancelada                  


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



- Reler a introdução
    - Decidir secções que adicionar
    - Decidir pontos a adicionar

- Reler state of art
    - Decidir secções que adicionar
    - Decidir pontos a adicionar

- Reler metodologia
    - Decidir secções que adicionar
    - Decidir pontos a adicionar

- Reler Conclusão
    - Decidir secções que adicionar
    - Decidir pontos a adicionar


- preparar user testes
- ver cena das perguntas de qualidade de serviço




- Introdução
    - Adicionar resumo da metodologia
    - Adicionar lisboa nos objetivos e problemas
    - Reler o que está feito e se falta alguma cena
    - meter no chat para ver se está fixe

- State of Art
    - Falar de * **Sistemas de Gestão de Manutenção** (CMMS – Computerized Maintenance Management Systems).         DONE
    - * **Gestão de Serviços em Oficinas**  (Maybe)                                                                 DEPRECATED
    - Talvez tirar service quality ??? (Se conseguir, deixa ficar)                                                  ???
    - adicionar Comparação com outros softwares usados por concessionários                                          DONE
    - Adicionar lacunas das soluções existentes                                                                     DONE
    - Adicionar uma secção de lisboa a explicar os casos de uso                                                     DONE
    - adicionar introdução e conclusão

- Metodologia
    - adicionar no fim nos user testes notas recebidas por lisboa e pelo tiago                                      DONE
    - Melhorar o levantamento de requisitos dizendo que foi visto da analise de literatura do tiago e de lisboa     
    - adicionar testes com utilizadores reais, ver metricas:
    * **Métricas**: tempo de execução, taxa de erros, satisfação do utilizador.
    - Análise dos resultados
    - adicionar falar de cada página da aplicação 
    - tirar chapter 4 ????

- Conclusão
    - Resumo dos objetivos
    - Resumo dos principais resultados
    - adicionar limitações
    - adicionar future work
    - considerações finais





- Falar de * **Sistemas de Gestão de Manutenção** (CMMS – Computerized Maintenance Management Systems).      
https://www.manwinwin.com/cmms/     
https://www.ibm.com/think/topics/what-is-a-cmms    
https://www.sap.com/products/scm/asset-management-eam/what-is-cmms.html      
https://www.perplexity.ai/search/i-want-to-know-more-about-cmms-5dhgrMROTBe61SGMCci_Mg?0=d

- Falar detype of maintenances  ???
https://www.perplexity.ai/search/i-want-to-add-a-section-about-e9T0ev4LSJqIIKnKUq5kfw



- falar de lacunas e comparação com soluções
https://coastapp.com/blog/fiix-review/

https://www.rockwellautomation.com/en-us/products/software/factorytalk/maintenancesuite/fiix.html#:~:text=That%20leaves%20you%20constantly%20reacting,maintenance%20management%20system%20(CMMS).

(https://www.clickmaint.com/blog/fiix-cmms)


