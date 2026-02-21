Advanced E-Commerce Data Architecture: Refinamento de Modelo e Persistência
Este repositório apresenta o refinamento estratégico de um ecossistema de dados para E-commerce. O objetivo central foi a transição de um modelo simplista para uma arquitetura de dados resiliente, projetada para suportar fluxos complexos de checkout, gestão tributária segmentada (PF/PJ) e rastreabilidade logística em tempo real. 

O foco recai sobre a normalização em 3ª Forma Normal (3NF) e a implementação de regras de integridade que garantem a consistência do dado desde a prospecção até à entrega final ao cliente. 

Decisões de Arquitetura e Diferenciais Técnicos
Para assegurar escalabilidade e reduzir a dívida técnica, foram implementadas as seguintes soluções:

1. Especialização de Entidades (Inheritance Pattern)

Implementação: Estrutura de Generalização e Especialização para a entidade Cliente. 


Justificativa Técnica: A separação em Pessoa Física e Pessoa Jurídica elimina a presença de campos nulos (sparse columns) e garante que restrições de integridade, como a validação de CPF e CNPJ, sejam aplicadas de forma isolada e eficiente, otimizando índices e consultas fiscais. 

2. Ecossistema de Pagamentos Multimodais

Modularidade: O esquema foi desacoplado para permitir que um único perfil de cliente gira múltiplos métodos de pagamento (Omnichannel). 


Complexidade de Checkout: Através da tabela associativa Pagamento_Pedido, o sistema suporta o fracionamento de uma única transação em múltiplos métodos (ex: parte via PIX e parte via Cartão), refletindo o comportamento real de plataformas de alta maturidade. 

3. Engine Logística e Rastreabilidade

Abstração de Domínio: A Entrega é tratada como uma entidade independente, vinculada ao ciclo de vida do Pedido, mas com governança própria. 


Métricas de Desempenho: Inclusão de atributos de rastreio e status evolutivo, permitindo o isolamento da lógica logística e facilitando integrações futuras com APIs de transportadoras via Webhooks. 

Documentação e Artefatos
A arquitetura está documentada através de artefatos que garantem a portabilidade do projeto:


Modelo_Ecommerce_Refinado.pdf: Diagrama lógico detalhado exibindo PKs, FKs e cardinalidades complexas. 


schema.dbml: Código-fonte da modelagem para rápida importação em ferramentas de design-first. 


queries_scripts.sql: Scripts de criação (DDL) e consultas analíticas para validação de hipóteses de negócio. 

Stack Tecnológica

Modelagem Lógica: dbdiagram.io e MySQL Workbench. 


Linguagem de Definição: SQL (ANSI) e DBML. 


Documentação: Markdown com foco em documentação técnica profissional. 

Autor
Henrique Vasconcelos Araujo
DBA
