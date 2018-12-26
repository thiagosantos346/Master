# Master
Bando de dados 2018 2


# Projeto de Banco de Dados 2018/2 

# Entrega do Trabalho
  
  
  # scripts contendo expressões SQL (DDL e consultas)
  
  # Criação e população do banco
  https://github.com/thiagosantos346/Master/blob/master/dmp.sql
  
  A Lista de consultas sob o banco está no final.
  
  # slides da apresentação
  
  
# relatório técnico:


# Descrição do Mini mundo

#Foi pedido por uma agência de contabilidade que administra contas de condomínio e que registrasse os dados de seus condomínio;


	Sendo que cada contador possui, um nome, endereço telefone e-mail e tem a opção de registrar a opção de broquelar os boletos de todos o condomínios, pois essa regra é publica e afeta todo o condomínio, mas pode ser diferente para cada condomínio.


	Cada codomínio tem essa estrutura básica:
# N Avisos:
	Os avisos são meios de comunicação do contador e do condomínio.
	Assim ele conta com Nome, código e um nome de pesquisa que pode ser usados como resumo, do aviso.

# N plano de Contas:
	Cada um dos N registros guarda dados bancários(Banco, Agencia, e Conta Bancaria) do condomínio, o nome da despesas.

# N Síndicos:
	O síndicos também são registrados para posteriormente gerar dados fiscais a respeito deles,  para isso se anota o cpf, dada de nascimento.

# N Blocos:
	Os blocos estão diretamente associados ao condomínio e as N unidades constituites, são um modo de agrupar e localizar cada unidade(Apartamento, casa, etc...).
	Assim usam ss identificadores do Condomínio ao qual ele está hospedado e das n unidades registradas neste bloco.

# N Unidades:
    Cada uma dessa unidades, possuem um o numero do bloco que essa faz parte, e também do condomínio, nome do morador, telefone do morador, cpf ou cnpj para gerar boletos, e-mail para envio dos boletos e um dia de vencimento, que será usado para emissão dos boletos.

# Boletos:
      Dado uma combinação de Unidade e Condomínio se cria um boleto para controlar receitas do condomínio, e para isso usa um status que registra se esse foi pago, o numero da unidade vigente, o mês e ano do boleto, data exata do vencimento do boleto, data que esse foi pago, o valor do boleto e o valor recebido, e as observações que é usada para registrar instruções do boleto, como juros vigente em caso de vencimento ou não pagamento total.

# Modelagem Conceitual


        https://github.com/thiagosantos346/Master/blob/master/Modelos%20Prontos/Conceitual_1.png?raw=true

# Modelagem Lógica

        https://github.com/thiagosantos346/Master/blob/master/Modelos%20Prontos/model%20er%202.png?raw=true
      

