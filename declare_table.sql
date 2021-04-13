	
	
	declare @table1 table (ID int)
	insert into @table1 values (1), (2)

	select * from @table1


	declare @table2 table (ID int)
	insert into @table2 values (1), (2)

	select * from @table2

	select count(*)
	from @table1, @table2