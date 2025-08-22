# Introdução
## motivação
Qual é o problema?
Como vamos resolver o problema?
- analise de literatura e falar com stackeholders
- depois validar com utilizadores
- objetivos de resolução


Na tua tese, a **Introdução** é o “convite” ao leitor — ela deve explicar o que estás a estudar, por que é importante e como o trabalho está organizado.

Para o teu caso (aplicação para manutenção em concessionários), podes estruturar assim:

---

## **Capítulo – Introdução**

### **1. Contextualização**

* Explicar o setor automóvel e a importância da manutenção nos concessionários.
* Referir desafios atuais (ex.: agendamento manual, erros no histórico, falta de integração de dados).
* Mostrar a relevância de soluções digitais no cenário atual (digitalização, eficiência operacional).

---

### **2. Justificativa**

* Por que desenvolver esta aplicação é importante:

  * Necessidade de modernizar processos.
  * Redução de custos e aumento de produtividade.
  * Melhoria da experiência do cliente.
* Enquadrar o projeto no contexto tecnológico (uso de web apps, mobile, cloud, etc.).

---

### **3. Problema de Investigação**

* Formular claramente a questão que a tua tese procura resolver.
  *Exemplo:*

  > “Como desenvolver uma aplicação capaz de otimizar a gestão de manutenção em concessionários, integrando agendamento, histórico de serviços e relatórios, de forma intuitiva e eficiente?”

---

### **4. Objetivos**

* **Objetivo Geral**: desenvolver a aplicação para gestão de manutenção em concessionários.
* **Objetivos Específicos**:

  * Levantar requisitos junto de concessionários.
  * Definir a arquitetura e as tecnologias da aplicação.
  * Implementar e testar funcionalidades principais.
  * Avaliar a usabilidade e desempenho do sistema.

---

### **5. Metodologia Resumida**

* Descrever brevemente como vais atingir os objetivos (levantamento de requisitos, desenvolvimento, testes).
* Não detalhar muito — isso fica para o capítulo de Metodologia.

---

### **6. Estrutura da Tese**

* Explicar rapidamente como está organizada:

  * **Capítulo 1** – Introdução
  * **Capítulo 2** – Estado da Arte
  * **Capítulo 3** – Metodologia
  * **Capítulo 4** – Desenvolvimento
  * **Capítulo 5** – Resultados e Discussão
  * **Capítulo 6** – Conclusão

---


# State of the art
No teu caso — desenvolver uma aplicação para gestão de manutenção em concessionários — o **Estado da Arte** deve mostrar:

1. O que já existe no mercado (soluções comerciais e académicas).
2. O que a literatura científica diz sobre desenvolvimento de aplicações, gestão de manutenção e tecnologias associadas.
3. Onde estão as lacunas que a tua aplicação vai preencher.

### **1. Introdução**

* Objetivo da secção: contextualizar a tua investigação, mostrar o que já foi feito e justificar a necessidade do teu trabalho.
* Explicar brevemente como foi feita a pesquisa bibliográfica (bases de dados, palavras-chave, critérios de seleção).

---

### **2. Conceitos Fundamentais**

* **Manutenção em concessionários**:

  * Tipos de manutenção (preventiva, corretiva, preditiva).
  * Processos comuns no setor automóvel.
* **Sistemas de Gestão de Manutenção** (CMMS – Computerized Maintenance Management Systems).
* **Gestão de Serviços em Oficinas**.

---

### **3. Tecnologias Utilizadas**

* **Plataformas**: Web, Mobile, Cloud.
* **Arquiteturas**: cliente-servidor, microserviços.
* **Bases de dados**: relacionais vs. não relacionais.
* **Integração com outros sistemas** (ex.: ERP, CRM).

---

### **4. Trabalhos Académicos Relevantes**

* Resumo de artigos científicos ou dissertações que abordem:

  * Aplicações para gestão de manutenção.
  * Softwares para concessionários.
  * Modelos de desenvolvimento ágil e prototipagem rápida.

---

### **5. Soluções Existentes no Mercado**

* Comparação de softwares usados por concessionários (ex.: AutoManager, DealerSocket, Tekmetric, etc.).
* Quadro comparativo com funcionalidades (agenda, histórico, alertas, relatórios, integração com inventário).

