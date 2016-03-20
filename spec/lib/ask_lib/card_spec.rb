require 'spec_helper'

# Alexa Skills Kit
module ASKLib
  describe Card do
    describe '#initialize' do
      let(:invalid_type) { 'Invalid' }
      let(:valid_type) { 'Simple' }
      let(:title) { 'Title' }
      let(:content) { 'Content' }

      it 'is initialize with a type, a title and content' do
        card = Card.new(valid_type, title, content)
        expect(card.type).to eq valid_type
        expect(card.title).to eq title
        expect(card.content).to eq content
      end

      it 'raises an error if an invalid type is provided' do
        expect do
          Card.new(invalid_type, title, content)
        end.to raise_error Card::InvalidTypeError
      end
    end
  end
end
