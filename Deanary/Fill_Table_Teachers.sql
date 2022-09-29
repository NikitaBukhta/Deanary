USE DEANARYdb

GO

TRUNCATE TABLE TEACHERS

GO

INSERT TEACHERS VALUES
	('Tatiana', 'Butrianova', 'Ivanivna', ''),
	('Evgenia', 'Shulikova', 'Jurivna', ''),
	('Olexei', 'Nevski', 'Konstantinovich', ''),
	('Michail', 'Kobzar', 'Vasilievich', ''),
	('Valentina', 'Kivalova', 'Valerievna', ''),
	('Vladislav', 'Rubicon', 'Evgenevich', '')

GO

SELECT * FROM TEACHERS