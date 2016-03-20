require 'spec_helper'

# Alexa Skills Kit
module ASKLib
  describe Request do
    let(:launch_request_json) do
      {
        'version' => '1.0',
        'session' => {
          'new' => true,
          'sessionId' => 'amzn1.echo-api.session.0000000-0000-0000-0000-00000000000',
          'application' => {
            'applicationId' => 'amzn1.echo-sdk-ams.app.000000-d0ed-0000-ad00-000000d00ebe'
          },
          'attributes' => {},
          'user' => {
            'userId' => 'amzn1.account.AM3B00000000000000000000000'
          }
        },
        'request' => {
          'type' => 'LaunchRequest',
          'requestId' => 'amzn1.echo-api.request.0000000-0000-0000-0000-00000000000',
          'timestamp' => '2015-05-13T12:34:56Z'
        }
      }
    end

    let(:session_ended_request_json) do
      {
        'version' => '1.0',
        'session' => {
          'new' => false,
          'sessionId' => 'amzn1.echo-api.session.0000000-0000-0000-0000-00000000000',
          'application' => {
            'applicationId' => 'amzn1.echo-sdk-ams.app.000000-d0ed-0000-ad00-000000d00ebe'
          },
          'attributes' => {
            'supportedHoroscopePeriods' => {
              'daily' => true,
              'weekly' => false,
              'monthly' => false
            }
          },
          'user' => {
            'userId' => 'amzn1.account.AM3B00000000000000000000000'
          }
        },
        'request' => {
          'type' => 'SessionEndedRequest',
          'requestId' => 'amzn1.echo-api.request.0000000-0000-0000-0000-00000000000',
          'timestamp' => '2015-05-13T12:34:56Z',
          'reason' => 'USER_INITIATED'
        }
      }
    end

    let(:intent_request_json) do
      {
        'version' => '1.0',
        'session' => {
          'new' => false,
          'sessionId' => 'amzn1.echo-api.session.0000000-0000-0000-0000-00000000000',
          'application' => {
            'applicationId' => 'amzn1.echo-sdk-ams.app.000000-d0ed-0000-ad00-000000d00ebe'
          },
          'attributes' => {
            'supportedHoroscopePeriods' => {
              'daily' => true,
              'weekly' => false,
              'monthly' => false
            }
          },
          'user' => {
            'userId' => 'amzn1.account.AM3B00000000000000000000000'
          }
        },
        'request' => {
          'type' => 'IntentRequest',
          'requestId' => ' amzn1.echo-api.request.0000000-0000-0000-0000-00000000000',
          'timestamp' => '2015-05-13T12:34:56Z',
          'intent' => {
            'name' => 'GetZodiacHoroscopeIntent',
            'slots' => {
              'ZodiacSign' => {
                'name' => 'ZodiacSign',
                'value' => 'virgo'
              }
            }
          }
        }
      }
    end

    describe '#initialize' do
      it 'accepts a launch request' do
        request = Request.new(launch_request_json)
        expect(request.launch?).to eq true
      end

      it 'accepts an intent request' do
        request = Request.new(intent_request_json)
        expect(request.intent?).to eq true
      end

      it 'accepts a session ended request' do
        request = Request.new(session_ended_request_json)
        expect(request.session_ended?).to eq true
      end
    end
  end
end
