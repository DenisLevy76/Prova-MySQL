-- Autor: Denis Levy de Moura Cravo.
insert into cliente values
    -- cliente 1
	('594.829.410-20', 'Arnaldo Saccomani', '(80) 98579-2463', '(80) 3248-6573', 'Travessa Lourenço de Araujo', '68997-970', 'px. bar do seu Jorge', 258),
	-- cliente 2
	('274.955.420-98', 'Adam Sandler', '(91) 96854-8402', '(91) 8457-9023', 'Distrito de Fernandes Belo', '68622-971', 'ao lado da loja americanas', 862);
insert into carro values
	-- carro do cliente 1
	('HYY7737', 'Sedan', 2005, 'Chevrolet', '594.829.410-20'),
	-- carro do cliente 2
	('LWH7294', 'Eletrico', 2010, 'Tesla', '274.955.420-98');
insert into apolice values
	-- apolice do cliente 1
	(null, 1796.25, '2016-09-20', '2017-09-20', '594.829.410-20', 'HYY7737'),
	-- do cliente 2
	(null, 3578.99, '2019-04-14', '2020-04-14', '274.955.420-98', 'LWH7294');
insert into registroDeAcidente values 
	-- acidente do clitente 1
	(null, '2016-12-15', 'Vila Macdowell', '66040-088', 2784.00, 'HYY7737'),
	--acidente do cliente 2
	(null, '2019-06-30', 'Travessa Dez de Janeiro', '66833-356', 10589.65, 'LWH7294');
