module Services
  module Phones
    class Create
      attr_reader :phone, :errors

      def initialize(params)
        @params = params
      end

      def call
        find_phone || create_phone
        @phone.errors.empty?
      end

      private

      def find_phone
        @phone = ::Phone.find_by(number: @params[:number])
      end

      def create_phone
        @phone = ::Phone.new(@params)
        return if @phone.save
        @errors = @phone.errors
      end
    end
  end
end
