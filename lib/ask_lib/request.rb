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
      @timestamp = body['timestamp']
      @reason_ended = body['reason']
      @intent = Intent.new(body['intent'])
    end

    def intent?
      @body['type'] == INTENT_REQUEST
    end

    def launch?
      @body['type'] == LAUNCH_REQUEST
    end

    def session_ended?
      @body['type'] == SESSION_ENDED_REQUEST
    end
  end
end
