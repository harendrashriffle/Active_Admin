ActiveAdmin.register User do

  permit_params :name, :email, :encrypted_password, :type, :mobile, :address
                # restaurant_attribute: [:name, :status, :location, :_destroy]

  index do
    selectable_column
    column 'User id', :id
    column :name
    column :email
    column :mobile, sortable: false
    column :address, sortable: false
    column :type
    actions
  end

  filter :id
  filter :name
  filter :email
  filter :mobile
  filter :address
  filter :type

  config.create_another = true

  form do |f|
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Details' do
        f.input :name
        f.input :email
        f.input :encrypted_password
        f.input :mobile
        f.input :address
        f.input :type
        end
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row(:name)
      row(:email)
      row(:mobile)
      row(:address)
      row(:type)
      row(:created_at)
      row(:updated_at)
    end

    div do
      simple_format :name
    end
  end

  # menu label: "Swiggy Users"
  menu priority: 2
end
