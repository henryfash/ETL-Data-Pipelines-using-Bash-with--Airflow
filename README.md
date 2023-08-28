# ETL Data Pipelines using Bash scripting with Airflow
**Scenario**</br>
You work as a data engineer for a data analytics consulting firm. Your current project involves easing traffic congestion on national highways by analyzing road traffic data collected from various toll plazas. These toll plazas are managed by different operators, each with their own unique IT systems and file formats. Your task entails gathering data from these diverse formats and merging it into one file.

**Objectives** </br>
Author an Apache Airflow DAG that will: </br>
- Download data
- unzip data
- Extract data from a csv file
- Extract data from a tsv file
- Extract data from a fixed width file
- Combine the extracted data into a single file
- Transform the data
- Load the transformed data 

**Approach** </br>
- Create a shell script containing the command to
-   - download
-   unzip
-   extract fields from csv, tsv and fixed width files
-   combine the extracted data
-   transform the combined data and load
- create a task in the DAG to call the shell script
- submit the DAG
- unpause the DAG
- Monitor the DAG
