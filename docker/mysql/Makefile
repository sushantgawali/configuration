.PHONY: build push all

REGISTRY = us.gcr.io
PROJECT = appsemblerx
MAJOR = 0
MINOR = 1
PATCH = 1

build:
	docker build -t $(REGISTRY)/$(PROJECT)/edx-multi-mysql:latest .
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-mysql:latest $(REGISTRY)/$(PROJECT)/edx-multi-mysql:$(MAJOR).$(MINOR).$(PATCH)
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-mysql:latest $(REGISTRY)/$(PROJECT)/edx-multi-mysql:$(MAJOR).$(MINOR)

save:
	docker save -o mysql.tar $(REGISTRY)/$(PROJECT)/edx-multi-mysql:$(MAJOR).$(MINOR).$(PATCH)

push:
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-mysql:latest
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-mysql:$(MAJOR).$(MINOR).$(PATCH)
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-mysql:$(MAJOR).$(MINOR)

all:	build push
