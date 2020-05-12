

	DROP TABLE IF EXISTS #table

	CREATE TABLE #table (
		num int
	)

	insert into #table values (1)

	BEGIN TRANSACTION;

		insert into #table values (2)

		SAVE TRANSACTION a;
		insert into #table values (4)


		IF 1=2
		BEGIN
		ROLLBACK TRANSACTION a;
			insert into #table values (5)
		END

	COMMIT TRANSACTION;


		select * 
		from #table