# Use MD linting in docs

Keep the Markdown clean using a linter!

Writers [use it in VSCode editor](markdownlint-in-vscode-editor.md).

Optionally, one can [use it via CLI](markdownlint-command-line.md).

The configuration file [.markdownlint.jsonc](.markdownlint.jsonc) remains the same for both the implementation. Two things to note about the config file:

* It has limited checks to avoid noise for writers. We'll expand the scope of the checks going forward.

* I manually add it to our doc repos, so that writers don't have to configure anything. It does mean that I have to manually maintain multiple sources of truth instead of SSOT. Copies of the same file goes into the root dir of all the doc repos.
