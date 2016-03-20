module ASKLib
  # OutputSpeech. Class for managing output speech for Alexa responses
  class OutputSpeech
    class InvalidTypeError < StandardError; end
    TYPE_TEXT = 'PlainText'.freeze
    TYPE_SSML = 'SSML'.freeze

    attr_reader :text, :ssml, :type

    def initialize(type, content)
      @type = type
      validate_type!
      @text = content if text?
      @ssml = content if ssml?
    end

    def text?
      @type == TYPE_TEXT
    end

    def ssml?
      @type == TYPE_SSML
    end

    private

    def validate_type!
      valid_types = [TYPE_TEXT, TYPE_SSML]
      raise(InvalidTypeError, type) unless valid_types.include?(type)
    end
  end
end
