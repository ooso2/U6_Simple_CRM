class Customer < ApplicationRecord
  has_one_attached :image

  # Allowlist attributes Ransack is allowed to search/filter
  def self.ransackable_attributes(auth_object = nil)
    [
      "id",
      "full_name",
      "email",
      "phone_number",
      "notes",
      "created_at",
      "updated_at"
    ]
  end

  # Allowlist ActiveStorage-related associations for filtering
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end
end
