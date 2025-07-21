

## Table

```sql
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
```

## Insert

```sql
INSERT INTO property.transactions
SELECT
  simpleJSONExtractString(result, 'project') AS project,
  simpleJSONExtractString(result, 'street') AS street,
  simpleJSONExtractString(result, 'marketSegment') AS market_segment,
  IF(
    simpleJSONHas(result, 'x'),
    simpleJSONExtractFloat(result, 'x'),
    NULL
  ) AS svy21_x,
  IF(
    simpleJSONHas(result, 'y'),
    simpleJSONExtractFloat(result, 'y'),
    NULL
  ) AS svy21_y,
  simpleJSONExtractString(transaction, 'propertyType') AS property_type,
  toUInt8(JSONExtractUInt(transaction, 'district')) AS district,
  simpleJSONExtractString(transaction, 'tenure') AS tenure,
  toUInt8(simpleJSONExtractUInt(transaction, 'typeOfSale')) AS type_of_sale,
  toUInt16(simpleJSONExtractUInt(transaction, 'noOfUnits')) AS no_of_units,
  toUInt32(simpleJSONExtractUInt(transaction, 'price')) AS price,
  IF(
    simpleJSONHas(transaction, 'nettPrice'),
    toUInt32(simpleJSONExtractUInt(transaction, 'nettPrice')),
    NULL
  ) AS nett_price,
  toUInt16(simpleJSONExtractUInt(transaction, 'area')) AS area,
  simpleJSONExtractString(transaction, 'typeOfArea') AS type_of_area,
  simpleJSONExtractString(transaction, 'floorRange') AS floor_range,
  toDate(
    parseDateTime(
      simpleJSONExtractString(transaction, 'contractDate'),
      '%m%y'
    )
  ) AS contract_date
FROM (
  SELECT
    arrayJoin(JSONExtractArrayRaw(get_trans('1'), 'Result')) AS result,
    arrayJoin(JSONExtractArrayRaw(result, 'transaction')) AS transaction
);
```