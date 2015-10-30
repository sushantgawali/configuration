.PHONY: build push all

REGISTRY = us.gcr.io
PROJECT = appsemblerx
MAJOR = 0
MINOR = 2
PATCH = 0

build:
	docker build -t $(REGISTRY)/$(PROJECT)/edx-multi-edxapp:latest .
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-edxapp:latest $(REGISTRY)/$(PROJECT)/edx-multi-edxapp:$(MAJOR).$(MINOR).$(PATCH)
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-edxapp:latest $(REGISTRY)/$(PROJECT)/edx-multi-edxapp:$(MAJOR).$(MINOR)

save:
	docker save -o edxapp.tar $(REGISTRY)/$(PROJECT)/edx-multi-edxapp:$(MAJOR).$(MINOR).$(PATCH)

push:
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-edxapp:latest
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-edxapp:$(MAJOR).$(MINOR).$(PATCH)
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-edxapp:$(MAJOR).$(MINOR)

all:    build push
