# Do Data Warehouse ao Power BI: Projeto End-to-End de Análise para Adventure Works
_Este projeto constitui a etapa final para a certificação em Analytics Engineer pela Indicium Academy._



## 1. Contexto do Projeto

A **Adventure Works** é uma indústria de bicicletas em crescimento que deseja adotar uma abordagem data-driven para impulsionar sua competitividade. Com mais de 500 produtos, 20.000 clientes e 31.000 pedidos, a empresa busca responder a perguntas estratégicas sobre suas vendas e expandir o uso de dados de forma integrada para outras áreas no futuro.

A infraestrutura de dados será construída com um foco inicial em vendas, mas utilizará dados de outros sistemas, como o ERP (SAP), CRM (Salesforce) e Web Analytics (Google Analytics). Este projeto foi idealizado pelo Diretor de Inovação, João Muller, com o apoio do CEO, Carlos Silveira, que enfatiza a garantia da qualidade dos dados, especialmente nas informações de vendas.


## 2. Conheça os Stakeholders

O projeto de dados da Adventure Works é patrocinado por João Muller, diretor de inovação, com apoio do CEO Carlos Silveira, que vê no uso estratégico de dados uma vantagem competitiva, exigindo alta qualidade e confiabilidade dos dados. A diretora comercial, Silvana Teixeira, está cética quanto ao valor do projeto para o setor de vendas, preferindo investimentos com retorno imediato, enquanto o diretor de TI, Nilson Ramos, é responsável por garantir o acesso aos dados, delegando a tarefa a Gabriel Santos, analista de banco de dados com agenda limitada. Esse conjunto de interesses demanda uma execução cuidadosa para alinhar expectativas e atender aos objetivos técnicos e de negócios.

