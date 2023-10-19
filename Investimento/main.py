
import yfinance as yf
import pandas as pd
import matplotlib.pyplot as plt

# Define the stock symbol and date range
stock_symbol = "AAPL"
start_date = "2023-01-01"
end_date = "2023-09-30"

# Retrieve stock data
stock_data = yf.download(stock_symbol, start=start_date, end=end_date)

# Calculate daily percentage change
stock_data['Daily % Change'] = stock_data['Close'].pct_change() * 100

# Print the first few rows of the data
print(stock_data.head())

# Calculate some basic statistics
mean_daily_return = stock_data['Daily % Change'].mean()
std_dev_daily_return = stock_data['Daily % Change'].std()

print(f"Mean Daily Return: {mean_daily_return:.2f}%")
print(f"Standard Deviation of Daily Return: {std_dev_daily_return:.2f}%")

# Visualize the daily returns
plt.figure(figsize=(10, 6))
plt.plot(stock_data['Daily % Change'])
plt.title(f'Daily Returns for {stock_symbol}')
plt.xlabel('Date')
plt.ylabel('Percentage Change')
plt.show()
