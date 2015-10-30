.PHONY: build push all

REGISTRY = us.gcr.io
PROJECT = appsemblerx
MAJOR = 0
MINOR = 2
PATCH = 0

build:
	docker build -t $(REGISTRY)/$(PROJECT)/edx-multi-mysql-init:latest .
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-mysql-init:latest $(REGISTRY)/$(PROJECT)/edx-multi-mysql-init:$(MAJOR).$(MINOR).$(PATCH)
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-mysql-init:latest $(REGISTRY)/$(PROJECT)/edx-multi-mysql-init:$(MAJOR).$(MINOR)

save:
	docker save -o mysql.tar $(REGISTRY)/$(PROJECT)/edx-multi-mysql-init:$(MAJOR).$(MINOR).$(PATCH)

push:
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-mysql-init:latest
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-mysql-init:$(MAJOR).$(MINOR).$(PATCH)
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-mysql-init:$(MAJOR).$(MINOR)

all:	build push
