workflow hello {
    call hellocall
}

task hellocall {
    command {
        echo "hello world" > hello-world.md
    }
    output {
        File out = "hello-world.md"
    }
}