# Construção e População do Banco de Dados

  

      SET statement_timeout = 0;
      SET lock_timeout = 0;
      SET client_encoding = 'UTF8';
      SET standard_conforming_strings = on;
      SELECT pg_catalog.set_config('search_path', '', false);
      SET check_function_bodies = false;
      SET client_min_messages = warning;


      CREATE DATABASE proj_final WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


      ALTER DATABASE proj_final OWNER TO postgres;

      \connect proj_final

      SET statement_timeout = 0;
      SET lock_timeout = 0;
      SET client_encoding = 'UTF8';
      SET standard_conforming_strings = on;
      SELECT pg_catalog.set_config('search_path', '', false);
      SET check_function_bodies = false;
      SET client_min_messages = warning;



      CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


      COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


      SET default_tablespace = '';

      SET default_with_oids = false;


      CREATE TABLE public.avisos (
          condominio integer NOT NULL,
          id integer NOT NULL,
          resumo character varying(80) DEFAULT NULL::character varying,
          datainicial timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
          datafinal timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
          texto character varying(16384) DEFAULT NULL::character varying
      );


      ALTER TABLE public.avisos OWNER TO postgres;


      CREATE TABLE public.blocos (
          condominio integer NOT NULL,
          codigo integer NOT NULL,
          nome character varying(60) DEFAULT ''::character varying,
          nomepesquisa character varying(60) DEFAULT NULL::character varying
      );


      ALTER TABLE public.blocos OWNER TO postgres;


      CREATE TABLE public.boletos (
          condominio integer NOT NULL,
          id integer NOT NULL,
          status smallint DEFAULT 1,
          unidade integer NOT NULL,
          mes integer NOT NULL,
          ano integer NOT NULL,
          datavencto timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
          datapagto timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
          valor numeric(15,2) DEFAULT 0,
          valorrecebido numeric(15,2) DEFAULT 0,
          observacoes character varying(16384) DEFAULT NULL::character varying
      );


      ALTER TABLE public.boletos OWNER TO postgres;


      CREATE TABLE public.condominios (
          contador integer NOT NULL,
          codigo integer NOT NULL,
          nome character varying(80) DEFAULT ''::character varying,
          cnpj character varying(18) DEFAULT ''::character varying,
          endereco character varying(60) DEFAULT ''::character varying,
          cep character varying(9) DEFAULT ''::character varying,
          diavencimento smallint,
          inativo character(1) DEFAULT 'N'::bpchar,
          datainclusao timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
      );


      ALTER TABLE public.condominios OWNER TO postgres;


      CREATE TABLE public.contadores (
          id integer NOT NULL,
          nome character varying(80) DEFAULT ''::character varying,
          endereco character varying(80) DEFAULT ''::character varying,
          telefone character varying(30) DEFAULT ''::character varying,
          email character varying(80) DEFAULT ''::character varying,
          bloquearboletosautomaticamente character varying(1) DEFAULT 'N'::character varying
      );


      ALTER TABLE public.contadores OWNER TO postgres;



      CREATE TABLE public.plano_contas (
          condominio integer NOT NULL,
          conta character varying(40) NOT NULL,
          nome character varying(80) DEFAULT ''::character varying,
          banco integer,
          agencia character varying(6) DEFAULT ''::character varying,
          contabancaria character varying(15) DEFAULT ''::character varying
      );


      ALTER TABLE public.plano_contas OWNER TO postgres;



      CREATE TABLE public.sindicos (
          condominio integer NOT NULL,
          id integer NOT NULL,
          sindico character varying(60) DEFAULT NULL::character varying,
          datanascimento timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
          cpf character varying(14) DEFAULT NULL::character varying
      );


      ALTER TABLE public.sindicos OWNER TO postgres;



      CREATE TABLE public.unidades (
          condominio integer NOT NULL,
          id integer NOT NULL,
          bloco integer NOT NULL,
          unidade character varying(10) NOT NULL,
          nomemorador character varying(60) DEFAULT ''::character varying,
          telefone character varying(16) DEFAULT ''::character varying,
          cnpj_cpf character varying(18) DEFAULT ''::character varying,
          email character varying(80) DEFAULT ''::character varying,
          diavencimento integer
      );


      ALTER TABLE public.unidades OWNER TO postgres;



      INSERT INTO public.avisos (condominio, id, resumo, datainicial, datafinal, texto) VALUES (1, 1, 'Eleições', '2018-12-21 10:24:41', '2019-12-21 10:24:41', 'Participe das Eleições de sindico');
      INSERT INTO public.avisos (condominio, id, resumo, datainicial, datafinal, texto) VALUES (1, 2, 'Manutenção Elvevador', '2018-12-21 10:24:41', '2018-12-30 10:24:41', 'Somente o Elvador A irar Operar');
      INSERT INTO public.avisos (condominio, id, resumo, datainicial, datafinal, texto) VALUES (2, 2, 'eleições para sindico dia 09/06/2018', '2018-01-09 00:00:00', '2018-06-09 00:00:00', 'NÃ£o se esqueÃ§am de votar');




      INSERT INTO public.blocos (condominio, codigo, nome, nomepesquisa) VALUES (1, 1, 'A', 'Bloco A');
      INSERT INTO public.blocos (condominio, codigo, nome, nomepesquisa) VALUES (1, 2, 'B', 'Bloco B');
      INSERT INTO public.blocos (condominio, codigo, nome, nomepesquisa) VALUES (2, 1, 'SA', 'Bloco SA');
      INSERT INTO public.blocos (condominio, codigo, nome, nomepesquisa) VALUES (2, 2, 'SB', 'Bloco SB');




      INSERT INTO public.boletos (condominio, id, status, unidade, mes, ano, datavencto, datapagto, valor, valorrecebido, observacoes) VALUES (2, 2, 1, 2, 2, 2018, '2018-12-21 10:34:08', '2018-12-21 10:34:08', 789.00, 789.00, 'Sem Multas');
      INSERT INTO public.boletos (condominio, id, status, unidade, mes, ano, datavencto, datapagto, valor, valorrecebido, observacoes) VALUES (2, 1, 1, 2, 2, 2018, '2018-12-21 10:34:08', '2018-12-21 10:34:08', 789.00, 789.00, 'Sem Multas');
      INSERT INTO public.boletos (condominio, id, status, unidade, mes, ano, datavencto, datapagto, valor, valorrecebido, observacoes) VALUES (1, 2, 1, 3, 3, 2018, '2018-12-21 10:34:08', '2018-12-21 10:34:08', 789.00, 789.00, 'Sem Multas');
      INSERT INTO public.boletos (condominio, id, status, unidade, mes, ano, datavencto, datapagto, valor, valorrecebido, observacoes) VALUES (1, 1, 1, 1, 1, 2018, '2018-12-21 10:34:08', '2018-12-21 10:34:08', 789.00, 789.00, 'Sem Multas');
      INSERT INTO public.boletos (condominio, id, status, unidade, mes, ano, datavencto, datapagto, valor, valorrecebido, observacoes) VALUES (2, 3, 1, 1, 1, 2018, '2018-12-21 10:34:08', '2018-12-21 10:34:08', 789.00, 789.00, 'Sem Multas');
      INSERT INTO public.boletos (condominio, id, status, unidade, mes, ano, datavencto, datapagto, valor, valorrecebido, observacoes) VALUES (1, 3, 1, 3, 1, 2018, '2018-12-21 10:34:08', '2018-12-21 10:34:08', 789.00, 789.00, 'Sem Multas');



      INSERT INTO public.condominios (contador, codigo, nome, cnpj, endereco, cep, diavencimento, inativo, datainclusao) VALUES (1, 1, 'Albana 2000', '98.100.237/0001-49', 'Praca Guarda Amaral', '21833311', 4, 'N', '2017-12-21 00:00:00');
      INSERT INTO public.condominios (contador, codigo, nome, cnpj, endereco, cep, diavencimento, inativo, datainclusao) VALUES (2, 2, 'Albana 2002', '98.100.237/0001-49', 'Praca Guarda Amaral', '21833311', 1, 'N', '2017-06-05 00:00:00');
      INSERT INTO public.condominios (contador, codigo, nome, cnpj, endereco, cep, diavencimento, inativo, datainclusao) VALUES (1, 3, 'Albana 43', '98.100.237/0001-49', 'Rua Guarda Amaral', '21833314', 2, 'N', '2016-06-06 00:00:00');




      INSERT INTO public.contadores (id, nome, endereco, telefone, email, bloquearboletosautomaticamente) VALUES (1, 'Thiago', 'Rua MB 23', '96874521', 'tg@gmail.com', 'N');
      INSERT INTO public.contadores (id, nome, endereco, telefone, email, bloquearboletosautomaticamente) VALUES (2, 'Jose', 'Rua MB 22', '96874987', 'js@gmail.com', 'N');




      INSERT INTO public.plano_contas (condominio, conta, nome, banco, agencia, contabancaria) VALUES (1, 'IluminaÃ§Ã£o', 'Brasil', 12, '1245', '78945-5');
      INSERT INTO public.plano_contas (condominio, conta, nome, banco, agencia, contabancaria) VALUES (2, 'IluminaÃ§Ã£o', 'Caixa', 13, '9874', '987411-9');




      INSERT INTO public.sindicos (condominio, id, sindico, datanascimento, cpf) VALUES (1, 1, 'Thiago Santos', '1997-06-02 00:00:00', '0553783654');
      INSERT INTO public.sindicos (condominio, id, sindico, datanascimento, cpf) VALUES (2, 2, 'Pedro Rogerio', '1990-06-02 00:00:00', '0553783655');
      INSERT INTO public.sindicos (condominio, id, sindico, datanascimento, cpf) VALUES (3, 3, 'Pedro Vieira', '1993-06-02 00:00:00', '0553783698');




      INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (1, 1, 1, '1', 'Joser Romario', '9874-5612', '118.973.824-48', 'iandanieldasneves-76@prodam.am.gov.br', 1);
      INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (1, 2, 1, '2', 'Giovanni Pedro Henrique Araújo', '(61) 2991-8907', '971.846.416-63', 'giovannipedrohenriquearaujo__giovannipedrohenriquearaujo@ruilacos.com.br', 10);
      INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (1, 3, 2, '1', 'Henrique Lorenzo Dias', '(55) 2721-2701', '977.214.969-93', 'henriquelorenzodias-84@agenciaph.com', 15);
      INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (1, 4, 2, '2', 'Sebastiana Fátima', '(95) 2757-6404', '656.492.788-65', 'iianjorgeoliveira@tce.am.gov.br', 10);
      INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (2, 1, 1, '1', 'Figuiere Romario', '9874-5612', '118.973.824-48', 'iandanieldasneves-76@prodam.am.gov.br', 1);
      INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (2, 2, 1, '2', 'Giov Pedo Henrique Araújo', '(61) 2991-8907', '971.846.416-63', 'giovannipedrohenriquearaujo__giovannipedrohenriquearaujo@ruilacos.com.br', 10);
      INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (2, 3, 2, '1', 'Henrique Lorenzo Dias', '(55) 2721-2701', '977.214.969-93', 'henriquelorenzodias-84@agenciaph.com', 15);
      INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (2, 4, 2, '2', 'Sebastiana Fátima', '(95) 2757-6404', '656.492.788-65', 'iianjorgeoliveira@tce.am.gov.br', 10);



      ALTER TABLE ONLY public.avisos
          ADD CONSTRAINT avisos_pkey PRIMARY KEY (condominio, id);



      ALTER TABLE ONLY public.blocos
          ADD CONSTRAINT blocos_pkey PRIMARY KEY (condominio, codigo);

      ALTER TABLE ONLY public.boletos
          ADD CONSTRAINT boletos_pkey PRIMARY KEY (condominio, id);



      ALTER TABLE ONLY public.condominios
          ADD CONSTRAINT condominios_pkey PRIMARY KEY (codigo);



      ALTER TABLE ONLY public.contadores
          ADD CONSTRAINT contadores_pkey PRIMARY KEY (id);



      ALTER TABLE ONLY public.plano_contas
          ADD CONSTRAINT plano_contas_pkey PRIMARY KEY (condominio, conta);



      ALTER TABLE ONLY public.sindicos
          ADD CONSTRAINT sindicos_pkey PRIMARY KEY (condominio, id);




      ALTER TABLE ONLY public.unidades
          ADD CONSTRAINT unidades_pkey PRIMARY KEY (condominio, id);



      ALTER TABLE ONLY public.avisos
          ADD CONSTRAINT fk_avisoscond FOREIGN KEY (condominio) REFERENCES public.condominios(codigo) ON DELETE CASCADE;



      ALTER TABLE ONLY public.blocos
          ADD CONSTRAINT fk_blocoscond FOREIGN KEY (condominio) REFERENCES public.condominios(codigo) ON DELETE CASCADE;




      ALTER TABLE ONLY public.boletos
          ADD CONSTRAINT fk_boletoscond FOREIGN KEY (condominio) REFERENCES public.condominios(codigo) ON DELETE CASCADE;



      ALTER TABLE ONLY public.boletos
          ADD CONSTRAINT fk_boletosund FOREIGN KEY (condominio, unidade) REFERENCES public.unidades(condominio, id) ON DELETE CASCADE;




      ALTER TABLE ONLY public.condominios
          ADD CONSTRAINT fk_condcontador FOREIGN KEY (contador) REFERENCES public.contadores(id) ON DELETE CASCADE;



      ALTER TABLE ONLY public.plano_contas
          ADD CONSTRAINT fk_planocontascond FOREIGN KEY (condominio) REFERENCES public.condominios(codigo) ON DELETE CASCADE;




      ALTER TABLE ONLY public.sindicos
          ADD CONSTRAINT fk_sindicoscond FOREIGN KEY (condominio) REFERENCES public.condominios(codigo) ON DELETE CASCADE;


      ALTER TABLE ONLY public.unidades
          ADD CONSTRAINT fk_unidadesbloco FOREIGN KEY (condominio, bloco) REFERENCES public.blocos(condominio, codigo) ON UPDATE CASCADE ON DELETE CASCADE;



      ALTER TABLE ONLY public.unidades
          ADD CONSTRAINT fk_unidadescond FOREIGN KEY (condominio) REFERENCES public.condominios(codigo) ON DELETE CASCADE;




      REVOKE ALL ON SCHEMA public FROM PUBLIC;
      REVOKE ALL ON SCHEMA public FROM postgres;
      GRANT ALL ON SCHEMA public TO postgres;
      GRANT ALL ON SCHEMA public TO PUBLIC;





