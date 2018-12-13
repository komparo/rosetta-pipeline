import luigi

class Hello(luigi.Task):
    def run(self):
        with self.output().open('w') as file:
            file.write("Hello world")
    def output(self):
        return luigi.LocalTarget('hello-world.md')
