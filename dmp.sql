--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.20
-- Dumped by pg_dump version 9.4.20
-- Started on 2018-12-21 11:38:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2089 (class 1262 OID 16393)
-- Name: proj_final; Type: DATABASE; Schema: -; Owner: postgres
--

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

--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2092 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 16394)
-- Name: avisos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.avisos (
    condominio integer NOT NULL,
    id integer NOT NULL,
    resumo character varying(80) DEFAULT NULL::character varying,
    datainicial timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    datafinal timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    texto character varying(16384) DEFAULT NULL::character varying
);


ALTER TABLE public.avisos OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16406)
-- Name: blocos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.blocos (
    condominio integer NOT NULL,
    codigo integer NOT NULL,
    nome character varying(60) DEFAULT ''::character varying,
    nomepesquisa character varying(60) DEFAULT NULL::character varying
);


ALTER TABLE public.blocos OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16413)
-- Name: boletos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

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

--
-- TOC entry 176 (class 1259 OID 16427)
-- Name: condominios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

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

--
-- TOC entry 177 (class 1259 OID 16438)
-- Name: contadores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.contadores (
    id integer NOT NULL,
    nome character varying(80) DEFAULT ''::character varying,
    endereco character varying(80) DEFAULT ''::character varying,
    telefone character varying(30) DEFAULT ''::character varying,
    email character varying(80) DEFAULT ''::character varying,
    bloquearboletosautomaticamente character varying(1) DEFAULT 'N'::character varying
);


ALTER TABLE public.contadores OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16448)
-- Name: plano_contas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.plano_contas (
    condominio integer NOT NULL,
    conta character varying(40) NOT NULL,
    nome character varying(80) DEFAULT ''::character varying,
    banco integer,
    agencia character varying(6) DEFAULT ''::character varying,
    contabancaria character varying(15) DEFAULT ''::character varying
);


ALTER TABLE public.plano_contas OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 16456)
-- Name: sindicos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.sindicos (
    condominio integer NOT NULL,
    id integer NOT NULL,
    sindico character varying(60) DEFAULT NULL::character varying,
    datanascimento timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    cpf character varying(14) DEFAULT NULL::character varying
);


ALTER TABLE public.sindicos OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16471)
-- Name: unidades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

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

--
-- TOC entry 2076 (class 0 OID 16394)
-- Dependencies: 173
-- Data for Name: avisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.avisos (condominio, id, resumo, datainicial, datafinal, texto) VALUES (1, 1, 'Eleições', '2018-12-21 10:24:41', '2019-12-21 10:24:41', 'Participe das Eleições de sindico');
INSERT INTO public.avisos (condominio, id, resumo, datainicial, datafinal, texto) VALUES (1, 2, 'Manutenção Elvevador', '2018-12-21 10:24:41', '2018-12-30 10:24:41', 'Somente o Elvador A irar Operar');
INSERT INTO public.avisos (condominio, id, resumo, datainicial, datafinal, texto) VALUES (2, 2, 'eleições para sindico dia 09/06/2018', '2018-01-09 00:00:00', '2018-06-09 00:00:00', 'NÃ£o se esqueÃ§am de votar');


--
-- TOC entry 2077 (class 0 OID 16406)
-- Dependencies: 174
-- Data for Name: blocos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.blocos (condominio, codigo, nome, nomepesquisa) VALUES (1, 1, 'A', 'Bloco A');
INSERT INTO public.blocos (condominio, codigo, nome, nomepesquisa) VALUES (1, 2, 'B', 'Bloco B');
INSERT INTO public.blocos (condominio, codigo, nome, nomepesquisa) VALUES (2, 1, 'SA', 'Bloco SA');
INSERT INTO public.blocos (condominio, codigo, nome, nomepesquisa) VALUES (2, 2, 'SB', 'Bloco SB');


