.PHONY: build push all

REGISTRY = us.gcr.io
PROJECT = appsemblerx
MAJOR = 0
MINOR = 1
PATCH = 1

build:
	docker build -t $(REGISTRY)/$(PROJECT)/edx-multi-memcached:latest .
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-memcached:latest $(REGISTRY)/$(PROJECT)/edx-multi-memcached:$(MAJOR).$(MINOR).$(PATCH)
	docker tag -f $(REGISTRY)/$(PROJECT)/edx-multi-memcached:latest $(REGISTRY)/$(PROJECT)/edx-multi-memcached:$(MAJOR).$(MINOR)

save:
	docker save -o memcached.tar $(REGISTRY)/$(PROJECT)/edx-multi-memcached:$(MAJOR).$(MINOR).$(PATCH)

push:
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-memcached:latest
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-memcached:$(MAJOR).$(MINOR).$(PATCH)
	gcloud docker push $(REGISTRY)/$(PROJECT)/edx-multi-memcached:$(MAJOR).$(MINOR)

all:	build push
