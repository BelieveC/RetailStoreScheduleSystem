# Dummy database populator

* **Database used** - Postgres 11
## Table Columns

| Column        | DataType          | Dummy value generation logic  |Example |
| ------------- |:-------------:| :---------------------------:|:----:|
| ID      | INT,Primary key | INT values starting from 1. |1|
| start      | TIMESTAMP without timezone      | <Current date + offset day(max 7 days)> <Time from 10 am to 8 pm>| 2019-06-17 13:02:18 |
| finish |  TIMESTAMP without timezone     |    start + duration |2019-06-17 16:02:18|
| duration |  REAL    |    random value (1-10) such that duration+start<20(8 pm) | 3|
|store_routine_id|char(10), FORIEGN KEY|routine prefix(gsr for gap scan)_randomInteger|gsr_1|


## Routine prefix table
| Prefix| Routine|        
| ------------- |:-------------:|
| gsr      | Gap Scan Routine |
| grr      | Gap Reset Routine     |
| gor | Gap Order Routine     | 
|cscr|Counting Scheduled Count|
|cor|Counting Overstock|
|cftcr|Counting fresh target count|
