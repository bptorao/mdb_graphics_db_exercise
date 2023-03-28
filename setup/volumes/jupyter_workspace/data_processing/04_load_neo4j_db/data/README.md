# LOAD DATA into Neo4j Database


Exportar a fichero las siguientes vistas

v_nodes_continents.csv
v_nodes_countries.csv
v_nodes_layoff.csv
v_nodes_locations.csv
v_nodes_sectors.csv
v_rel_companies_countries.csv
v_rel_companies_locations.csv
v_rel_companies_sectors.csv
v_rel_country_continents.csv

Ejecutar el script de import para popular la base de datos:

```bash
tools/neo4j_docker_deployment/run_neo4j_import.sh
```
