INSERT INTO public.contadores
(id, nome, endereco, telefone, email, bloquearboletosautomaticamente)
VALUES(1, 'Thiago'::character varying, 'Rua MB 23'::character varying, '96874521'::character varying, 'tg@gmail.com'::character varying, 'N'::character varying);

INSERT INTO public.contadores
(id, nome, endereco, telefone, email, bloquearboletosautomaticamente)
VALUES(2, 'Jose'::character varying, 'Rua MB 22'::character varying, '96874987'::character varying, 'js@gmail.com'::character varying, 'N'::character varying);

//ter sindicos primeiro
INSERT INTO public.sindicos (condominio, id, sindico, datanascimento, cpf) VALUES(1, 1, 'carro'::character varying, NULL::timestamp without time zone, 'ca'::character varying);

INSERT INTO public.unidades
(condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento)
VALUES(0, 0, 0, '', ''::character varying, ''::character varying, ''::character varying, ''::character varying, 0);

INSERT INTO public.sindicos
(condominio, id, sindico, datanascimento, cpf)
VALUES(1, 1, 'Josuel'::character varying, '26/04/1996'::timestamp without time zone, '598.136.707-54'::character varying);
INSERT INTO public.sindicos
(condominio, id, sindico, datanascimento, cpf)
VALUES(2, 2, 'Eleno'::character varying, '12/12/1992'::timestamp without time zone, '598.136.707-33'::character varying);


INSERT INTO public.plano_contas
(condominio, conta, nome, banco, agencia, contabancaria)
VALUES(1, 'Iluminação', 'Brasil'::character varying, 12, '1245'::character varying, '78945-5'::character varying);

INSERT INTO public.plano_contas
(condominio, conta, nome, banco, agencia, contabancaria)
VALUES(2, 'Iluminação', 'Caixa'::character varying, 13, '9874'::character varying, '987411-9'::character varying);


INSERT INTO public.condominios
(contador, codigo, nome, cnpj, endereco, cep, diavencimento, inativo, datainclusao)
VALUES(1, 1, 'Albana 2000'::character varying, '98.100.237/0001-49'::character varying, 'Praça Guarda Amaral'::character varying, '21833311'::character varying, 0, 'N'::bpchar, NULL::timestamp without time zone);
INSERT INTO public.condominios
(contador, codigo, nome, cnpj, endereco, cep, diavencimento, inativo, datainclusao)
VALUES(2, 2, 'Albana 2002'::character varying, '98.100.237/0001-49'::character varying, 'Praça Guarda Amaral'::character varying, '21833311'::character varying, 0, 'N'::bpchar, NULL::timestamp without time zone);



INSERT INTO public.avisos
(condominio, id, resumo, datainicial, datafinal, texto)
VALUES(1, 1, 'Eleição para sindico dia 09/06/2018'::character varying, '09/01/2018'::timestamp without time zone, '09/06/2018'::timestamp without time zone, 'Não se esqueçam de votar'::character varying);

INSERT INTO public.avisos
(condominio, id, resumo, datainicial, datafinal, texto)
VALUES(2, 2, 'Eleição para sindico dia 09/06/2018'::character varying, '09/01/2018'::timestamp without time zone, '09/06/2018'::timestamp without time zone, 'Não se esqueçam de votar'::character varying);


INSERT INTO public.blocos
(condominio, codigo, nome, nomepesquisa)
VALUES(1, 1, 'A'::character varying, 'Bloco A'::character varying);

INSERT INTO public.blocos
(condominio, codigo, nome, nomepesquisa)
VALUES(1, 2, 'B'::character varying, 'Bloco B'::character varying);

INSERT INTO public.blocos
(condominio, codigo, nome, nomepesquisa)
VALUES(2, 1, 'SA'::character varying, 'Bloco SA'::character varying);

INSERT INTO public.blocos
(condominio, codigo, nome, nomepesquisa)
VALUES(2, 2, 'SB'::character varying, 'Bloco SB'::character varying);



---INSERT INTO public.unidades
--(condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento)
--VALUES(1, 1, 1, '1', 'Joser Romario'::character varying, '9874-5612'::character varying, '118.973.824-48'::character varying, 'iandanieldasneves-76@prodam.am.gov.br'::character varying, 1);

INSERT INTO public.unidades
(condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento)
VALUES(1, 1, 1, '1', 'Joser Romario', '9874-5612', '118.973.824-48', 'iandanieldasneves-76@prodam.am.gov.br', 1);
INSERT INTO public.unidades
(condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento)
VALUES(1, 2, 1, '2', 'Giovanni Pedro Henrique Ara�jo', '(61) 2991-8907', '971.846.416-63', 'giovannipedrohenriquearaujo__giovannipedrohenriquearaujo@ruilacos.com.br', 10);
INSERT INTO public.unidades
(condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento)
VALUES(1, 3, 2, '1', 'Henrique Lorenzo Dias', '(55) 2721-2701', '977.214.969-93', 'henriquelorenzodias-84@agenciaph.com', 15);
INSERT INTO public.unidades
(condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento)
VALUES(1, 4, 2, '2', 'Sebastiana F�tima', '(95) 2757-6404', '656.492.788-65', 'iianjorgeoliveira@tce.am.gov.br', 10);

INSERT INTO public.unidades
(condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento)
VALUES(2, 1, 1, '1', 'Figuiere Romario', '9874-5612', '118.973.824-48', 'iandanieldasneves-76@prodam.am.gov.br', 1);
INSERT INTO public.unidades
(condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento)
VALUES(2, 2, 1, '2', 'Giov Pedo Henrique Ara�jo', '(61) 2991-8907', '971.846.416-63', 'giovannipedrohenriquearaujo__giovannipedrohenriquearaujo@ruilacos.com.br', 10);
INSERT INTO public.unidades
(condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento)
VALUES(2, 3, 2, '1', 'Henrique Lorenzo Dias', '(55) 2721-2701', '977.214.969-93', 'henriquelorenzodias-84@agenciaph.com', 15);
INSERT INTO public.unidades
(condominio, id, bloco, unidade, nomemorador, telefone, cnpj_cpf, email, diavencimento)
VALUES(2, 4, 2, '2', 'Sebastiana F�tima', '(95) 2757-6404', '656.492.788-65', 'iianjorgeoliveira@tce.am.gov.br', 10);


