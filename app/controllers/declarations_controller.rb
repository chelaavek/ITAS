class DeclarationsController < InheritedResources::Base

  def index
    belongs_to_page = params[:belongs_to_page]
    @declarations = Declaration.where(belongs_to_page: belongs_to_page)
  end

  private

    def declaration_params
      params.require(:declaration).permit(:title, :body, :belongs_to_page,
                                          pictures: [], documents: [])
    end

end
