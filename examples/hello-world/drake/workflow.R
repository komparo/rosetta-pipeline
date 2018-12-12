library(drake)

plan <- drake_plan(
  hello = write("Hello world", file_out("hello-world.md"))
)

make(plan)