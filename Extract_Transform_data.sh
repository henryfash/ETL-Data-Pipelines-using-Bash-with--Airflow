#! /bin/bash

# download the data
wget -P /home/project/airflow/dags https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Final%20Assignment/tolldata.tgz

# unzip data
tar -xzf /home/project/airflow/dags/tolldata.tgz

# extract data from csv file
cut -d"," -f1-4 /home/project/airflow/dags/vehicle-data.csv > /home/project/airflow/dags/csv_data.csv

# extract data from tsv file
cut -d$'\t' -f5-7 /home/project/airflow/dags/tollplaza-data.tsv > /home/project/airflow/dags/tsv_data.csv

# extract data from fixed width file
cut -d " " -f6,7 /home/project/airflow/dags/payment-data.txt > /home/project/airflow/dags/fixed_width_data.csv

# consolidate data
paste -d "," /home/project/airflow/dags/csv_data.csv /home/project/airflow/dags/tsv_data.csv /home/project/airflow/dags/fixed_width_data.csv > /home/project/airflow/dags/extracted_data.csv

# transform and load data
paste -d"," <(cut -d"," -f1-3 /home/project/airflow/dags/extracted_data.csv) <(cut -d"," -f4 /home/project/airflow/dags/extracted_data.csv | tr "[:lower:]" "[:upper:]") <(cut -d"," -f5- /home/project/airflow/dags/extracted_data.csv) > /home/project/airflow/dags/transformed_data.csv
