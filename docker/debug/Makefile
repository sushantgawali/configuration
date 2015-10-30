.PHONY: build push all

REGISTRY = us.gcr.io
PROJECT = appsemblerx
MAJOR = 0
MINOR = 2
PATCH = 0

build:
	docker build -t $(REGISTRY)/$(PROJECT)/debug:latest .
	docker tag -f $(REGISTRY)/$(PROJECT)/debug:latest $(REGISTRY)/$(PROJECT)/debug:$(MAJOR).$(MINOR).$(PATCH)
	docker tag -f $(REGISTRY)/$(PROJECT)/debug:latest $(REGISTRY)/$(PROJECT)/debug:$(MAJOR).$(MINOR)

save:
	docker save -o debug.tar $(REGISTRY)/$(PROJECT)/debug:$(MAJOR).$(MINOR).$(PATCH)

push:
	gcloud docker push $(REGISTRY)/$(PROJECT)/debug:latest
	gcloud docker push $(REGISTRY)/$(PROJECT)/debug:$(MAJOR).$(MINOR).$(PATCH)
	gcloud docker push $(REGISTRY)/$(PROJECT)/debug:$(MAJOR).$(MINOR)

all:	build push
