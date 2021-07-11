module Services
  module Stats
    class Get
      def rows
        query = <<~SQL
          SELECT *
          FROM stats
        SQL
        connection = ApplicationRecord.connection.execute(query).to_a
      end
    end
  end
end
