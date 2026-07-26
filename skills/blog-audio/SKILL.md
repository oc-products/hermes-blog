---
name: blog-audio
description: >
  Turn a blog post into a summary, full narration, or two-speaker audio script
  with Hermes Agent's text-to-speech tool. Use for blog audio, narration,
  read-aloud, podcast, voice, or TTS requests, including /blog audio.
version: "2.1.1"
author: AgriciDaniel
license: MIT
metadata:
  hermes:
    tags: [blog, audio, narration, tts]
---

# Blog Audio

Use Hermes Agent's native `text_to_speech` tool. Do not require a separate
Gemini key when Hermes already has a configured TTS provider.

## Procedure

1. Read the source post and identify its title, body, and language.
2. Choose the requested mode:
   - `summary`: a natural 200-300 word overview.
   - `full`: the complete article converted to spoken prose.
   - `dialogue`: a host-and-expert script covering the main points.
3. Remove frontmatter, URLs, schema, raw HTML, image syntax, and code that should
   not be spoken. Preserve the factual meaning.
4. Call `text_to_speech` with the prepared text. For a long post, split at
   heading boundaries and generate ordered parts rather than truncating it.
5. Return the audio path, mode, voice, and this accessible embed:

```html
<audio controls preload="metadata">
  <source src="/audio/post-slug.mp3" type="audio/mpeg">
  Your browser does not support the audio element.
</audio>
```

Include `[[as_document]]` when delivering the audio through a Hermes messaging
gateway.

## Error Handling

- If `text_to_speech` is unavailable, tell the user to run `hermes tools`.
- During an internal writing workflow, skip audio without blocking the post.
- Never place secrets in a command, generated file, or response.

## Verification

Confirm the output exists, has non-zero size, uses the requested language, and
does not read markdown or schema syntax aloud.
