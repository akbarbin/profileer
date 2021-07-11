module Services
  module Phones
    class Create
      attr_reader :phone, :errors

      def initialize(params)
        @params = params
        @errors = {}
      end

      def call
        find_phone || create_phone
        @errors.empty?
      end

      private

      def find_phone
        @phone = ::Phone.find_by(number: @params[:number])
      end

      def create_phone
        @phone = ::Phone.new(@params)
        @errors = @phone.errors unless @phone.save
        StatsWorker.perform_async
        @phone
      end
    end
  end
end
