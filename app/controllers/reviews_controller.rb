class ReviewsController < ApplicationController
  def form
  end

  def search
    searcher = Searcher.new search_params[:item_id], search_params[:keywords]
    @reviews = searcher.reviews_with_keywords
  end

  private

  def search_params
    params.require(:search).permit :item_id, :keywords
  end

  def get_all_reviews

  end

  def find_by_keyword reviews

  end
end