# Especificação de Operações sobre o Banco de Dados


# Lista de Operações;

# 1. Duas consultas realizando duas operações diferentes sobre conjuntos (união, interseção ou diferença);

--1.2) Selecione o dia de todas as movimentações de blocos e unidades, maiores ou iguais ao dia 1
	
	SELECT public.unidades.diavencimento  from public.unidades where public.unidades.diavencimento >= 1 
	UNION
	SELECT public.condominios.diavencimento  from public.condominios where public.condominios.diavencimento >= 1 
	
--1.2) União de todos os avisos dos condominios junto ao seus  nomes como escalar

	SELECT public.condominios.nome FROM public.condominios 
	UNION
	SELECT public.avisos.texto FROM public.avisos;


# 2. Duas consultas aninhadas pela cláusula FROM;

--2.1) Gerando uma nova tabela na clausula from sem usar junções
	
	select conta_cond.*
		from (
		select cond.nome as  nomeContador, cont.nome as nome_cont
		from public.contadores  as cont, public.condominios as cond 
		where cond.codigo = cont.id

		) as conta_cond

# 3. quatro consultas envolvendo os operadores como IN, SOME, ANY, ALL, EXISTS e UNIQUE;

--3.1) selecione o nome todos moradores do bloco A

	select public.unidades.nomemorador
	from public.unidades
	where public.unidades.bloco in (select public.blocos.codigo from public.blocos where public.blocos.nome = 'A' )

