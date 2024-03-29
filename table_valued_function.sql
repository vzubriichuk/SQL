

	-- sample string delimiter function
	CREATE FUNCTION [dbo].[Split](@String nvarchar(MAX), @Delimiter char(1))  
		RETURNS @Results TABLE (ITEM nvarchar(MAX))  
	AS  
	BEGIN  
		  DECLARE @StartIndex INT, 
		  @EndIndex INT
		  SET @StartIndex = 1
		  IF SUBSTRING(@String, LEN(@String) - 1, LEN(@String)) <> @Delimiter
		  BEGIN
				SET @String = @String + @Delimiter
		  END

		  WHILE CHARINDEX(@Delimiter, @String) > 0
		  BEGIN
				SET @EndIndex = CHARINDEX(@Delimiter, @String)

				INSERT INTO @Results(ITEM)
				SELECT RTRIM(LTRIM(SUBSTRING(@String, @StartIndex, @EndIndex - 1)))

				SET @String = SUBSTRING(@String, @EndIndex + 1, LEN(@String))
		  END
		RETURN  
	END


	-- how to use
	DECLARE @t TABLE (item nvarchar(max))
	INSERT INTO @t values ('Hello, this is sample text, but bla-lba, bla.')

	SELECT *
	FROM @t
	CROSS APPLY dbo.Split(item, ',')

