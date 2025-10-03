{% macro test_macro(column_name) -%}
    {{column_name}} + 'XX'
{%- endmacro %}
