export PYTHONPATH=$(pwd)

luigi --module workflow Hello --local-scheduler

luigi --module workflow2 All --local-scheduler
