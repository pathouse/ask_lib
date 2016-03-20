require 'spec_helper'

# Alexa Skills Kit
module ASKLib
  describe Intent do
    describe '#initialize' do
      let(:name) { 'TestIntent' }
      let(:slots) { { 'SlotA' => { 'name' => 'SlotA', 'value' => 'Value' } } }
      it 'is initialized with a name and a collection of slots' do
        intent = Intent.new('name' => name, 'slots' => slots)
        expect(intent.name).to eq name
        expect(intent.slots).to be_a Array
        expect(intent.slots.first.name).to eq slots.first.first
      end
    end
  end
end
