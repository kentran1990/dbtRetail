{% macro generate_model_yaml_clean(model_names) %}
  {{ return(codegen.generate_model_yaml(model_names=model_names)) }}
{% endmacro %}
