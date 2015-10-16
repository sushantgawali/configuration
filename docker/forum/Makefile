.PHONY: build push all

REGISTRY = us.gcr.io
PROJECT = appsemblerx
MAJOR = 0
MINOR = 1
PATCH = 2

build:
	docker build -t $(REGISTRY)/$(PROJECT)/edx-multi-forum:latest .
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-forum:latest $(REGISTRY)/$(PROJECT)/edx-multi-forum:$(MAJOR).$(MINOR).$(PATCH)
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-forum:latest $(REGISTRY)/$(PROJECT)/edx-multi-forum:$(MAJOR).$(MINOR)

save:
	docker save -o forum.tar $(REGISTRY)/$(PROJECT)/edx-multi-forum:$(MAJOR).$(MINOR).$(PATCH)

push:
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-forum:latest
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-forum:$(MAJOR).$(MINOR).$(PATCH)
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-forum:$(MAJOR).$(MINOR)

all:	build push