--
-- TOC entry 2078 (class 0 OID 16413)
-- Dependencies: 175
-- Data for Name: boletos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.boletos (condominio, id, status, unidade, mes, ano, datavencto, datapagto, valor, valorrecebido, observacoes) VALUES (2, 2, 1, 2, 2, 2018, '2018-12-21 10:34:08', '2018-12-21 10:34:08', 789.00, 789.00, 'Sem Multas');
INSERT INTO public.boletos (condominio, id, status, unidade, mes, ano, datavencto, datapagto, valor, valorrecebido, observacoes) VALUES (2, 1, 1, 2, 2, 2018, '2018-12-21 10:34:08', '2018-12-21 10:34:08', 789.00, 789.00, 'Sem Multas');
INSERT INTO public.boletos (condominio, id, status, unidade, mes, ano, datavencto, datapagto, valor, valorrecebido, observacoes) VALUES (1, 2, 1, 3, 3, 2018, '2018-12-21 10:34:08', '2018-12-21 10:34:08', 789.00, 789.00, 'Sem Multas');
INSERT INTO public.boletos (condominio, id, status, unidade, mes, ano, datavencto, datapagto, valor, valorrecebido, observacoes) VALUES (1, 1, 1, 1, 1, 2018, '2018-12-21 10:34:08', '2018-12-21 10:34:08', 789.00, 789.00, 'Sem Multas');
INSERT INTO public.boletos (condominio, id, status, unidade, mes, ano, datavencto, datapagto, valor, valorrecebido, observacoes) VALUES (2, 3, 1, 1, 1, 2018, '2018-12-21 10:34:08', '2018-12-21 10:34:08', 789.00, 789.00, 'Sem Multas');
INSERT INTO public.boletos (condominio, id, status, unidade, mes, ano, datavencto, datapagto, valor, valorrecebido, observacoes) VALUES (1, 3, 1, 3, 1, 2018, '2018-12-21 10:34:08', '2018-12-21 10:34:08', 789.00, 789.00, 'Sem Multas');


--
-- TOC entry 2079 (class 0 OID 16427)
-- Dependencies: 176
-- Data for Name: condominios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.condominios (contador, codigo, nome, cnpj, endereco, cep, diavencimento, inativo, datainclusao) VALUES (1, 1, 'Albana 2000', '98.100.237/0001-49', 'Praca Guarda Amaral', '21833311', 4, 'N', '2017-12-21 00:00:00');
INSERT INTO public.condominios (contador, codigo, nome, cnpj, endereco, cep, diavencimento, inativo, datainclusao) VALUES (2, 2, 'Albana 2002', '98.100.237/0001-49', 'Praca Guarda Amaral', '21833311', 1, 'N', '2017-06-05 00:00:00');
INSERT INTO public.condominios (contador, codigo, nome, cnpj, endereco, cep, diavencimento, inativo, datainclusao) VALUES (1, 3, 'Albana 43', '98.100.237/0001-49', 'Rua Guarda Amaral', '21833314', 2, 'N', '2016-06-06 00:00:00');


--
-- TOC entry 2080 (class 0 OID 16438)
-- Dependencies: 177
-- Data for Name: contadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contadores (id, nome, endereco, telefone, email, bloquearboletosautomaticamente) VALUES (1, 'Thiago', 'Rua MB 23', '96874521', 'tg@gmail.com', 'N');
INSERT INTO public.contadores (id, nome, endereco, telefone, email, bloquearboletosautomaticamente) VALUES (2, 'Jose', 'Rua MB 22', '96874987', 'js@gmail.com', 'N');


--
-- TOC entry 2081 (class 0 OID 16448)
-- Dependencies: 178
-- Data for Name: plano_contas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.plano_contas (condominio, conta, nome, banco, agencia, contabancaria) VALUES (1, 'IluminaÃ§Ã£o', 'Brasil', 12, '1245', '78945-5');
INSERT INTO public.plano_contas (condominio, conta, nome, banco, agencia, contabancaria) VALUES (2, 'IluminaÃ§Ã£o', 'Caixa', 13, '9874', '987411-9');


--
-- TOC entry 2082 (class 0 OID 16456)
-- Dependencies: 179
-- Data for Name: sindicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sindicos (condominio, id, sindico, datanascimento, cpf) VALUES (1, 1, 'Thiago Santos', '1997-06-02 00:00:00', '0553783654');
INSERT INTO public.sindicos (condominio, id, sindico, datanascimento, cpf) VALUES (2, 2, 'Pedro Rogerio', '1990-06-02 00:00:00', '0553783655');
INSERT INTO public.sindicos (condominio, id, sindico, datanascimento, cpf) VALUES (3, 3, 'Pedro Vieira', '1993-06-02 00:00:00', '0553783698');


--
-- TOC entry 2083 (class 0 OID 16471)
-- Dependencies: 180
-- Data for Name: unidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (1, 1, 1, '1', 'Joser Romario', '9874-5612', '118.973.824-48', 'iandanieldasneves-76@prodam.am.gov.br', 1);
INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (1, 2, 1, '2', 'Giovanni Pedro Henrique Araújo', '(61) 2991-8907', '971.846.416-63', 'giovannipedrohenriquearaujo__giovannipedrohenriquearaujo@ruilacos.com.br', 10);
INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (1, 3, 2, '1', 'Henrique Lorenzo Dias', '(55) 2721-2701', '977.214.969-93', 'henriquelorenzodias-84@agenciaph.com', 15);
INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (1, 4, 2, '2', 'Sebastiana Fátima', '(95) 2757-6404', '656.492.788-65', 'iianjorgeoliveira@tce.am.gov.br', 10);
INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (2, 1, 1, '1', 'Figuiere Romario', '9874-5612', '118.973.824-48', 'iandanieldasneves-76@prodam.am.gov.br', 1);
INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (2, 2, 1, '2', 'Giov Pedo Henrique Araújo', '(61) 2991-8907', '971.846.416-63', 'giovannipedrohenriquearaujo__giovannipedrohenriquearaujo@ruilacos.com.br', 10);
INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (2, 3, 2, '1', 'Henrique Lorenzo Dias', '(55) 2721-2701', '977.214.969-93', 'henriquelorenzodias-84@agenciaph.com', 15);
INSERT INTO public.unidades (condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento) VALUES (2, 4, 2, '2', 'Sebastiana Fátima', '(95) 2757-6404', '656.492.788-65', 'iianjorgeoliveira@tce.am.gov.br', 10);


