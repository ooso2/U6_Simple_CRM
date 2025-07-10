# Create this file: app/models/active_storage/attachment.rb
# Or add this method to your existing ActiveStorage::Attachment model

# Ensure this file only reopens the class if it already exists, to avoid redefining it and causing errors.
Rails.application.config.to_prepare do
  ActiveStorage::Attachment.class_eval do
    # Define which attributes can be searched by Ransack
    def self.ransackable_attributes(auth_object = nil)
      [
        "blob_id",
        "created_at", 
        "id",
        "name",
        "record_id",
        "record_type"
      ]
    end

    # If you also need to search associations, add this method
    def self.ransackable_associations(auth_object = nil)
      [
        "blob",
        "record"
      ]
    end
  end
end