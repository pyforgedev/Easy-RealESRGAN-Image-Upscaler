V ?= 0.1.0

.PHONY: changelog release

changelog:
	git-cliff --tag $(V) -o CHANGELOG.md

release: changelog
	git add CHANGELOG.md
	git commit -m "chore: release v$(V)"
	git tag v$(V)
	git push
	git push origin v$(V)
	@if command -v gh >/dev/null 2>&1; then \
		gh release create "v$(V)" --title "v$(V)" --notes-file CHANGELOG.md; \
	fi
