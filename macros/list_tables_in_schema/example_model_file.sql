/*This is a loop which targets the target schema.

We use the table name as an identifier as we concat all of
the tables together.*/

{%- set tables = utils_list_tables_in_schema('TARGET SCHEMA') -%}

{%- for table in tables %}

select

    coalesce(email, '') as natural_email_fk,
    {{ dbt_utils.generate_surrogate_key(
        ['email']
    ) -}} as email_fk,

    lower('{{- table }}') as csv_file_name,

    cast(dataset as string) as src_dataset,
    cast(meta as string) as meta

from tmp_csv_files.{{- table }}

{%- if not loop.last %}

union all

{% endif -%}

{% endfor %}
