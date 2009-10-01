module DataMapper
  module Types
    class Encrypted < DataMapper::Type
      primitive String

      def self.load(value, property)
        return unless value
        RCrypt.decrypt(value, ::PRIVATE_KEY)
      end

      def self.dump(value, property)
        return unless value
        RCrypt.encrypt(value, ::PUBLIC_KEY)
      end

      def self.typecast(value, property)
        return value if value.is_a?(String)
        return value.to_s if value.respond_to? :to_s
        value
      end
    end
  end
end

