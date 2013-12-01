
all: help

help:
	@echo targets:
	@echo  - test
	@echo  - upload
	@echo  - upgrade-job-builder

test: .local/bin/jenkins-jobs
	mkdir -p tmp
	.local/bin/jenkins-jobs test $(CURDIR)/jenkins_jobs/*.yaml -o tmp


upload: .local/bin/jenkins-jobs
	.local/bin/jenkins-jobs --conf $(CURDIR)/jenkins_jobs/libav.ini update $(CURDIR)/jenkins_jobs/

.local/bin/python:
	virtualenv .local

.local/bin/jenkins-jobs upgrade-job-builder: .local/bin/python
	.local/bin/pip install --upgrade jenkins-job-builder

.PHONY: upload upgrade-job-builder
