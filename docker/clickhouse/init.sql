CREATE DATABASE property;

CREATE TABLE IF NOT EXISTS property.transactions
(
  project LowCardinality(String),
  street LowCardinality(String),
  market_segment LowCardinality(String),
  svy21_x Float64 NULL,
  svy21_y Float64 NULL,
  property_type LowCardinality(String),
  district UInt8,
  tenure LowCardinality(String),
  type_of_sale UInt8,
  no_of_units UInt16,
  price UInt32,
  nett_price UInt32 NULL,
  area UInt16,
  type_of_area LowCardinality(String),
  floor_range LowCardinality(String),
  contract_date Date
) ENGINE = MergeTree
ORDER BY project;


-- CREATE TABLE [IF NOT EXISTS] [db.]table_name [ON CLUSTER cluster]
-- (
--     name1 [type1] [NULL|NOT NULL] [DEFAULT|MATERIALIZED|EPHEMERAL|ALIAS expr1] [COMMENT 'comment for column'] [compression_codec] [TTL expr1],
--     name2 [type2] [NULL|NOT NULL] [DEFAULT|MATERIALIZED|EPHEMERAL|ALIAS expr2] [COMMENT 'comment for column'] [compression_codec] [TTL expr2],
--     ...
-- ) ENGINE = engine
--   [COMMENT 'comment for table']