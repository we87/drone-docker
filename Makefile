all: image

TAG = 0.4
PREFIX = we87

release: image
	docker push $(PREFIX)/drone:$(TAG)

image:
	docker build -t $(PREFIX)/drone:$(TAG) .

extract-bin:
	@cid=$$(docker create drone/drone:$(TAG)) && \
	docker cp $$cid:drone_static $$(pwd)/drone_static; \
	err=$$?; \
	docker rm $$cid && exit $$err
