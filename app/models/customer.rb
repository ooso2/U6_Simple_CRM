class Customer < ApplicationRecord
  # Active Storage
  has_one_attached :image

  # Ransack allowlist
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id full_name phone_number email notes created_at updated_at]
  end

  # Validations
  validates :full_name, presence: true
  validates :phone_number, presence: true, format: {
    with: /\A[\d\-\+\(\) ]{7,20}\z/,
    message: "must be a valid phone number"
  }
  validates :email, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: "must be a valid email address"
  }, allow_blank: true

  validate :acceptable_image

  def image_attached?
    image.attached?
  end

  def image_thumbnail
    return unless image.attached?
    image.variant(resize_to_limit: [100, 100]).processed
  end

  def image_or_default
    if image_attached?
      image_thumbnail
    else
      "/assets/default-avatar.png"  # Propshaft serves from /assets/
    end
  end

  private

  def acceptable_image
    return unless image.attached?

    unless image.content_type.in?(%w[image/jpeg image/png image/gif])
      errors.add(:image, "must be a JPEG, PNG, or GIF")
    end

    if image.byte_size > 5.megabytes
      errors.add(:image, "is too big (must be less than 5MB)")
    end
  end
end
