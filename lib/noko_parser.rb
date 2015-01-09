class NokoParser
  def initialize(source)
    @data = Nokogiri::HTML(source)

  end
  def reviews
    pages = [@data]
    reviews = []
    pages.each do |page|
      page.css("ul.reviews > li").each {|review| reviews.push(review)}
    end
    reviews
  end
  def details
    @data.css("rating-details-histogram")
  end
  def all_reviews
    reviews = []
    next_page_links = @data.css("ul.pagination-links > li").css(".available-number")
    # only first 9
    next_page_links.each do |link|
      sleep(1.0)
      source = RestClient.get(link.attr("href"), user_agent: "Chrome")
      review_page = Nokogiri::HTML(source)
      # p link.attr("href")
      # p review_page.css("ul.reviews > li")[0]
      review_page.css("ul.reviews > li").each {|review| reviews.push(review)}
    end
    reviews
  end

end
