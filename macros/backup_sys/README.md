# Automated Backup System in dbt

```config at time of development:

db: Google BigQuery
dbt: dbt-bigquery==1.7.0
```

This system requires you to create two macros that override the default behaviour within dbt:

1. generate_alias_name()
2. generate_schema_name()

Both of these use a conditional searching for a variable being passed as part of the CLI command.

They allow the user to specify a target schema which is useful when keeping your backups separate to your production models. You will see that currently this is set to `backup_models` in the SQL.

A naming convention is also defined within the macros to prefix backups with a db friendly version of the date of backup, for example:

`backup_models.2024_01_01_my_model`

_Note, this was developed for BigQuery and syntax may differ for other technologies._

Below is the skeleton CLI command to identify which models to build and save into your target schema. Yes the `<model names>` can be replaced with a space separated list of model names. No this wont back up any models above or below your model within the DAG.

`> dbt run --fail-fast --select <model names> --vars 'back_up_model: true'`

You can take the skeleton CLI and apply to a new job within dbt Cloud to then act as your daily backup system.
