module Services
  module Stats
    class Refresh
      def call
        ApplicationRecord.connection.execute('REFRESH MATERIALIZED VIEW stats')
      end
    end
  end
end
