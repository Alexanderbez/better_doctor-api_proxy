module BetterDoctor
  class Base < Grape::API
    helpers BetterDoctor::ApiHelpers
    prefix :api

    format :json
    content_type :json, 'application/json'

    # Version 1 of the API
    mount BetterDoctor::V1::Base
  end
end
