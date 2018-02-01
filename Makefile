.PHONY: run docker install shell default

default:
	@echo "EKL: Elastic Search & Kibana & Logstash"
	@echo "make [<docker>|<install>|<run>|<shell>]"
	@echo "make docker: runs EKL in a local dev environment"
	@echo "make install: installs EKL in the current machine"
	@echo "make run: runs EKL locally"

docker:
	cd ops && docker-compose up

install:
	cd ops/scripts/ && sh install.sh

run:
	cd ops/scripts/ && sh run.sh

shell:
	rebar3 shell

