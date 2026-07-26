#!/usr/bin/env bash
set -euo pipefail

main() {
    local hermes_dir="${HERMES_HOME:-${HOME}/.hermes}"
    local skill_dir="${hermes_dir}/skills"
    local manifest="${hermes_dir}/hermes-blog-manifest.txt"
    local skills=(
        blog blog-analyze blog-audio blog-audit blog-brand blog-brief
        blog-calendar blog-cannibalization blog-chart blog-cluster blog-decay
        blog-discourse blog-factcheck blog-flow blog-geo blog-google blog-image
        blog-locale-audit blog-localize blog-multilingual blog-notebooklm
        blog-outline blog-persona blog-repurpose blog-rewrite blog-schema
        blog-seo-check blog-strategy blog-style blog-taxonomy blog-translate
        blog-write
    )

    local skill
    for skill in "${skills[@]}"; do
        if [ -d "${skill_dir}/${skill}" ]; then
            rm -rf "${skill_dir:?}/${skill}"
            echo "Removed: ${skill_dir}/${skill}"
        fi
    done
    rm -f "${manifest}"
    echo "Restart Hermes Agent to complete removal."
}

main "$@"
