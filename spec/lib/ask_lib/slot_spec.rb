require 'spec_helper'

# Alexa Skills Kit
module ASKLib
  describe Slot do
    describe '#initialize' do
      let(:name) { 'SlotName' }
      let(:value) { 'SlotValue' }

      it 'is initialized with a name and a value' do
        slot = Slot.new('name' => name, 'value' => value)
        expect(slot.name).to eq name
        expect(slot.value).to eq value
      end
    end
  end
end
