class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex[:publishable_token],
      secret_token: Rails.application.credentials.iex[:secret_token],
      endpoint: Rails.application.credentials.iex[:endpoint]
    )
    client.price(ticker_symbol)
    new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name,
        last_price: client.price(ticker_symbol))
  end
end
