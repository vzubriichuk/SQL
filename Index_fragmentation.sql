	/*
	-- check index fragmentation

	avg_fragmentation_in_percent < 5			- OK
	avg_fragmentation_in_percent >=5 and <=30	- may be need improvement
	avg_fragmentation_in_percent > 30			- need to rebuild the index

	*/
	
	
	SELECT 
			NameTable		=	OBJECT_NAME(T1.object_id)
		,	IndexId			=	T1.index_id  
		,	IndexName		=	T2.name 
		,	Fragmentation	=	T1.avg_fragmentation_in_percent 
	FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS T1
		LEFT JOIN sys.indexes AS T2 
			ON T1.object_id = T2.object_id 
				AND T1.index_id = T2.index_id
