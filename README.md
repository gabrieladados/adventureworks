# Do Data Warehouse ao Dashboard: Projeto End-to-End de Análise para Adventure Works



## 1. Contexto do Projeto

A **Adventure Works** é uma indústria de bicicletas em crescimento que deseja adotar uma abordagem data-driven para impulsionar sua competitividade. Com mais de 500 produtos, 20.000 clientes e 31.000 pedidos, a empresa busca responder a perguntas estratégicas sobre suas vendas e expandir o uso de dados de forma integrada para outras áreas no futuro.

A infraestrutura de dados será construída com um foco inicial em vendas (Sales), mas utilizará dados de outros sistemas, como o ERP (SAP), CRM (Salesforce) e Web Analytics (Google Analytics). Este projeto foi idealizado pelo Diretor de Inovação, João Muller, com o apoio do CEO, Carlos Silveira, que enfatiza a garantia da qualidade dos dados, especialmente nas informações de vendas.



## 2. Objetivo do Projeto

O projeto visa criar uma infraestrutura moderna de dados que:

- Forneça respostas rápidas e confiáveis às questões comerciais de vendas.
- Integre dados relevantes para suportar outras áreas no futuro.
- Construa uma base confiável para relatórios e análises de BI.

  

## 3. Arquitetura e Ferramentas

### Arquitetura

O projeto consiste na criação de um Data Warehouse com uma estrutura **Star Schema** que contém tabelas de fatos e dimensões focadas em vendas e em outras áreas necessárias.

### Ferramentas Utilizadas

- **Data Warehouse**: Snowflake
- **ETL/ELT**: dbt Cloud (Transformação de Dados)
- **Banco de Dados Transacional**: PostgreSQL
- **Visualização**: Power BI / Google Data Studio
  
![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/73ab55c1-229d-4c6a-b919-229a57bae16d/e9ff1d8b-f518-4f5c-84b1-c463664544a4/image.png)