![stakeholders](https://github.com/user-attachments/assets/1b893a85-3ddf-43a8-8b29-9ef9b2dc9b53)



## 3. Objetivo do Projeto

O projeto visa criar uma infraestrutura moderna de dados que:

- Forneça respostas rápidas e confiáveis às questões comerciais de vendas.
- Integre dados relevantes para suportar outras áreas no futuro.
- Construa uma base confiável para relatórios e análises de BI.


  
## 4. Perguntas a serem respondidas

- Qual o número de pedidos, quantidade comprada, valor total negociado por produto, tipo de cartão, motivo de venda, data de venda, cliente, status, cidade, estado e país?
- Quais os produtos com maior ticket médio por mês, ano, cidade, estado e país?
- Quais os 10 melhores clientes por valor total negociado filtrado por produto, tipo de cartão, motivo de venda, data de venda, status, cidade, estado e país?
- Quais as 5 melhores cidades em valor total negociado por produto, tipo de cartão, motivo de venda, data de venda, cliente, status, cidade, estado e país?
- Qual o número de pedidos, quantidade comprada, valor total negociado por mês e ano?
- Qual produto tem a maior quantidade de unidades compradas para o motivo de venda “Promotion”?


## 5. Base de Dados

A Adventure Works é uma base de dados fictícia da Microsoft amplamente utilizada em treinamentos e projetos de demonstração para simular cenários reais de análise de dados. Esta base possui 68 tabelas e você pode acessar mais informações nesse Link: <https://learn.microsoft.com/pt-br/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms>

![image](https://github.com/user-attachments/assets/47990f5d-7d94-49a4-b694-31cd668622ee)


## 6. Arquitetura e Ferramentas

### Arquitetura

O projeto consiste na criação de um Data Warehouse com uma estrutura **Star Schema** que contém tabelas de fatos e dimensões focadas em vendas e em outras áreas necessárias.

### Ferramentas Utilizadas

- **Banco de Dados Transacional**: PostgreSQL
- **Data Warehouse**: Snowflake
- **ETL/ELT**: dbt Cloud (Transformação de Dados)
- **Visualização**: Power BI
  
![arquitetura de dados 2](https://github.com/user-attachments/assets/be36d21e-6980-4d1f-81ec-d0df90241486)



## 7. Modelagem Dimensional
A modelagem dimensional do projeto foi desenhada para atender às principais necessidades analíticas do departamento de vendas da Adventure Works. Estruturada no formato estrela (star schema), essa modelagem permite realizar análises rápidas e flexíveis por meio da separação entre tabelas de fatos e dimensões:

![diagrama](https://github.com/user-attachments/assets/4d2815d8-1764-4ba1-857a-f199a0ac0f0c)

Na pasta **models**, a modelagem dimensional está organizada em três etapas principais: staging, intermediate, e marts. Cada etapa corresponde a uma fase específica no processo de transformação dos dados, permitindo uma transição estruturada e eficiente desde a ingestão dos dados brutos até a criação de tabelas dimensionais e de fatos para análise final.

- **Staging:** Esta etapa inicial tem como objetivo carregar os dados brutos da base Adventure Works sem modificações significativas. Os dados são transferidos para a área de staging, onde serão corrigidas as tipagens e renomeados os campos necessários.

- **Intermediate:** Após o staging, os dados seguem para a camada intermediate, onde são aplicadas as transformações preliminares. Nesta fase, as tabelas começam a se adaptar ao modelo dimensional, recebendo ajustes como limpeza de dados, criação de joins e cálculos preliminares. A etapa intermediate prepara o terreno para que os dados estejam prontos para compor tabelas de fatos e dimensões, simplificando relações e criando métricas e métricas derivadas que facilitam a análise.

- **Marts:** Esta última etapa é onde os dados se transformam em marts específicos para atender as necessidades analíticas. Aqui, as tabelas são otimizadas e organizadas em dimensões e fatos, com cada mart focado em uma área ou pergunta de negócio, como métricas de vendas e comportamento de clientes. 


## 8. Testes no dbt

Durante o desenvolvimento da modelagem dimensional, realizei testes para verificar se atendida as regras estipuladas como não ter dados nulos ou ser um dado único no caso das chaves primárias. Além disso, na pasta test criei um teste separado com o objetivo de validar uma informação passada pelo Carlos que as vendas brutas no ano de 2011 foram de $12.646.112,16. Os testes realizados no dbt foram:
- **dbt run:** Executa todos os modelos do projeto e materializa-os no data warehouse.
- **dbt test –select source:*** Realiza testes de qualidade nos dados que estão sendo usados como fontes, garantindo que atendam a critérios específicos.
- **dbt test:** Valida os dados modelados com base em regras e condições definidas no projeto, verificando a integridade e a consistência.


## 9. Criação do Dashboard no Power BI

O mockup do Dashboard foi desenvolvido no Figma e o desenvolvimento realizado no Power BI. 

### Página 1: Visão Geral

![image](https://github.com/user-attachments/assets/ba970b37-fe26-4bdc-9d08-45dca0181f93)


### Página 2: Produto
![image](https://github.com/user-attachments/assets/2722096c-bbd8-4c81-903e-422563934235)


## 10. Conclusão

Este projeto demonstrou como uma abordagem end-to-end pode transformar a infraestrutura de dados da Adventure Works, integrando informações de vendas de forma confiável. Com a implementação do Data Warehouse no Snowflake e o uso do dbt Cloud para a transformação de dados, conseguimos garantir a qualidade e a consistência das informações.

A modelagem dimensional em Star Schema permitiu análises rápidas e eficazes, atendendo às necessidades dos stakeholders e alinhando-se aos objetivos da empresa. O dashboard desenvolvido no Power BI facilitou a visualização dos dados, permitindo que a equipe explorasse as informações de vendas de maneira intuitiva.

Com este projeto, a Adventure Works está mais preparada para responder a perguntas estratégicas e fortalecer suas operações de vendas, estabelecendo uma base sólida para futuras iniciativas em análise de dados e promovendo uma cultura orientada por dados.


---


## Constribuições

Muito obrigada por acompanhar meu projeto até aqui! 🎉

Contribuições são **muito bem-vindas**. Se você tem sugestões ou melhorias, fique à vontade para abrir uma **issue** ou enviar um **pull request**.

Gostou do projeto? Não esqueça de dar uma ⭐️! 


**Meus Contatos:**

💻 [LinkedIn](https://www.linkedin.com/in/gabrielasantanamorais/)  
📩 [E-mail](mailto:gabrielasmorais01@gmail.com)

**Até a próxima!** 🚀
