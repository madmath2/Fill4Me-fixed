MOD := $(shell grep "name" info.json | sed -n 's/.*"name":.*"\(.*\)",.*/\1/p')
VERSION := $(shell grep "version" info.json | sed -n 's/.*"version":.*"\(.*\)",.*/\1/p')
DIRECTORY := $(MOD)_$(VERSION)
MOD_ZIP := $(DIRECTORY).zip

.PHONY: clean

MOD_ZIP: clean
	rsync -r --progress --exclude-from .makeignore . $(DIRECTORY)
	zip -9qyrm $(MOD_ZIP) $(DIRECTORY)/
  
clean:
	rm -rf $(MOD_ZIP) $(DIRECTORY)
