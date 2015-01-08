class NokoParser
  def self.file_loader(file)
    f = File.open(file)
    Nokogiri::HTML(f)
  end
end
