module Services
  module Abstract
    module Phones
      class Validate
        BASE_URL = 'https://phonevalidation.abstractapi.com/v1/'.freeze
        REQUEST_TIMEOUT = 2.minutes

        attr_reader :phone, :errors

        def initialize(number)
          @number = number
          @api_key = ENV['ABSTRACT_API_KEY']
          @errors = {}
        end

        def call
          @phone = find_phone || create_phone
          true
        rescue => e
          false
        end

        private

        def find_phone
          ::Phone.find_by(number: @number)
        end

        def create_phone
          response = send_request
          service = Services::Phones::Create.new(phone_params(response))
          return if service.call
          @errors = service.errors
          raise ActiveRecord::Rollback
        end

        def send_request
          params = { api_key: @api_key, phone: @number }
          response = conn.get('', params).body
          JSON.parse(response, symbolize_names: true)
        end

        def phone_params(response)
          {
            number: response[:phone],
            status: response[:valid],
            format: response[:format],
            country: response[:country],
            location: response[:location],
            phone_type: response[:type],
            carrier: response[:carrier]
          }
        end

        def conn
          @conn ||= Faraday.new(url: BASE_URL, request: { timeout: REQUEST_TIMEOUT })
        end
      end
    end
  end
end
