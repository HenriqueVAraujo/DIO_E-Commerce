E-commerce Data Architecture: Refinamento de Modelo Conceitual
Este repositório apresenta o refinamento de um esquema de banco de dados para sistemas de E-commerce. O objetivo foi transformar um modelo básico em uma estrutura robusta, capaz de suportar operações complexas de checkout, diversidade de perfis de clientes (PF/PJ) e rastreabilidade logística avançada.

O projeto foca na normalização de dados e na aplicação de regras de negócio essenciais para a integridade de uma plataforma de vendas moderna.

Decisões de Arquitetura e Melhorias Implementadas
Para garantir a escalabilidade e a consistência do sistema, as seguintes atualizações foram aplicadas sobre o modelo original:

1. Especialização de Entidade: Cliente (PF e PJ)
Abordagem: Implementação de uma estrutura de Generalização e Especialização.

Motivação: Um cliente no sistema pode ser uma Pessoa Física ou Jurídica, mas as informações fiscais (CPF vs CNPJ) são mutuamente exclusivas. Esta estrutura evita a persistência de campos nulos excessivos e garante a integridade referencial por meio de chaves estrangeiras vinculadas à tabela base de Clientes.

2. Gestão de Pagamentos Multimodais
Flexibilidade: O esquema foi expandido para permitir que um único cliente gerencie diversos métodos de pagamento (Cartões, PIX, Boleto).

Composição de Pedido: Através da tabela associativa Pagamento_Pedido, o sistema permite que um único pedido seja liquidado por um ou mais métodos de pagamento simultaneamente, refletindo o comportamento real de fluxos de checkout de alta complexidade.

3. Módulo Logístico e Rastreamento de Entrega
Entidade Entrega: Criada como uma entidade independente vinculada ao ciclo de vida do Pedido.

Atributos Técnicos: Inclui controle de Status da Entrega e Código de Rastreio, permitindo o isolamento da lógica de logística em relação à lógica de venda.

Documentação e Entrega
A modelagem completa foi consolidada em arquivos técnicos anexados a este repositório para facilitar a análise e futura implementação:

Modelo_Ecommerce_Refinado.pdf: Diagrama lógico detalhado contendo todas as entidades, atributos e cardinalidades.

schema.dbml: Código fonte da modelagem em formato DBML para portabilidade entre ferramentas de design de banco de dados.

Stack Técnica Utilizada
Modelagem Lógica: dbdiagram.io / MySQL Workbench

Linguagem de Documentação: Markdown

Padronização: Modelo Entidade-Relacionamento (MER)

Autor
[Seu Nome Aqui] Analista de Dados / Engenheiro de Dados
