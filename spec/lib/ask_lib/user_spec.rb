require 'spec_helper'

# Alexa Skills Kit
module ASKLib
  describe User do
    describe '#initialize' do
      let(:id) { 'id' }
      let(:access_token) { 'token' }

      it 'accepts an id and an access token' do
        user = User.new('userId' => id, 'accessToken' => access_token)
        expect(user.id).to eq id
        expect(user.access_token).to eq access_token
      end
    end
  end
end
