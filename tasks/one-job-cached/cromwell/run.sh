java -jar /cromwell/cromwell-36.jar run workflow.wdl --options options.json
java -jar /cromwell/cromwell-36.jar run workflow2.wdl --options options.json

# copy output files to working directory
find cromwell-output -mindepth 2 -type f -exec cp -t . -i '{}' +