--3.2) selecione o nome todos moradores do bloco A - sem usar in

	select public.unidades.nomemorador
	from public.unidades
	where public.unidades.bloco = any (select public.blocos.codigo from public.blocos where public.blocos.nome = 'A' )

--3.2) Existe algum algum boleto para o unidade 1 do bloco A, traga o valor dele

	SELECT public.boletos.valor
	FROM public.boletos
	WHERE EXISTS
	(SELECT bole.id 
	FROM public.boletos as bole 
	join public.unidades  as uni on  uni.id = bole.id
	where uni.id = 1 and uni.bloco = 1 )

--3.3) selecione o boleto com o maior valor de todos

	select public.boletos.valor, public.boletos.unidade
	from public.boletos 
	where public.boletos.valor >= all ( select public.boletos.valor from public.boletos )

--3.4) Selecione todos os boletos que tem valores maiores que a media de todos os boletos por unidade

	select avg(public.boletos.valor), public.boletos.unidade
	from public.boletos 
	where public.boletos.valor >= all ( select avg(public.boletos.valor) from public.boletos group by 	 
	public.boletos.unidade )
	group by public.boletos.unidade


# 4. uma consulta envolvendo a operação de junção definida na cláusula FROM;
	
--4.1) todos os blocos do condominio 1
	select * from public.condominios as cond join public.blocos  as bloc on cond.codigo = bloc.codigo