---

### **6. Lacunas Identificadas**

* Funcionalidades inexistentes ou limitadas nas soluções atuais.
* Problemas de usabilidade ou de integração.
* Necessidades específicas não atendidas no contexto local (ex.: idioma, legislação, adaptação à realidade dos concessionários da tua região).

---

### **7. Conclusão**

* Resumo das principais constatações.
* Justificação clara de como o teu projeto se insere e supera as limitações encontradas.



# Metodologia

### **1. Tipo e Abordagem da Pesquisa**

* **Natureza**: aplicada (pois visa criar uma solução prática).
* **Abordagem**: mista (poderás usar métodos qualitativos para entender necessidades dos concessionários e quantitativos para testar desempenho da aplicação).
* **Método**: pesquisa de desenvolvimento tecnológico.

### **2. Levantamento de Requisitos**

* **Objetivo**: identificar as necessidades reais dos concessionários.
* **Procedimentos**:

  * Entrevistas ou questionários com gestores e técnicos.
  * Observação dos processos atuais de manutenção.
  * Análise de sistemas já existentes (benchmark).
* **Critérios**: quem será incluído no levantamento (tamanho do concessionário, área geográfica, etc.).

### **3. Ferramentas, Tecnologias e Arquitetura**

* Linguagens de programação (ex.: Java, Python, JavaScript).
* Frameworks e bibliotecas.
* Banco de dados.
* Arquitetura do sistema (ex.: cliente-servidor, web app, mobile app).
* Justificativa das escolhas.

### **4. Etapas de Desenvolvimento**

* **Planeamento**: criação de backlog e cronograma (ex.: metodologia ágil – Scrum ou Kanban).
* **Design**:

  * Prototipagem (wireframes, mockups).
  * UI/UX design.
* **Implementação**:

  * Desenvolvimento dos módulos principais (ex.: registo de manutenção, agendamento, histórico de serviços).
* **Integração**: ligação com outros sistemas, se necessário.

### **5. Testes e Validação**

* **Tipos de teste**:

  * Testes unitários.
  * Testes de integração.
  * Testes de usabilidade com utilizadores reais.
* **Métricas**: tempo de execução, taxa de erros, satisfação do utilizador.

### **6. Análise e Avaliação dos Resultados**

* Comparar o processo de manutenção antes e depois da aplicação.
* Avaliar indicadores como rapidez no agendamento, redução de erros, melhoria no histórico de serviços.

### **7. Considerações Éticas**

* Privacidade dos dados dos clientes dos concessionários.
* Conformidade com regulamentos (ex.: RGPD).




# Conclusão

Na tua tese, a **Conclusão** não é apenas um “resumo final” — é onde mostras que todo o percurso da investigação e desenvolvimento fez sentido e atingiu os objetivos.
No teu caso (aplicação para manutenção em concessionários), ela pode seguir esta estrutura:

---

## **Capítulo – Conclusão**

### **1. Retoma dos Objetivos**

* Relembrar o objetivo principal da tese.
* Resumir os objetivos específicos.
* Explicar se foram cumpridos e como.

---

### **2. Principais Resultados**

* Síntese dos resultados alcançados no desenvolvimento da aplicação (funcionalidades implementadas, desempenho, usabilidade).
* Impacto esperado nos concessionários (agilidade, redução de erros, melhor gestão do histórico de manutenção).

---

### **3. Contribuições do Trabalho**

* **Académicas**: metodologias ou abordagens que possam ser aproveitadas por outros estudos.
* **Práticas**: ferramenta criada, melhorias que ela traz para o setor automóvel.

---

### **4. Limitações Encontradas**

* Restrições técnicas (tempo, recursos, funcionalidades não implementadas).
* Dificuldades na recolha de dados ou na validação com utilizadores.

---

### **5. Trabalhos Futuros**

* Funcionalidades adicionais (integração com inventário, relatórios avançados, IA para previsão de manutenção).
* Melhorias de performance ou interface.
* Expansão para outros tipos de empresas de serviços.

---

### **6. Considerações Finais**

* Encerramento com uma frase forte que ligue a relevância do projeto ao impacto real que ele pode ter.
* Dar ênfase à importância de continuar a evoluir a aplicação e o conhecimento no tema.

---

