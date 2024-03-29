# Master Big Data &amp; Business Analytics (ESESA) - Lecture Data Engineering - Graphics DB exercise
### Author: Bueka Torao

mdb_graphics_db_exercise

## Definition

The purpose of this exercise is to touch base with Data Engineering tools such as Docker, databases, Jupyter notebooks, python. And how to integrate them to populate a graphics database: neo4j. 

## Installation

### Clone the repository

From a folder in your computer or your server clone the repository:

```bash
git clone https://github.com/bptorao/mdb_graphics_db_exercise.git
```

### Install setup

The first step is to install the setup. Access the instalation folder: 

```bash
cd mdb_graphics_db_exercise
```

and run the following script:
```bash
./install_setup.sh
```

- Test the setup is initialized. Run this command
```bash
echo $MBD_WORKSPACE

source ~/.bashrc

echo $MBD_WORKSPACE
```

### Step 1

Follow the steps described here

[step01_installation](https://github.com/bptorao/mdb_graphics_db_exercise/blob/main/step01_installation/README.md)

### Step 2

Follow the steps described here.

[step02_configuration](https://github.com/bptorao/mdb_graphics_db_exercise/blob/main/step02_configuration/README.md)


Once you complete the installation and configuration steps you can access the tools.

### Tools

Here you have a list of the tools you started. Using the IP of the server you installed the tools, this is the URL you can use:

**1. Jupyter Notebook**
[http://IP:8888](http://localhost:8888)

- Password:
```
mbduser
```

**2. PHPAdmin database browser**
[http://IP:8081](http://localhost:8081)

- username:
```
finance
```
- password: 
```
finance
```

**3. Mysql database**
Database connection parameter from Jupyter notebook
```
HOST = "mysql_database"
PORT = "3306"
USER = "finance"
PASSWORD = "finance"
DATABASE = "finance_db"
```

If you want to use the database from an external service, use this parameters:
```
HOST = "IP"
PORT = "6603"
USER = "finance"
PASSWORD = "finance"
DATABASE = "finance_db"
```

**3. Neo4j database**
Neo4j Browser:
[http://IP:7474](http://localhost:7474)

Neo4j database (the browser will ask you to connect to this database)
[http://IP:7687](http://localhost:7687)

- username:
```
neo4j
```
- password: 
```
neo4j_test
```


## Exercise - Data Processing

[ES]

Data Engineering: El objetivo de este ejercicio es seguir los pasos de un procesamiento de datos real.
Vamos a extraer los datos de distintas fuentes, volcarlos en una base de datos relacional para analizarlos
y posteriormente popular una base de datos gráfica donde buscar de manera visual relaciones entre los datos.

Las herramientas que vamos a utilizar son:

 - Jupyter notebook
 - Mysql database
 - PHPAdmin como cliente de base de datos
 - Neo4j graphics database

Fuentes de datos:

- Lay off Tracker. Esta web registra los datos de despidos de empresas tecnológicas desde 2020.
https://layoffs.fyi

- Empresas constituyentes de los principales índices.
https://en.wikipedia.org/wiki/EURO_STOXX_50
En wikipedia tenemos las empresas que constituyen los principales índices bursátiles del mundo.

Esta es la lista con algunos de ellos:

SNP_500 https://en.wikipedia.org/wiki/List_of_S%26P_500_companies
NASDAQ_100 https://en.wikipedia.org/wiki/Nasdaq-100
EuroStoxx50 https://en.wikipedia.org/wiki/EURO_STOXX_50
IBEX_35 https://en.wikipedia.org/wiki/IBEX_35
FTSE_100
DAX
CAC_40
Nikkei_225
Stoxx_Europe_600
Swiss_Market_Index
FTSE_CHINA_A50


- Listado de Países y sus respectivos continentes:
En esta URL tenemos un listado de paises, que vamos a exportar y procesar para nuestro ejercicio.

https://raw.githubusercontent.com/dbouquin/IS_608/master/NanosatDB_munging/Countries-Continents.csv

### Pasos a realizar:

Accede al Jupyter notebook y navega al folder:

data_processing/

En ese folder tienes los 4 pasos del ejercicio. Accede a cada carpeta y encontrarás un notebook con instrucciones.

1. Data extraction.
Extracción de los datos de sus correspondientes fuentes y aplicar normalización necesaria.
Extra: Leer los datos de más índices bursátiles

2. Onboarding.
- Volcado de los datos normalizados a la base de datos. 
- Análisis exploratorio de los datos 

3. Popular la base de datos gráfica
- Generar las vistas necesarias para los nodos y las relaciones
- Ejecutar los scripts de carga y resolver los errores. 

4. Analizar las relaciones y buscar conocimiento en los datos
- Extra: Crear más relaciones y cargarlas en neo4j

5. Explorar los datos gráficamente definiendo un panel de análisis.
Extra: Exportar los datos a Google Data Studio y crear un dashboard de análisis.


# Troubleshooting

[Troubleshooting guide](https://github.com/bptorao/mdb_graphics_db_exercise/blob/main/Troubleshooting.md)