module ASKLib
  # OutputSpeech. Class for managing output speech for Alexa responses
  class OutputSpeech
    TYPE_TEXT = 'text'.freeze
    TYPE_SSML = 'ssml'.freeze

    attr_reader :text, :ssml, :type

    def initialize(type, content)
      @type = type
      @text = content if text?
      @ssml = content if ssml?
    end

    def text?
      @type == TYPE_TEXT
    end

    def ssml?
      @type = TYPE_SSML
    end
  end
end
