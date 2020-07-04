#!/usr/bin/make

all: package

package:
	-rm dist/*
	python3 setup.py sdist bdist_wheel

install: package
	pip3 install --no-deps --force dist/*.whl

release: package
	twine upload dist/*

clean:
	-rm -rf dist build examples/ArduinoLearningKitStarter
	-rm -rf PcbDraw.egg-info

deb:
	DEB_BUILD_OPTIONS=nocheck fakeroot dpkg-buildpackage -uc -b

deb_clean:
	fakeroot debian/rules clean

.PHONY: package release deb deb_clean
