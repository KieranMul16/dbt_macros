# List Tables in Schema

We had a use case where a specific schema contained multi tables that needed to be concatenated and cleaned in order to form a base of a dbt model.

The tables names didn't follow a strict convention and although there was overlap between the columns in each table this also was not perfect.

This macro was designed to loop through the tables found within a schema and concatenate them together in an automated manner.

## list_tables_in_schema()

This macro used Bigquery syntax to identify the tables within a target schema. If there is a naming convention within your use case then this SQL could easily be expand to include/exclude certain tables.

The results of this macro can then be used as a jinja set.

`example_model_file.sql` is an example model file that uses the list of tables to loop through and ultimately concatenate together.

The example file demonstrates how we parsed through the original file name into the model which gives us a reliable thread when troubleshooting issues.

The example contains a mock `TARGET SCHEMA` which would need to be replaced with the schema containing your tables. Or, this could be further improved and it could be passed into the macro itself.
