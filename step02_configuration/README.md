

## STEP 02 

### Configure Database

- Init the database **finance_db**

```bash
echo "Init database: finance_db"

${MBD_WORKSPACE}/tools/mysql_database/build_mysql_database/init_database_finance.sh

```


### Create conda environment on Jupyter notebook
- Connect to Jupyter docker
```bash
cd ${MBD_WORKSPACE}/step02_configuration/

./connect_to_jupyter_notebook_lab.sh

```

- Connected to the container run the following commands:

```bash
conda create --name mbd -y

conda activate mbd

conda install -n mbd ipykernel -y

python -m ipykernel install --user --name=mbd --display-name "mbd"

pip install -r conda_tools/requirements.txt

```

### Configure Neo4j

# Neo4j deployment

```bash

sudo chown neo4j:neo4j ${MBD_WORKSPACE}/setup/volumes/neo4j/conf

```
