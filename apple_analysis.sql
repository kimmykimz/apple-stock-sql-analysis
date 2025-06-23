--Dataset
SELECT *
FROM tutorial.aapl_historical_stock_price;

--The lowest and highest stock price each year
SELECT year,
       MIN(low) AS lowest_stock_price,
       MAX(high) AS highest_stock_price
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year
  ORDER BY year;
  
--Average closing price of the years, using 'ROUND' to round to 2 decimal places. Also, just learn about ::numeric(for postgreSQL database)
SELECT year,
       ROUND(AVG(close)::numeric,2) AS avg_closing_price --round function is not working, so ROUND(AVG(close),2) AS avg_closing_price 
FROM tutorial.aapl_historical_stock_price
GROUP BY year
ORDER BY year;

--months that had the highest average volume
SELECT month,
       AVG(volume) AS avg_monthly_volume
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY avg_monthly_volume DESC;
  
--average difference between opening and closing price each year
SELECT year,
       AVG(close - open) AS avg_difference
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year
  ORDER by year;
  
--the year apple stock was most volatile (average daily price swings)
SELECT year,
       AVG(high-low) AS average_daily_volatility
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year
  ORDER BY average_daily_volatility DESC;
