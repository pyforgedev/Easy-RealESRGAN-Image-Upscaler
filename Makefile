V ?= 0.1.0

.PHONY: changelog release

changelog:
	git-cliff --tag $(V) -o CHANGELOG.md

release: changelog
	git add CHANGELOG.md
	git commit -m "chore: release v$(V)"
	git tag v$(V)
	git push --follow-tags
