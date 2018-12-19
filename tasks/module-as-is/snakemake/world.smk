rule world:
    output: "hello-world.md"
    shell: "echo 'hello world' > {output}"