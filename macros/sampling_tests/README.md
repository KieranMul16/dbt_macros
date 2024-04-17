# BigQuery Sampling to reduce usage

Macro or generic directory can contain SQL templates to override the default tests.

The `not_null_50` test is an example where the `TABLESAMPLE` feature of BigQuery can be used to reduce the dataset size of the test.

We have chosen to tell `not_null` at 100% for all staging tables, then taper this coverage down as you move upwards through the warehouse.
