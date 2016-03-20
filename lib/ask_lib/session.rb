require 'ask_lib/user'

module ASKLib
  # Session. Class to manage sessions on requests.
  class Session
    attr_reader :new, :id, :application_id, :attributes, :user

    def initialize(session)
      @new = session['new']
      @id = session['id']
      @application_id = session['application']['applicationId']
      @attributes = session['attributes']
      @user = User.new(session['user'])
    end

    def update(new_attributes)
      @attributes.merge!(new_attributes)
    end
  end
end
