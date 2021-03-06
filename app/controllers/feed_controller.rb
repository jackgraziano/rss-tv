class FeedController < ApplicationController
  def update_news
    url = "http://www.valor.com.br/rss"
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

  def update_weather
    url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22sao%20paulo%2C%20sao%20paulo%2C%20brasil%22)%20%20and%20u%3D%27c%27&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
    weather = open(url).read

    respond_to do |format|
      format.json {render json: weather}
    end
  end


  def update_bbce

    pos1 = '359' # out
    pos2 = '357' # nov
    pos3 = '355' # dez
    pos4 = '111' # 4o tri

    url = "http://api.bbce.com.br/produto/#{pos1.to_s}/negocios"
    res1 = open(url)

    url = "http://api.bbce.com.br/produto/#{pos2.to_s}/negocios"
    res2 = open(url)

    url = "http://api.bbce.com.br/produto/#{pos3.to_s}/negocios"
    res3 = open(url)

    url = "http://api.bbce.com.br/produto/#{pos4.to_s}/negocios"
    res4 = open(url)


    respond_to do |format|
      format.json {render json: [res1, res2, res3, res4]}
    end
  end

end
