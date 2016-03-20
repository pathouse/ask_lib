require 'spec_helper'

# Alexa Skills Kit
module ASKLib
  describe Session do
    let(:new) { true }
    let(:id) { 'id' }
    let(:application_id) { 'applicationId' }
    let(:attributes) { { 'attributeName' => 'attributeValue' } }
    let(:user) { { 'userId' => 'user id' } }
    let(:session_json) do
      {
        'new' => new,
        'id' => id,
        'application' => {
          'applicationId' => application_id
        },
        'attributes' => attributes,
        'user' => user
      }
    end

    describe '#initialize' do
      let(:new) { true }
      let(:id) { 'id' }
      let(:application_id) { 'applicationId' }
      let(:attributes) { { 'attributeName' => 'attributeValue' } }
      let(:user) { { 'userId' => 'user id' } }

      it 'accepts a new boolean, id, app id, attributes, and a user' do
        session = Session.new(session_json)
        expect(session.new).to eq new
        expect(session.id).to eq id
        expect(session.application_id).to eq application_id
        expect(session.attributes).to eq attributes
        expect(session.user).to be_a User
      end
    end

    describe '#update' do
      it 'allows session attributes to be updated' do
        session = Session.new(session_json)
        session.update('newThing' => 1)
        expect(session.attributes['newThing']).to eq 1
      end
    end
  end
end
