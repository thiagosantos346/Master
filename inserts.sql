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


