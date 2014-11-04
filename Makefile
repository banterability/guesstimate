COFFEE=./node_modules/coffee-script/bin/coffee

usage:
	@echo ''
	@echo 'Task         : Description'
	@echo '------------ : -----------'
	@echo 'make build   : Recompile from Coffeescript'
	@echo 'make watch   : Recompile from Coffeescript as source files change'
	@echo ''

build:
	$(COFFEE) -co lib src/

watch:
	$(COFFEE) -cwo lib src/

.PHONY: build watch
