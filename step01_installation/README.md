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
