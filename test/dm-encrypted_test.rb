require 'test_helper'

class DmEncryptedTest < Test::Unit::TestCase
  context "A column of type Encrypted" do
    context "when passed a String" do
      setup do
        @raw = "secret"
        @result = DataMapper::Types::Encrypted.dump(@raw, :property)
      end

      should "encrypt the plaintext" do
        assert_not_equal @result, @raw
        assert_equal @result.length, 350
      end

      should "decrypt to the plaintext" do
        assert_equal DataMapper::Types::Encrypted.load(@result, :property), @raw
      end
    end

    context "when passed nil" do
      should "have nil ciphertext" do
        assert_nil DataMapper::Types::Encrypted.dump(nil, :property)
      end
    end

    context "when passed non-String values" do
      should "coerce numbers" do
        value = 1234
        assert_equal DataMapper::Types::Encrypted.typecast(value, :property), value.to_s
      end
    end
  end
end
