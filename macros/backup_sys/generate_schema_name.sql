-- https://docs.getdbt.com/docs/build/custom-schemas
{% macro generate_schema_name(custom_schema_name=none, node=none) -%}

    {%- set default_schema = target.schema -%}

    {%- if node.name in invocation_args_dict['select'] and var("back_up_model", false) == true -%}

        {# If the model name is part of the select CLI command and a variable
        called back_up_model is passed then we want to insert this table into the
        back dataset in BigQuery. #}
        {%- set back_schema = 'backup_models' -%}
        {{ back_schema }}

    {%- elif custom_schema_name is none -%}

        {# If no custom schema names have been passed then use the default.#}
        {{ default_schema }}

    {%- else -%}

        {# If a custom schema name has been passed then
        append and trim.#}
        {{ default_schema }}_{{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}
