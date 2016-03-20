module ASKLib
  # User. Value object for a user in Alexa requests.
  class User
    attr_reader :id, :access_token

    def initialize(user)
      @id = user['userId']
      @access_token = user['accessToken']
    end
  end
end
