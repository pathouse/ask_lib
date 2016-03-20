require 'ask_lib/slot'

module ASKLib
  # Intent. Intent paremeters sent in a request.
  class Intent
    attr_reader :name, :slots

    def initialize(intent)
      @name = intent['name']
      @slots = intent['slots'].map { |_, slot| Slot.new(slot) }
    end
  end
end
