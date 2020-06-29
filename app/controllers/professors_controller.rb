class ProfessorsController < InheritedResources::Base

  def view
    @professor = Professor.find(params[:id])
  end

  def index
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
  end

  private

    def professor_params
      params.permit(:name, :position, :cabinet, :post_address, :email, :publications, :researches, :courses)
    end

end
