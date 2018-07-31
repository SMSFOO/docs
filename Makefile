.PHONY: all

DIRTY_FILES=$$(git status --porcelain --untracked-files=all | awk '{$$1=""}1')

# Atomic commits : https://www.reddit.com/r/programming/comments/7i5424/atomic_commits_telling_stories_with_git
commit:
	@for path in $(DIRTY_FILES); do \
		git add $$path; \
		git commit -sm "commit changes to $$path"; \
	done; \
	git push;
