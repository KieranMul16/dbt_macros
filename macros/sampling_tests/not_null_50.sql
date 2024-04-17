{% test not_null_50(model, column_name) %}

with validation as (

    select {{ column_name }} as not_null_field
    /*BigQuery sampling used to return random sub
    sets of the table to reduce usage.*/
    from {{ model }} TABLESAMPLE SYSTEM (50 PERCENT)

),

validation_errors as (

    select not_null_field
    from validation
    where not_null_field is null

)

select *
from validation_errors

{% endtest %}
