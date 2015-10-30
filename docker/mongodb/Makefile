.PHONY: build push all

REGISTRY = us.gcr.io
PROJECT = appsemblerx
MAJOR = 0
MINOR = 2
PATCH = 0

build:
	docker build -t $(REGISTRY)/$(PROJECT)/edx-multi-mongodb:latest .
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-mongodb:latest $(REGISTRY)/$(PROJECT)/edx-multi-mongodb:$(MAJOR).$(MINOR).$(PATCH)
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-mongodb:latest $(REGISTRY)/$(PROJECT)/edx-multi-mongodb:$(MAJOR).$(MINOR)

save:
	docker save -o mongodb.tar $(REGISTRY)/$(PROJECT)/edx-multi-mongodb:$(MAJOR).$(MINOR).$(PATCH)

push:
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-mongodb:latest
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-mongodb:$(MAJOR).$(MINOR).$(PATCH)
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-mongodb:$(MAJOR).$(MINOR)

all:	build push
