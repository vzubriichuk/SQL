
	CREATE FUNCTION [dbo].[timeDiff] 
	(
		-- Add the parameters for the function here
		@dateTimeStart DATETIME,
		@dateTimeStop DATETIME
	)
	RETURNS TIME
	AS
	BEGIN
		-- Declare the return variable here
		DECLARE	
			@durationHour AS INT,
			@durationMinute AS INT,
			@durationSecond AS INT,
			@durationMillisecond AS INT,
	
			@Hour INT,
			@Minute INT,
			@Second INT,
			@Millisecond INT,
	
			@HourText VARCHAR(MAX),
			@MinuteText VARCHAR(MAX) ,
			@SecondText VARCHAR(MAX),		
	
			@durationFullSecond INT,	
	
			@timeDiff TIME;

		-- Add the T-SQL statements to compute the return value here	
	
		SELECT @durationMillisecond = DATEDIFF(ms, @dateTimeStart, @dateTimeStop)
		SELECT @durationSecond = @durationMillisecond / 1000
		SELECT @durationMinute = @durationSecond / 60
		SELECT @durationHour = @durationMinute / 60  	

	
		SELECT @Hour = @durationHour
		SELECT @Minute = (@durationMinute - @durationHour*60)
		SELECT @Second = (@durationSecond - (@Minute*60 + @Hour*60*60))
		SELECT @Millisecond = (@durationMillisecond - (@Second*1000 + @Minute*60*1000 + @Hour*60*60*1000))
		

		SET @HourText = CASE WHEN LEN(CAST(@Hour AS VARCHAR(MAX))) < 2 THEN '0' + CAST(@Hour AS VARCHAR(MAX)) ELSE CAST(@Hour AS VARCHAR(MAX)) END
		SET @MinuteText = CASE WHEN LEN(CAST(@Minute AS VARCHAR(MAX))) < 2 THEN '0' + CAST(@Minute AS VARCHAR(MAX)) ELSE CAST(@Minute AS VARCHAR(MAX)) END
		SET @SecondText = CASE WHEN LEN(CAST(@Second AS VARCHAR(MAX))) < 2 THEN '0' + CAST(@Second AS VARCHAR(MAX)) ELSE CAST(@Second AS VARCHAR(MAX)) END
	
	

		SET @timeDiff = (@HourText + ':' + @MinuteText + ':' + @SecondText + '.' + CAST(@Millisecond AS VARCHAR(MAX)))

		-- Return the result of the function
		RETURN @timeDiff

	END

