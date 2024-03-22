--https://docs.getdbt.com/docs/build/custom-aliases
{% macro generate_alias_name(custom_alias_name=none, node=none) -%}

    {# If the model name is part of the select CLI command and a variable
    called back_up_model is passed then we want to back up the chosen model. #}

    {%- if node.name in invocation_args_dict['select'] and var("back_up_model", false) == true -%}

        {# We then take the current date and make it a db friendly prefix
        to the original model name #}
        {%- set start_date = run_started_at.strftime("%Y_%m_%d") -%}
        {%- set database_identifier = start_date + "_" + node.name -%}
        {{ database_identifier }}

    {%- elif custom_alias_name is none -%}

        {# If no custom alias is passed then use the default model name #}
        {{ node.name }}

    {%- else -%}

        {# If a custom alias is passed then trim it before using it. #}
        {{ custom_alias_name | trim }}

    {%- endif -%}

{%- endmacro %}
