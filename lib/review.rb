class Review
  attr_reader :text_content, :date, :star_rating, :author, :review_html
  def initialize(noko, review_num = 0)
    @noko = noko
    @review_num = review_num
    @text_content = extract_content.css("div.review-content p").text
    @date = extract_meta("datePublished")
    @star_rating = extract_meta("ratingValue")
    @author = extract_meta("author")
    @review_html = extract_content.to_html
  end

  def five_star?
    star_rating.to_i == 5
  end

  private
  def extract_content
    @noko.css("ul.reviews > li")[@review_num]
  end
  def extract_meta(property)
    extract_content.css("meta[itemprop='#{property}']").attr("content").value
  end
end
