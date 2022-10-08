USE DEANARYdb

GO

TRUNCATE TABLE TEACHERS

GO

INSERT TEACHERS VALUES
	('123456789', 'Tatiana', 'Butrianova', 'Ivanivna', ''),
	('234567890', 'Evgenia', 'Shulikova', 'Jurivna', ''),
	('345678901', 'Olexei', 'Nevski', 'Konstantinovich', ''),
	('456789012', 'Michail', 'Kobzar', 'Vasilievich', ''),
	('135792468', 'Valentina', 'Kivalova', 'Valerievna', ''),
	('357912468', 'Vladislav', 'Rubicon', 'Evgenevich', '')

GO

SELECT * FROM TEACHERS