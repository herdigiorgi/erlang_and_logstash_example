erlang_and_logstash_example
=====

For testing it locally, first start elasticsearch, kibana and logstash with:
~~~
$ make docker
~~~

The test the login with:
~~~
$ make shell
1> lager:start().
2> lager:log(warning, self(), "this is a warning").
~~~

The scripts and configuration files are in `ops/scripts`. Where 
`install.sh` downloads and installs all dependencies, and also
creates a new user `elasticsearch`. Then `run.sh` starts
elasticsearch, kibana and logstash. Run this with:

~~~
$ make install
$ make run
~~~

You should be able to see `kibana` at `http://localhost:5601/`.