--
-- TOC entry 1943 (class 2606 OID 16405)
-- Name: avisos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.avisos
    ADD CONSTRAINT avisos_pkey PRIMARY KEY (condominio, id);


--
-- TOC entry 1945 (class 2606 OID 16412)
-- Name: blocos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.blocos
    ADD CONSTRAINT blocos_pkey PRIMARY KEY (condominio, codigo);


--
-- TOC entry 1947 (class 2606 OID 16426)
-- Name: boletos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.boletos
    ADD CONSTRAINT boletos_pkey PRIMARY KEY (condominio, id);


--
-- TOC entry 1949 (class 2606 OID 16437)
-- Name: condominios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.condominios
    ADD CONSTRAINT condominios_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1951 (class 2606 OID 16447)
-- Name: contadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.contadores
    ADD CONSTRAINT contadores_pkey PRIMARY KEY (id);


--
-- TOC entry 1953 (class 2606 OID 16455)
-- Name: plano_contas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.plano_contas
    ADD CONSTRAINT plano_contas_pkey PRIMARY KEY (condominio, conta);


--
-- TOC entry 1955 (class 2606 OID 16463)
-- Name: sindicos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.sindicos
    ADD CONSTRAINT sindicos_pkey PRIMARY KEY (condominio, id);


--
-- TOC entry 1957 (class 2606 OID 16479)
-- Name: unidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.unidades
    ADD CONSTRAINT unidades_pkey PRIMARY KEY (condominio, id);


--
-- TOC entry 1958 (class 2606 OID 16480)
-- Name: fk_avisoscond; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avisos
    ADD CONSTRAINT fk_avisoscond FOREIGN KEY (condominio) REFERENCES public.condominios(codigo) ON DELETE CASCADE;


--
-- TOC entry 1959 (class 2606 OID 16485)
-- Name: fk_blocoscond; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blocos
    ADD CONSTRAINT fk_blocoscond FOREIGN KEY (condominio) REFERENCES public.condominios(codigo) ON DELETE CASCADE;


--
-- TOC entry 1960 (class 2606 OID 16490)
-- Name: fk_boletoscond; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boletos
    ADD CONSTRAINT fk_boletoscond FOREIGN KEY (condominio) REFERENCES public.condominios(codigo) ON DELETE CASCADE;


--
-- TOC entry 1961 (class 2606 OID 16495)
-- Name: fk_boletosund; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boletos
    ADD CONSTRAINT fk_boletosund FOREIGN KEY (condominio, unidade) REFERENCES public.unidades(condominio, id) ON DELETE CASCADE;


--
-- TOC entry 1962 (class 2606 OID 16500)
-- Name: fk_condcontador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominios
    ADD CONSTRAINT fk_condcontador FOREIGN KEY (contador) REFERENCES public.contadores(id) ON DELETE CASCADE;


--
-- TOC entry 1963 (class 2606 OID 16505)
-- Name: fk_planocontascond; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plano_contas
    ADD CONSTRAINT fk_planocontascond FOREIGN KEY (condominio) REFERENCES public.condominios(codigo) ON DELETE CASCADE;


--
-- TOC entry 1964 (class 2606 OID 16510)
-- Name: fk_sindicoscond; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sindicos
    ADD CONSTRAINT fk_sindicoscond FOREIGN KEY (condominio) REFERENCES public.condominios(codigo) ON DELETE CASCADE;


--
-- TOC entry 1965 (class 2606 OID 16520)
-- Name: fk_unidadesbloco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades
    ADD CONSTRAINT fk_unidadesbloco FOREIGN KEY (condominio, bloco) REFERENCES public.blocos(condominio, codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1966 (class 2606 OID 16525)
-- Name: fk_unidadescond; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades
    ADD CONSTRAINT fk_unidadescond FOREIGN KEY (condominio) REFERENCES public.condominios(codigo) ON DELETE CASCADE;


--
-- TOC entry 2091 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-12-21 11:38:00

--
-- PostgreSQL database dump complete
--

