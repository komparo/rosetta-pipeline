FROM python:3.6

RUN AIRFLOW_GPL_UNIDECODE=yes pip install apache-airflow

RUN useradd -ms /bin/bash user

USER user
RUN export AIRFLOW_HOME=/home/user/airflow
RUN airflow initdb