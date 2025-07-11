ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email, :image

  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :image, as: :file, hint: f.object.image.attached? ? image_tag(f.object.image, size: "100x100") : content_tag(:span, "No image uploaded")
    end
    f.actions
  end

  show do |customer|
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :image do
        if customer.image.attached?
          image_tag url_for(customer.image), size: "100x100"
        else
          "No image"
        end
      end
    end
  end

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email
    column :image do |customer|
      if customer.image.attached?
        image_tag url_for(customer.image), size: "50x50"
      else
        "No image"
      end
    end
    actions
  end
end
