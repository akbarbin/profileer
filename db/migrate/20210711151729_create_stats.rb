class CreateStats < ActiveRecord::Migration[6.1]
  def self.up
    query = <<~SQL
      CREATE MATERIALIZED VIEW stats AS
        WITH phones_created(quantity) AS (
          SELECT COUNT(*)
          FROM phones
        ), valid_phones(quantity) AS (
          SELECT COUNT(*)
          FROM phones
          WHERE phones.status = true
        ), invalid_phones(quantity) AS (
          SELECT COUNT(*)
          FROM phones
          WHERE phones.status = false
        ), board(type, quantity) AS (
          SELECT 'phones_created', phones_created.*
          FROM phones_created
          UNION ALL
          SELECT 'valid_phones', valid_phones.*
          FROM valid_phones
          UNION ALL
          SELECT 'invalid_phones', invalid_phones.*
          FROM invalid_phones
        )
        SELECT *
        FROM board
    SQL
    execute query
  end

  def self.down
    execute('DROP MATERIALIZED VIEW IF EXISTS stats')
  end
end
