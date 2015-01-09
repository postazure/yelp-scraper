require "Nokogiri"
require "RestClient"
require "Mechanize"
require "pry"
require_relative "./lib/noko_parser"
require_relative "./lib/review"
source_url = "http://www.yelp.com/biz/fat-angel-san-francisco"
web_data = RestClient.get(source_url, user_agent: "Chrome")
# web_data = RestClient.get("http://www.google.com")
noko_file = NokoParser.new(web_data)
# noko_file = NokoParser.new(File.open("./data/fat-angel.html"))
noko_reviews = noko_file.reviews

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
# p noko_file.details
p star_ratings_brakedown(review_objects)
# puts review_objects.count
