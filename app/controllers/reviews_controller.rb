class ReviewsController < ApplicationController
  def new
    @grandparent = Grandparent.find(params[:grandparent_id])
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.grandparent = Grandparent.find(params[:grandparent_id])
    @review.save
  end

  private
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
