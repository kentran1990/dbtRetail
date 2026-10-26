/*
1. Generate source yml file
dbt run-operation generate_source --args '{"schema_name": "pos", "database_name": "raw", "generate_columns": true, "include_data_types": true, "include_descriptions":true, "include_schema": true}'

*/


/*  Using CLI
1. Generate source yml file
dbt -q run-operation generate_source --args '{"schema_name": "pos", "database_name": "raw", "generate_columns": true, "include_data_types": true, "include_descriptions": true, "include_schema": true}' > models/sourcecs_2.yml


2. Generate base models for sources. Ideally using a spreadsheet for renaming purpose.
dbt run-operation codegen.create_base_models --args '{source_name: pos, tables: ["customer","orders"]}'

3. Generate base models' yaml files. 

dbt -q run-operation generate_model_yaml --args '{"model_names": ["stg_customer_2"]}' > tmp_out.txt 2>&1;
$lines = Get-Content tmp_out.txt;
$match = $lines | Select-String -Pattern 'version:\s*2' | Select-Object -First 1;
if ($match) {
  $start = $match.LineNumber - 1;
  $clean = $lines[$start..($lines.Length-1)] -replace '^\d{2}:\d{2}:\d{2}\s+', '';
  $clean | Set-Content -Encoding utf8 models\stg_customer_2.yml;
  Write-Host "Clean YAML written to models\stg_customer_2.yml";
} else {
  Write-Warning "Couldn't find YAML start line containing 'version: 2'";
}


*/