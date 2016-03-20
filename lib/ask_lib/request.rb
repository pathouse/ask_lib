require 'ask_lib/session'
require 'ask_lib/intent'

module ASKLib
  # Request. Base class for all incoming requests from Alexa.
  class Request
    INTENT_REQUEST = 'IntentRequest'.freeze
    LAUNCH_REQUEST = 'LaunchRequest'.freeze
    SESSION_ENDED_REQUEST = 'SessionEndedRequest'.freeze

    attr_reader :version, :id, :session, :timestamp, :reason_ended, :intent

    def initialize(json)
      @version = json['version']
      @session = Session.new(json['session'])
      body = json['request']
      @id = body['requestId']
      @type = body['type']
      @timestamp = body['timestamp']
      @reason_ended = body['reason']
      @intent = Intent.new(body['intent']) if body['intent']
    end

    def intent?
      @type == INTENT_REQUEST
    end

    def launch?
      @type == LAUNCH_REQUEST
    end

    def session_ended?
      @type == SESSION_ENDED_REQUEST
    end
  end
end
