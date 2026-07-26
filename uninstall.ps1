#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"

$HermesDir = if ($env:HERMES_HOME) { $env:HERMES_HOME } else { Join-Path $env:USERPROFILE ".hermes" }
$SkillDir = Join-Path $HermesDir "skills"
$Skills = @(
    "blog", "blog-analyze", "blog-audio", "blog-audit", "blog-brand",
    "blog-brief", "blog-calendar", "blog-cannibalization", "blog-chart",
    "blog-cluster", "blog-decay", "blog-discourse", "blog-factcheck",
    "blog-flow", "blog-geo", "blog-google", "blog-image", "blog-locale-audit",
    "blog-localize", "blog-multilingual", "blog-notebooklm", "blog-outline",
    "blog-persona", "blog-repurpose", "blog-rewrite", "blog-schema",
    "blog-seo-check", "blog-strategy", "blog-style", "blog-taxonomy",
    "blog-translate", "blog-write"
)

foreach ($Skill in $Skills) {
    $Path = Join-Path $SkillDir $Skill
    if (Test-Path -LiteralPath $Path) {
        Remove-Item -LiteralPath $Path -Recurse -Force
        Write-Host "Removed: $Path"
    }
}

Remove-Item -LiteralPath (Join-Path $HermesDir "hermes-blog-manifest.txt") -Force -ErrorAction SilentlyContinue
Write-Host "Restart Hermes Agent to complete removal."
