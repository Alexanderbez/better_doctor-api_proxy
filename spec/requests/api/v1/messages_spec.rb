require 'spec_helper'

# --------------------------------------------------------------------------- #
#                               Request Helpers                               #
# --------------------------------------------------------------------------- #

describe BetterDoctor::V1 do
  it 'does not accept missing API key HTTP header' do
    # Perform request with missing API key HTTP header
    get '/api/v1/doctors/search'

    # Verify correct status code
    expect(response.status).to eq(401)

    # Verify response body
    expect(json['response_type']).to eq('error')
    expect(json['response']).to eq('Unauthorized')
  end

  it 'returns proper response on invalid API key HTTP header' do
    # Perform request with missing API key HTTP header
    get '/api/v1/doctors/search', headers: {'X-Api-Key' => 'nil'}

    # Verify correct status code
    expect(response.status).to eq(401)

    # Verify response body
    expect(json['response_type']).to eq('error')
    expect(json['response']['meta']['error']).to eq(true)
    expect(json['response']['meta']['message']).to eq('Invalid user_key')
    expect(json['response']['meta']['error_code']).to eq(1000)
  end
end
