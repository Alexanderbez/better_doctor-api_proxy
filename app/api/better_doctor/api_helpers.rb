module BetterDoctor
  module ApiHelpers
    extend Grape::API::Helpers

    # ----------------------------------------------------------------------#
    #                              API Helpers                              #
    # ----------------------------------------------------------------------#

    # Returns the request parameters that are filtered against the allowed
    # request parameters.
    #
    # @param options [Hash]
    # @return [Hashie::Mash]
    def permitted_params(options = {})
      options = { include_missing: false }.merge(options)

      declared(params, options)
    end

    # BetterDoctor external API version to proxy API mapping.
    # 
    # @return [String]
    def proxy_api_version
      @proxy_api_version ||= '2015-09-22'
    end

    # Constructs a base URL path object representing the BetterDoctor public
    # API.
    #
    # @return [URI::HTTPS]
    def base_path
      @base_path ||= URI::HTTPS.build(
        host: 'api.betterdoctor.com',
        path: "/#{proxy_api_version}"
      )
    end

    # Constructs a HTTP resource to be used to proxy all requests to the
    # BetterDoctor public API.
    def rest_resource
      @rest_resource ||= RestClient::Resource.new(base_path.to_s)
    end

  end
end
