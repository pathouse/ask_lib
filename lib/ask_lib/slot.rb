module ASKLib
  # Slot. Value object for slots sent with an intent.
  class Slot
    attr_reader :name, :value

    def initialize(slot)
      @name = slot['name']
      @value = slot['value']
    end
  end
end
