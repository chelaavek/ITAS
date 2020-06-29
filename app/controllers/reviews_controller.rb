class ReviewsController < InheritedResources::Base

  def new
      @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def create
    if can? :create, Review
    @review = Review.new(review_params)
    @review.admin_user_id = current_admin_user.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to reviews_path, notice: 'Review was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  def update
    if can? :update, Review
      @review = Review.find params[:id]
      respond_to do |format|
        if @review.update(review_params)
          format.html { redirect_to @review, notice: 'Review was successfully updated.' }
          format.json { render :show, status: :ok, location: @review }
        else
          format.html { render :edit }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private

    def review_params
      params.require(:review).permit(:title, :body, :rating)
    end

end
