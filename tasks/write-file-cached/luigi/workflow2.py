import luigi

class Hello(luigi.Task):
    def run(self):
        with self.output().open('w') as file:
            file.write("Hello world")
    def output(self):
        return luigi.LocalTarget('hello-world.md')

class Bye(luigi.Task):
    def run(self):
        with self.output().open('w') as file:
            file.write("Bye world")
    def output(self):
        return luigi.LocalTarget('bye-world.md')

class All(luigi.Task):
    def requires(self):
        return [Hello(), Bye()]