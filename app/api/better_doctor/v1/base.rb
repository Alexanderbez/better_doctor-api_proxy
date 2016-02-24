module BetterDoctor
  module V1
    class Base < Grape::API
      version 'v1', using: :path

      # Mount routes
      mount BetterDoctor::V1::Doctor
    end
  end
end
