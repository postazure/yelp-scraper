class Review
  attr_reader :text_content, :date, :star_rating, :author, :review_html
  def initialize(noko)
    @noko = noko
    @text_content = noko.css("div.review-content p").text
    @date = extract_meta("datePublished")
    @star_rating = extract_meta("ratingValue")
    @author = extract_meta("author")
    @review_html = noko.to_html
  end

  def five_star?
    star_rating.to_i == 5
  end

  private

  def extract_meta(property)
    @noko.css("meta[itemprop='#{property}']").attr("content").value
  end
end
