declare @spid int

set @spid = 268 --����� ��������

SELECT  
		session_id				=	S.session_id
    ,	program_name			=	S.program_name
	,	login_name				=	S.login_name
	,	statement_executing		=	SUBSTRING(ST.text, R.statement_start_offset / 2, (CASE WHEN R.statement_end_offset = -1 THEN DATALENGTH(ST.text) ELSE R.statement_end_offset END - R.statement_start_offset) / 2)
	,	QueryPLan				=	CAST(TQP.query_plan AS XML)
FROM sys.dm_exec_sessions AS S
	INNER JOIN sys.dm_exec_requests AS R
		ON S.session_id = R.session_id
	CROSS APPLY sys.dm_exec_sql_text (R.sql_handle) AS ST
	CROSS APPLY sys.dm_exec_text_query_plan (R.plan_handle, R.statement_start_offset, R.statement_end_offset) AS TQP
WHERE	S.is_user_process = 1 and r.session_id = @spid