workflow hello {
    call hellocall
    call byecall
}

task hellocall {
    command {
        echo "hello world" > hello-world.md
    }
    output {
        File out = "hello-world.md"
    }
}

task byecall {
    command {
        echo "bye world" > bye-world.md
    }
    output {
        File out = "bye-world.md"
    }
}