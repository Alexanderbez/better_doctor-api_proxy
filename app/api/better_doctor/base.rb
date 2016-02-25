module BetterDoctor
  class Base < Grape::API

    # ----------------------------------------------------------------------- #
    #                                 Base API                                #
    # ----------------------------------------------------------------------- #

    helpers BetterDoctor::ApiHelpers
    prefix :api

    format :json
    content_type :json, 'application/json'
    # rescue_from :all
    # error_formatter :json, BetterDoctor::ErrorFormatter

    # Version 1 of the API
    mount BetterDoctor::V1::Base
  end
end
