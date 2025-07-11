Rails.application.config.to_prepare do
  if defined?(ActiveStorage::Attachment)
    ActiveStorage::Attachment.singleton_class.prepend(Module.new {
      def ransackable_attributes(auth_object = nil)
        %w[id name content_type created_at]
      end
    })
  end

  if defined?(ActiveStorage::Blob)
    ActiveStorage::Blob.singleton_class.prepend(Module.new {
      def ransackable_attributes(auth_object = nil)
        %w[id filename content_type metadata created_at]
      end
    })
  end
end
