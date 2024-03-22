{% macro list_tables_in_schema(schema) %}

{% set query_to_perform_on_table %}

/*developed on BigQuery syntax will differ for other
technologies.*/
select distinct table_name
from katkin-club.{{ schema }}.INFORMATION_SCHEMA.TABLES
-- Ignore if not using Fivetran
where table_name != 'fivetran_audit'

{% endset %}

{% set results = run_query(query_to_perform_on_table) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}
