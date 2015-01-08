class NokoParser
  def initialize(file)
    f = File.open(file)
    @data = Nokogiri::HTML(f)
  end
  def reviews
    data = @data.css("ul.reviews > li").map {|review| review}
    data
  end
end
