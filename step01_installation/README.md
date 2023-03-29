# MBD Graphics db exercise installation
# STEP 01 - Installation

Steps to be followed to create the insfrastructure for the MBD Graphics DB exercise


## Configure workspace

- Requirements

ENV VAR **MBD_WORKSPACE** must be created


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

- Start the Jupyter Notebook container

Open a new terminal and connect to the server:

```bash
ssh mbduser@<IP_SERVER>
```

```bash
cd ${MBD_WORKSPACE}/step01_installation/
```

```bash
./02_start_jupyter_notebook.sh
```

- Once you complete the installation steps, go back to the main guide.
[MBD graphics exercise guide](https://github.com/bptorao/mdb_graphics_db_exercise/blob/main/README.md)