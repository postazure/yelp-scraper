require "Nokogiri"
require_relative "./lib/noko_parser"
require_relative "./lib/review"

noko_reviews = NokoParser.new("./data/fat-angel.html").reviews
review_objects = noko_reviews.map do |noko_review|
  Review.new(noko_review)
end

def star_ratings_brakedown(data)
  stars = {
    "1.0" => 0,
    "2.0" => 0,
    "3.0" => 0,
    "4.0" => 0,
    "5.0" => 0,
  }

  data.each do |review|
    stars[review.star_rating] = stars[review.star_rating].to_i + 1
  end

  stars
end

p star_ratings_brakedown(review_objects)
