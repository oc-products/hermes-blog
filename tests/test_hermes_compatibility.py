from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent


def test_skill_surface_uses_hermes_tools() -> None:
    text = "\n".join(
        path.read_text(encoding="utf-8")
        for path in (ROOT / "skills").rglob("*.md")
    )
    assert "WebSearch" not in text
    assert "WebFetch" not in text
    assert "Task tool" not in text
    assert "~/.claude/" not in text
    for tool in ("web_search", "web_extract", "delegate_task", "image_generate", "text_to_speech"):
        assert tool in text


def test_every_skill_has_required_frontmatter() -> None:
    for skill in (ROOT / "skills").glob("*/SKILL.md"):
        text = skill.read_text(encoding="utf-8")
        assert text.startswith("---\n"), skill
        frontmatter = text.split("---\n", 2)[1]
        assert "\nname:" in f"\n{frontmatter}", skill
        assert "\ndescription:" in f"\n{frontmatter}", skill


if __name__ == "__main__":
    test_skill_surface_uses_hermes_tools()
    test_every_skill_has_required_frontmatter()
    print("Hermes compatibility checks passed")
