#!/usr/bin/env python3
"""Retired hermes-blog diagram generator."""

import sys


def main() -> int:
    print(
        "Diagram generation is retired as of v1.11.0. "
        "The current hermes-blog visuals are hand-finalized externally; "
        "do not regenerate assets/diagrams/ from this script.",
        file=sys.stderr,
    )
    return 1


if __name__ == "__main__":
    sys.exit(main())
