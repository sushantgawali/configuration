.PHONY: build push all

REGISTRY = us.gcr.io
PROJECT = appsemblerx
MAJOR = 0
MINOR = 2
PATCH = 0

build:
	docker build -t $(REGISTRY)/$(PROJECT)/edx-multi-elasticsearch:latest .
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-elasticsearch:latest $(REGISTRY)/$(PROJECT)/edx-multi-elasticsearch:$(MAJOR).$(MINOR).$(PATCH)
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-elasticsearch:latest $(REGISTRY)/$(PROJECT)/edx-multi-elasticsearch:$(MAJOR).$(MINOR)

save:
	docker save -o elasticsearch.tar $(REGISTRY)/$(PROJECT)/edx-multi-elasticsearch:$(MAJOR).$(MINOR).$(PATCH)

push:
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-elasticsearch:latest
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-elasticsearch:$(MAJOR).$(MINOR).$(PATCH)
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-elasticsearch:$(MAJOR).$(MINOR)

all:	build push
