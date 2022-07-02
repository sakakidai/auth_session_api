module HashConverter
  class << self
    def to_underscore(hash)
      convert(hash, :underscore)
    end

    def to_camel_case(hash)
      convert(hash, :camelize, :lower)
    end
    
    def convert(object, *method)
      case object
      when Hash
        object.inject({}) do |hash,(key,value)|
          hash[key.to_s.send(*method)] = convert(value, *method)
          hash
        end
      when Array
        object.map {|item| convert(item, *method) }
      else
        object
      end
    end
  end
end