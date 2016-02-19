el7-rpm:
	docker run -e ITERATION=$(TRAVIS_JOB_NUMBER) -e DIST=el7 -e XUID="$(shell id -u)" --rm -v $(shell pwd):/work -ti centos:7 /work/fpm.sh
