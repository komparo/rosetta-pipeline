workflow hello {
    call hellocall
}

task hellocall {
    command {
        cp /file_inside_docker.txt output.txt
    }
    output {
        File out = "output.txt"
    }

    runtime {
        docker: "rosettapipeline/run-in-docker"
    }
}