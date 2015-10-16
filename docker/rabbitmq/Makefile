.PHONY: build push all

REGISTRY = us.gcr.io
PROJECT = appsemblerx
MAJOR = 0
MINOR = 1
PATCH = 1

build:
	docker build -t $(REGISTRY)/$(PROJECT)/edx-multi-rabbitmq:latest .
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-rabbitmq:latest $(REGISTRY)/$(PROJECT)/edx-multi-rabbitmq:$(MAJOR).$(MINOR).$(PATCH)
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-rabbitmq:latest $(REGISTRY)/$(PROJECT)/edx-multi-rabbitmq:$(MAJOR).$(MINOR)

save:
	docker save -o rabbitmq.tar $(REGISTRY)/$(PROJECT)/edx-multi-rabbitmq:$(MAJOR).$(MINOR).$(PATCH)

push:
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-rabbitmq:latest
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-rabbitmq:$(MAJOR).$(MINOR).$(PATCH)
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-rabbitmq:$(MAJOR).$(MINOR)

all:	build push
