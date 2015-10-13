require 'open-uri'

class Searcher
  BASE_URL = 'https://www.walmart.com/reviews/product'

  def initialize item_id, keywords
    @item_id = item_id
    @keywords = keywords.to_s.split ' '
  end

  def reviews_with_keywords
    return reviews_for_item if @keywords.blank?
    reviews_for_item.select {|review| contains_keyword?(review) }
  end

  private

  def reviews_for_item
    url = BASE_URL + "/#{@item_id}"
    html = Nokogiri::HTML(open(url).read)
    html.css('.js-customer-review-text').map {|p| p.text }
  end

  def contains_keyword? review
    keyword_found = false
    @keywords.each do |keyword|
      unless review.match(Regexp.new(keyword, 'i')).nil?
        keyword_found = true
        break
      end
    end
    keyword_found
  end
end
