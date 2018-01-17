class IexClient
  attr_accessor :stock_symbol
  BASE_URL = 'https://api.iextrading.com/1.0'

  def initialize(stock_symbol)
    @stock_symbol = stock_symbol.upcase
  end

  def all_symbols
    parse_response RestClient.get "#{BASE_URL}/ref-data/symbols"
  end

  def quote
    parse_response RestClient.get("#{BASE_URL}/stock/#{stock_symbol}/quote")
  end

  def stats
    parse_response RestClient.get("#{BASE_URL}/stock/#{stock_symbol}/stats")
  end

  def parse_response(response)
    JSON.parse(response.body)
  end

end