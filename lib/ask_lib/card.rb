module ASKLib
  # Card. Class for returning a card in an Alexa response
  class Card
    class InvalidTypeError < StandardError; end

    SIMPLE_TYPE = 'Simple'.freeze
    LINK_TYPE = 'LinkAccount'.freeze

    attr_reader :type, :title, :content

    def initialize(type, title, content)
      @type = type
      validate_type!
      @title = title
      @content = content
    end

    private

    def validate_type!
      valid_types = [SIMPLE_TYPE, LINK_TYPE]
      raise(InvalidTypeError, type) unless valid_types.include?(type)
    end
  end
end
