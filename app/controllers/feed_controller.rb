class FeedController < ApplicationController
  def update
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
end