# 5. duas consultas envolvendo outer joins;

--5.1) todos avisos e todas as unidades
	
	select c.nome, a.texto from public.condominios c FULL OUTER JOIN public.avisos a on c.codigo = a.id

--5.2) todos os contadores e todos condominios		
	select c.nome, cont.nome from public.condominios c FULL OUTER JOIN public.contadores cont on c.codigo = cont.id

# 6. duas consultas envolvendo agrupamentos e agregações;

--6.1 - media de todos boletos por mês

	select avg(public.boletos.valor), boletos.mes from public.boletos group by public.boletos.mes
--6.2 - maior boleto 

	select max(public.boletos.valor) from public.boletos

# 7. uma consulta envolvendo a cláusula HAVING;

--7.1) Quantidades de boletos  agrupados por mês, nos meses anteriores a junho 

		select count(*) as me, b.mes 
		from public.boletos as b
		group by b.mes
		having mes < 6

# 8. duas operações de inserção, sendo que pelo menos uma deverá envolver mais de uma tabela, isto é, tabelas envolvidas em restrições de integridade;

--7.1) Inserir um aviso para o condominio 1.

	INSERT INTO public.avisos (condominio, id, resumo, datainicial, datafinal, texto) VALUES (1, 1, 'Eleições', '2018-12-21 10:24:41', '2019-12-21 10:24:41', 'Participe das Eleições de sindico');
	
