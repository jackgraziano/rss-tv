class FeedController < ApplicationController
  def update_news
    url = "http://feeds.folha.uol.com.br/emcimadahora/rss091.xml"
    feed = Feedjira::Feed.fetch_and_parse url
    entries = feed.entries
    @news_array = []
    entries.each do |entry|
      @news_array << {title: entry.title, summary: entry.summary }
    end

    respond_to do |format|
      format.json {render json: @news_array}
    end
  end

  def update_quotes
    yahoo_client = YahooFinance::Client.new
    data = yahoo_client.quotes(
      ["USDBRL=X", "^BVSP"],
      [:ask, :bid, :last_trade_date, :last_trade_time, :change_in_percent, :last_trade_price]
    )
    @quote_usd = Quote.new(data[0].to_h)
    @quote_ibov = Quote.new(data[1].to_h);

    respond_to do |format|
      format.json {render json: [@quote_usd, @quote_ibov]}
    end

  end
end
