module ASKLib
  # Response. Class for building response to an Alexa request.
  class Response
    VERSION = '1.0'.freeze

    def self.for_request(request, output_speech: nil, card: nil, reprompt: nil)
      new(session: request.session,
          output_speech: output_speech,
          card: card,
          reprompt: reprompt)
    end

    def initialize(session: nil, output_speech: nil, card: nil, reprompt: nil)
      @session = session
      @version = VERSION
      @output_speech = output_speech
      @card = card
      @reprompt = reprompt
    end

    def as_json
      response = output_as_json.merge(card_as_json).merge(reprompt_as_json)
      {
        'version' => @version,
        'sessionAttributes' => @session.attributes,
        'response' => response
      }
    end

    def update_session(new_attributes)
      @session.update(new_attributes)
    end

    private

    def output_as_json
      {
        'outputSpeech' => {
          'type' => @output_speech.type,
          'text' => @output_speech.text,
          'ssml' => @output_speech.ssml
        }
      }
    end

    def card_as_json
      {
        'card' => {
          'type' => @card.type,
          'title' => @card.title,
          'content' => @card.content
        }
      }
    end

    def reprompt_as_json
      {
        'reprompt' => {
          'outputSpeech' => {
            'type' => @reprompt.type,
            'text' => @reprompt.text,
            'ssml' => @reprompt.ssml
          }
        }
      }
    end
  end
end
