class Review
  attr_reader :text_content, :date, :star_rating, :author, :review_html
  def initialize(nokogiri_object, review_num = 0)
    review = nokogiri_object.css("ul.reviews").css("li")[review_num]

    @text_content = review.css(".review-content p").text
    @date = review.css("meta[itemprop='datePublished']").attr("content").value
    @star_rating = review.css("meta[itemprop='ratingValue']").attr("content").value
    @author = review.css("meta[itemprop='author']").attr("content").value
    @review_html = review.to_html
  end
end
