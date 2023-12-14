ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email, :encrypted_password, :type, :mobile, :address
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :encrypted_password, :type, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :mobile, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    column 'Customer id', :id
    column :name
    column :email
    column :mobile
    column :address
    column :type
    # column :created_at
    # column :updated_at
    actions
  end

  filter :id
  filter :name
  filter :email
  filter :mobile
  filter :address
  filter :type
  # filter :created_at
  # filter :updated_at



  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :encrypted_password
      f.input :mobile
      f.input :address
      f.input :type
    end
    f.actions
  end

  menu parent: 'Users'

end
