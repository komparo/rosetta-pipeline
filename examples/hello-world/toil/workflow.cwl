cwlVersion: v1.0
class: CommandLineTool
baseCommand: echo
stdout: hello-world.md
inputs:
  message:
    type: string
    inputBinding:
      position: 1
outputs:
  output:
    type: stdout