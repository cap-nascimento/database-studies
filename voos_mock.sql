
INSERT INTO public."Aviao"(numero_serie, modelo) VALUES(1, 'Boeing 777');
INSERT INTO public."Aviao"(numero_serie, modelo) VALUES(2, 'Boeing 727');
INSERT INTO public."Aviao"(numero_serie, modelo) VALUES(3, 'Legacy 180');

INSERT INTO public."Assento"(codigo_posicao, classe_assento, "numero_serie_Aviao") VALUES(1, 'econômica', 1);
INSERT INTO public."Assento"(codigo_posicao, classe_assento, "numero_serie_Aviao") VALUES(2, 'econômica', 2);
INSERT INTO public."Assento"(codigo_posicao, classe_assento, "numero_serie_Aviao") VALUES(3, 'econômica', 3);
INSERT INTO public."Assento"(codigo_posicao, classe_assento, "numero_serie_Aviao") VALUES(4, 'executiva', 1);
INSERT INTO public."Assento"(codigo_posicao, classe_assento, "numero_serie_Aviao") VALUES(5, 'executiva', 2);
INSERT INTO public."Assento"(codigo_posicao, classe_assento, "numero_serie_Aviao") VALUES(6, 'executiva', 3);

INSERT INTO public."Aeroporto"(codigo, nome, endereco) VALUES(1, 'Juscelino Kubitschek', 'Lago Sul - DF');
INSERT INTO public."Aeroporto"(codigo, nome, endereco) VALUES(2, 'Galeão', 'Rio de Janeiro - RJ');
INSERT INTO public."Aeroporto"(codigo, nome, endereco) VALUES(3, 'Santos Dumont', 'Rio de Janeiro - RJ');
INSERT INTO public."Aeroporto"(codigo, nome, endereco) VALUES(4, 'Congonhas', 'Av. Washington Luís - SP');
INSERT INTO public."Aeroporto"(codigo, nome, endereco) VALUES(5, 'Campo de Marte', 'Av. Santos Dumont - SP');

INSERT INTO public."Voo"(numero, comissario, piloto, "numero_serie_Aviao", "codigo_Aeroporto", "codigo_Aeroporto1")
VALUES(1, 'José da Silva', 'Bruce de Souza', 1, 1, 2);

INSERT INTO public."Voo"(numero, comissario, piloto, "numero_serie_Aviao", "codigo_Aeroporto", "codigo_Aeroporto1")
VALUES(2, 'Maria Madalena', 'Emiliano Dickinson', 2, 2, 5);

INSERT INTO public."Passageiro"(cpf, nome, sobrenome, documento_identidade, 
telefone, idade, data_nascimento, endereco, codigo, "codigo_posicao_Assento")
VALUES('000.000.000-00', 'John', 'Doe', '000.0000', '9999999-999', 33, '30/07/1997', 'Samambaia-DF', 1, 1);

INSERT INTO public."Passageiro"(cpf, nome, sobrenome, documento_identidade, 
telefone, idade, data_nascimento, endereco, codigo, "codigo_posicao_Assento")
VALUES('000.000.000-01', 'Jane', 'Doe', '000.0001', '8888888-999', 33, '19/03/1993', 'Guará-DF', 2, 4);