--7.1) Inserir um bloco para o condomio 1.

	INSERT INTO public.blocos (condominio, codigo, nome, nomepesquisa) VALUES (1, 1, 'A', 'Bloco A');
	
# 9. duas operações de deleção, sendo que pelo menos uma deverá envolver mais de uma tabela, isto é, tabelas envolvidas em restrições de integridade;

--9.1) Deletando todos os  boltros da unidades do bloco 1
	
	delete from unidades using boletos where unidades.bloco = 1 and unidades.id = boletos.unidade;

--9.1) deltetando todos os avisos do condominio 1
	
	delete from avisos as av where av.condominio = 1;	

# 10. duas operações de modificação, sendo que pelo menos uma deverá envolver mais de uma tabela, isto é, tabelas envolvidas em restrições de integridade;
	
--10.1) Alterando o nome do condomidio 1 para 'FLAMBOYANT'
	
		update condominios
		set nome= 'FLAMBOYANT'
		WHERE CODIGO=1
		
--11.1) Alterado todos os avisos dos condominio 1
		
		UPDATE avisos as c
		SET resumo = 'Novo'
		FROM condominios
		WHERE condominio = codigo and comdomio = 1;
	
# 11. criação de duas visões;

--11.1) Criar uma visão com todos o codigo de todos os seus contadores.

	CREATE VIEW CONTGERAL as 
	select contador  ,codigo 
	from condominios as cond inner join contadores as cont on cond.contador = cont.id
	
--11.2)Criar uma visão com codigo do condomio, unidade, nome do morador e seus blocos.

	create view bloc_uni as 
	select condominio,codigo,unidade,nomemorador
	from blocos natural join unidades
