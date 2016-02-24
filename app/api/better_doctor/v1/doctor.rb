module BetterDoctor
  module V1
    class Doctor < Grape::API

      LOG = Logging.logger[self]

      # ----------------------------------------------------------------------#
      #                            Doctors Resource                           #
      # ----------------------------------------------------------------------#

      resource :doctors do

        get '/search' do
          
        end

      end

    end
  end
end
