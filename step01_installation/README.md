# MBD Graphics db exercise installation
Steps to be followed to create the insfrastructure for the MBD Graphics DB exercise


## Configure workspace

Configure a new ENV VAR to set the local folder where the **graphics_db_exercise** will be installed:
Change <LOCAL_FOLDER> with your local folder.

```bash
export MBD_WORKSPACE="<LOCAL_FOLDER>"
```
# export MBD_WORKSPACE=/Users/bueka.torao/DevProjects/devprojects_workspace/graphics_db_exercise

## STEP 1 - Pulling images and create workspace

```bash
cd ${MBD_WORKSPACE}/step01_installation/
```

```bash
./01_pulling_images.sh
```

## STEP 2 - Start containers

```bash
cd ${MBD_WORKSPACE}/step01_installation/
```

```bash
./02_start_containers.sh
```

## STEP x - Start database and DB browser

```bash 
cd ${MBD_WORKSPACE}/database/build_mysql_database
```

- Start Mysql database on a docker container
```bash 
./run_database.sh
```

- Init the database **finance_db**

```bash
./init_database_finance.sh
```

- Start the DB browser

```bash
cd ${MBD_WORKSPACE}/database/build_phpadmin_browser
./run_phpadmin.sh
```



## STEP X - Create Jupyter notebook
- Connect to Jupyter docker
```bash
cd ${MBD_WORKSPACE}/../jupyter_notebook_docker

./connect_to_jupyter_notebook_lab.sh

```

- Configure ENV VAR **MBD_WORKSPACE** for the Jupyter Notebook

```bash
export MBD_WORKSPACE="/home/jovyan/work/graphics_db_exercise"
```



- Create a new conda environment
```bash
cd ~/work/jupyter_notebook_docker/conda_tools

./create_conda_env.sh mdb

conda activate mdb

python -m ipykernel install --user --name=pdf_extract --display-name  "mdb"

```

- Install requirements file 
```bash

pip install -r ${MBD_WORKSPACE}/step01_installation/requirements.txt

```
