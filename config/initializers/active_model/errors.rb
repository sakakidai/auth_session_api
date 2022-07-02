module ActiveModel
  class Errors
    def full_message_with_attribute
      attribute_names.map {|key| [key, full_messages_for(key)]}.to_h
    end
  end
end
