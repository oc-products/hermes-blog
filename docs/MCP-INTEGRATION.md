# Hermes tools and MCP

Most `hermes-blog` workflows use Hermes' built-in tools:

| Capability | Hermes tool |
|---|---|
| Search | `web_search` |
| Page extraction | `web_extract` |
| Specialist delegation | `delegate_task` |
| Image generation and editing | `image_generate` |
| Narration | `text_to_speech` |

Run `hermes tools` to configure these providers. A Nous Portal setup can expose
the managed web and media tools without separate per-skill credentials.

MCP remains useful for optional services such as NotebookLM or a private data
source. Add those servers under `mcp_servers` in `~/.hermes/config.yaml`:

```yaml
mcp_servers:
  example:
    command: npx
    args: ["-y", "@example/mcp-server"]
    env:
      EXAMPLE_API_KEY: "${EXAMPLE_API_KEY}"
```

Keep secrets in `~/.hermes/.env` or the process environment, not in this
repository. Restart Hermes after changing MCP configuration.
