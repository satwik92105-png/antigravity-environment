---
name: gsd-verify
description: "Verify completed phase work against requirements and acceptance tests. Triggers on: gsd verify, verify phase, /gsd:verify-work."
user-invocable: true
---

# GSD Verification

Verify that all acceptance criteria for the phase are met.

1. Review all acceptance criteria in `.planning/phases/phase-X.md`.
2. Run test suites, linters, and typecheckers.
3. Test edge cases and performance boundaries.
4. Mark the phase as complete in `.planning/ROADMAP.md` and update `.planning/STATE.md`.
