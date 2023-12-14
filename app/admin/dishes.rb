ActiveAdmin.register Dish do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :price, :restaurant_id, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :restaurant_id, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    column 'Dish id', :id
    column :name
    column :image do |obj|
      image_tag (obj&.image), width: 75, height: 75 rescue nil
    end
    column :price
    column 'Rest. Name', :restaurant_id do |obj|
      obj&.restaurant&.name
    end
    column 'Catg. Name', :category_id do |obj|
      obj&.category&.name
    end
    actions
  end

  filter :id, label: 'Dish id'
  filter :name
  filter :price
  filter :restaurant, as: :select
  filter :category, as: :select

  show do
    attributes_table do
      row :id
      row :name
      row :price
      row :restaurant_id do |obj|
        obj&.restaurant&.name
      end
      row :category_id do |obj|
        obj&.category&.name
      end
      row :image do |obj|
        image_tag (obj&.image), width: 75, height: 75 rescue nil
      end
    end
  end

  menu priority: 5
end
