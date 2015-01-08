require "Nokogiri"

require_relative "./lib/noko_parser"
require_relative "./lib/review"

nokogiri_file = NokoParser.file_loader("./data/fat-angel.html")
my_review = Review.new(nokogiri_file)
p my_review.text_content
