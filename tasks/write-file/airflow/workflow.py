from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2015, 6, 1)
}

dag = DAG(
    'hello',
    default_args = default_args
)

hello = BashOperator(
    task_id='hello',
    bash_command='echo "Hello world" > /output/hello-world.md',
    dag=dag
)