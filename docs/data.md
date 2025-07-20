# URA

## Private Residential Property Transactions

> Update Frequency: End of day of every Tuesday and Friday

Update every Wed & Sat

Batch numbers

- 1
- 2
- 3
- 4

[URA API](https://eservice.ura.gov.sg/maps/api/#private-residential-property)


```sh
curl "https://eservice.ura.gov.sg/uraDataService/insertNewToken/v1"\
  -H "AccessKey: <MY-ACCESS-KEY>"

curl "https://eservice.ura.gov.sg/uraDataService/invokeUraDS/v1?service=PMI_Resi_Transaction&batch=1"\
  -H "AccessKey: <MY-ACCESS-KEY>"\
  -H "Token: <MY-TOKEN>" > /docker/clickhouse/data/batch_one.json
```


# LTA

## Train Station Codes and Chinese Names

[MRT Station](https://datamall.lta.gov.sg/content/datamall/en/static-data.html)


```sh
in2csv 'Train Station Codes and Chinese Names.xls' > train.csv
```
