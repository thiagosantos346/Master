# Master
Bando de dados 2018 2


#Projeto de Banco de Dados 2018/2 

#Entrega do Trabalho
  
  
  #scripts contendo expressões SQL (DDL e consultas)
  
  #Criação e população do banco
  https://github.com/thiagosantos346/Master/blob/master/dmp.sql
  
  A Lista de consultas sob o banco está no final.
  
  # slides da apresentação
  
  
# relatório técnico:


# Descrição do Mini mundo

#Foi pedido por uma agencia de contabilidade que administra contas de condomínio que registrasse os dados de seu condomínio;


Sendo que cada contador possui, um nome, endereço telefone e-mail e e tem a e registram a opção de broquelar os boletos de todo o condomínio, pois essa regra é publica e afeta todo o condomínio, mas pode ser diferente para cada condomínio.


Cada codomínio tem a estrutura básica de ter:
# N Avisos:
Os avisos são meios de comunicação do contador e do condomínio.
Assim ele conta com Nome, código e um nome de pesquisa que pode ser usado como resumo, do aviso.

# N plano de Contas:
Cada um dos N registros guarda dados bancários(Banco, Agencia, e Conta Bancaria) do condomínio, o nome da despesa

# N Síndicos:
O síndicos também são registrados para posteriormente gerar dados fiscais a respeito deles,  para isso se anota o cpf, dada de nascimento.

# N Blocos:
Os blocos estão diretamente associados ao condomínio e as N unidades constituites, são um modo de agrupar e localizar cada unidade(Apartamento, casa, etc...).
Assim Usam Os identificadores do Condomínio ao qual ele está hospedado e das n unidades registradas neste bloco.

# N Unidades:
Cada uma dessa unidades, possuem um o numero do bloco que essa faz parte, e também do condomínio, nome do morador, telefone do morador, cpf ou cnpj para gerar boletos, e-mail para envio dos boletos e um dia de vencimento, que será usado para emissão dos boletos.

# Boletos:
Dado uma combinação de Unidade e Condomínio se cria um boleto para controlar receitas do condomínio, e para isso usa um status que registra se esse foi pago, o numero da unidade vigente, o mês e ano do boleto, data exata do vencimento do boleto, data que esse foi pago, o valor do boleto e o valor recebido, e as observações que é usada para registrar instruções do boleto, como juros vigente em caso de vencimento ou não pagamento total.

# Modelagem Conceitual


# Modelagem Lógica


# Construção e População do Banco de Dados


# Especificação de Operações sobre o Banco de Dados


# Lista de Operações;

# 1. Duas consultas realizando duas operações diferentes sobre conjuntos (união, interseção ou diferença);

# 2. Duas consultas aninhadas pela cláusula FROM;

# 3. quatro consultas envolvendo os operadores como IN, SOME, ANY, ALL, EXISTS e UNIQUE;

# 4. uma consulta envolvendo a operação de junção definida na cláusula FROM;

# 5. duas consultas envolvendo outer joins;

# 6. duas consultas envolvendo agrupamentos e agregações;

# 7. uma consulta envolvendo a cláusula HAVING;

# 8. duas operações de inserção, sendo que pelo menos uma deverá envolver mais de uma tabela, isto é, tabelas envolvidas em restrições de integridade;
tabela, isto é, tabelas envolvidas em restrições de integridade;

# 9. duas operações de deleção, sendo que pelo menos uma deverá envolver mais de uma tabela, isto é, tabelas envolvidas em restrições de integridade;

# 10. duas operações de modificação, sendo que pelo menos uma deverá envolver mais de uma tabela, isto é, tabelas envolvidas em restrições de integridade;

# 11. criação de duas visões;




