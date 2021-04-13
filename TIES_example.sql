	
	-- Example TIES
	declare @goals table (id int identity, id_player int, time_ varchar(10))
	
	insert  @goals(id_player, time_) values(6,'45:12')
	insert  @goals(id_player, time_) values(6,'72:00')
	insert  @goals(id_player, time_) values(3,'74:42')
	insert  @goals(id_player, time_) values(2,'82:10')
	insert  @goals(id_player, time_) values(3,'84:19')


	-- without TIES
	select * 
	from @goals

	-- with TIES
	select	top 1 with TIES 
			id_player
		,	count(*) as Cnt
	from @goals
	group by id_Player
	order by count(*) desc