# Installation

## Requirements

- [Hermes Agent](https://hermes-agent.nousresearch.com/docs/)
- Python 3.11+ for scoring, rendering, and delivery checks

## Local install

From the repository root:

```bash
./install.sh
```

On Windows:

```powershell
pwsh -File .\install.ps1
```

The installer copies the 32 skill directories into `~/.hermes/skills/`.
Specialist delegation prompts and shared Python helpers are kept inside the
main `blog` skill so Hermes can load the whole package through its normal skill
system. Set `HERMES_HOME` to install into a non-default Hermes data directory.

Restart Hermes, then run:

```text
/blog strategy <niche>
/blog write <topic>
/blog analyze <file-or-url>
```

Run `hermes tools` if web search, image generation, or text-to-speech is not
configured.

## External directory

To use the checkout directly without copying it, add the repository's absolute
`skills` path to `~/.hermes/config.yaml`:

```yaml
skills:
  external_dirs:
    - /absolute/path/to/hermes-blog/skills
```

## Python dependencies

The installer attempts `pip3 install -r requirements.txt`. To manage
dependencies yourself, set `HERMES_BLOG_SKIP_DEPS=1` and install only the
extras you use.

## Uninstall

```bash
./uninstall.sh
```

On Windows:

```powershell
pwsh -File .\uninstall.ps1
```
