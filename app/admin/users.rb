ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  permit_params :name, :email, :encrypted_password, :type, :mobile, :address
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :encrypted_password, :type, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :mobile, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
    order_by(:id) do |item|
       if item.order == 'desc'
         [item.to_sql, 'NULLS LAST'].join(' ')
       else
         [item.to_sql, 'NULLS FIRST'].join(' ')
       end
    end

  index do
    selectable_column
    index_column
    id_column, order_by: 'asc'
    column :name
    column :email
    column :mobile, sortable: false
    column :address, sortable: false
    column :type
    column :created_at
    column :updated_at
    actions
    # actions do |profile|
    #   item "Profile", admin_user_path(profile), class:"member_link"
    # end
    # column "Profile" do |profile|
    #   link_to "Profile", admin_user_path(profile)
    # end
    # actions defaults: false do |post|
    #   item "View", admin_user_path(post)
    # end
    # actions dropdown: true  do |post|
    #   item "Preview", admin_user_path(post)
    # end
    # actions dropdown: true, defaults: false do |post|
    #   item "Preview", admin_user_path(post)
    # end
  end

  filter :id
  filter :name
  filter :email
  filter :mobile
  filter :address
  filter :type
  filter :created_at
  filter :updated_at



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
  end

  # controller do
  #   def scoped_collection
  #     super.includes :owner # prevents N+1 queries to your database
  #   end
  # end

  # csv do
  #   column :id
  #   # column(:name) { |post| post.name }
  #   # column(:email) { |post| post.email }
  #   # column(:mobile) { |post| post.mobile }
  #   # column(:address) { |post| post.address }
  #   # column(:type) { |post| post.type }
  #   column :name
  #   column :email
  #   column :mobile
  #   column :address
  #   column :type
  # end

  csv force_quotes: true, col_sep: ';', column_names: false do
    column :id
    column(:name) { |post| post.name }
  end

  controller do
    def csv_filename
      'User Details.csv' # save file with this name
    end
  end
end
