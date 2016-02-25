module BetterDoctor
  module ErrorFormatter

    # ----------------------------------------------------------------------- #
    #                             Error Formatter                             #
    # ----------------------------------------------------------------------- #

    def self.call(message, backtrace, options, env)
      {
        :response_type => 'error',
        :response => message
      }.to_json
    end

  end
end
