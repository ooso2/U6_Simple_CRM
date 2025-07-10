ActiveAdmin.register Customer do
   config.filters = false
  permit_params :full_name, :phone_number, :email, :notes, :image

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  show do |customer|
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      row :image do
        if customer.image.attached?
          image_tag url_for(customer.image), size: "150x150"
        else
          "No image uploaded"
        end
      end
    end
  end
end

