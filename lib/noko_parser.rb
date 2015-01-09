class NokoParser
  def initialize(source)
    @data = Nokogiri::HTML(source)
  end
  def reviews
    @data.css("ul.reviews > li").map {|review| review}
  end
  def details
    @data.css("rating-details-histogram")
  end
end
