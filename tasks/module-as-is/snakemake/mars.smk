rule mars:
    output: "hello-mars.md"
    shell: "echo 'hello mars' > {output}"