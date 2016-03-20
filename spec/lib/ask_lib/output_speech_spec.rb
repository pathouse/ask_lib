require 'spec_helper'

# Alexa Skills Kit
module ASKLib
  describe OutputSpeech do
    describe '#initialize' do
      let(:invalid_type) { 'Invalid' }
      let(:text_type) { 'PlainText' }
      let(:ssml_type) { 'SSML' }
      let(:text_content) { 'Text content.' }
      let(:ssml_content) { '<speak>SSML Content.</speak>' }

      it 'can be initialized with text' do
        output_speech = OutputSpeech.new(text_type, text_content)
        expect(output_speech.text?).to eq true
        expect(output_speech.text).to eq text_content
      end

      it 'can be initialized with ssml' do
        output_speech = OutputSpeech.new(ssml_type, ssml_content)
        expect(output_speech.ssml?).to eq true
        expect(output_speech.ssml).to eq ssml_content
      end

      it 'raises an error when passed an invalid type' do
        expect do
          OutputSpeech.new(invalid_type, text_content)
        end.to raise_error OutputSpeech::InvalidTypeError
      end
    end
  end
end
