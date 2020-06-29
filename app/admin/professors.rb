ActiveAdmin.register Professor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :image, :name, :position, :cabinet, :post_address, :email, :publications, :researches, :courses, :phone_number
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :position, :cabinet, :post_address, :email, :publications, :researches, :courses]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :name
      f.input :position
      f.input :cabinet
      f.input :post_address
      f.input :email
      f.input :publications
      f.input :researches
      f.input :courses
      f.input :phone_number
      f.input :image, as: :file
      f.actions
    end
  end

  show do
    attributes_table do
      row :name
      row :position
      row :cabinet
      row :post_address
      row :email
      row :publications
      row :researches
      row :courses
      row :phone_number
      row :image do |ad|
        image_tag url_for(ad.image) if ad.image.attached?
      end
      active_admin_comments
    end
  end
  
end
