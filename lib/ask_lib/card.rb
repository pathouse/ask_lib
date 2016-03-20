module ASKLib
  # Card. Class for returning a card in an Alexa response
  class Card
    SIMPLE_TYPE = 'Simple'.freeze
    LINK_TYPE = 'LinkAccount'.freeze

    attr_reader :type, :title, :content

    def initialize(type, title, content)
      @type = type
      @title = title
      @content = content
    end
  end
end
