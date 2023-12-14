ActiveAdmin.register Restaurant do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :status, :location, :user_id, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :status, :location, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    column 'Rest. id', :id
    column :image do |obj|
      image_tag (obj&.image), width: 120, height: 50 rescue nil
    end
    column 'Restaurant', :name
    column :location
    column :status
    actions
  end

  filter :id
  filter :name
  filter :location
  filter :status

  show do
    attributes_table do
      row :id
      row :name
      row :location
      row :status
      row :image do |obj|
        image_tag (obj&.image), width: 120, height: 50 rescue nil
      end
      # row :image
      row 'owner',:user_id.name
    end
  end

  # controller do
  #   def scoped_collection
  #     super.includes :owner # prevents N+1 queries to your database
  #   end
  # end

  form restaurant: 'Add Restaurant' do |f|
    inputs 'Details' do
      input :name
      input :status
      input :location
      # input :image, label: "Publish Post At"
      li "Created at #{f.object.created_at}" unless f.object.new_record?
      # input :category
    end
    panel 'Markup' do
      "The following can be used in the content below..."
    end
    inputs 'Content', :name
    para "Press cancel to return to the list without saving."
    actions
  end

  menu priority: 3

end
