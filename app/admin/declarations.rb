ActiveAdmin.register Declaration do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :belongs_to_page, :body, pictures:[], documents:[]
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :belongs_to_page, as: :select, collection: Declaration::BELONGS_TO_PAGE.invert, :label_method => :belongs_to_page
      f.input :pictures, as: :file, input_html: { multiple: true }
      f.input :documents, as: :file, input_html: { multiple: true }
      f.actions
    end
  end

  show do
    attributes_table do
      row :title
      row :body
      row :belongs_to_page
      active_admin_comments
    end
  end
end
