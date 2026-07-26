# Demo

After installation, start Hermes in a content project and try:

```text
/blog strategy developer productivity
/blog outline "How local AI agents handle private code"
/blog write "How local AI agents handle private code"
```

Hermes loads the `blog` orchestrator, uses `skill_view` for the selected
sub-skill, delegates research and review with `delegate_task`, and runs the
deterministic Python delivery checks from
`~/.hermes/skills/blog/scripts/`.

Media examples:

```text
/blog image generate a text-free 16:9 editorial hero for the article
/blog audio generate ./post.md --mode summary
```

If either media command is unavailable, run `hermes tools` and configure an
image or text-to-speech provider.
