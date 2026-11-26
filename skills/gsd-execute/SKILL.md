---
name: gsd-execute
description: "Execute planned GSD tasks with automated verification and atomic commits. Triggers on: gsd execute, execute phase, /gsd:execute-phase."
user-invocable: true
---

# GSD Phase Execution

Execute planned tasks from `.planning/phases/phase-X.md`.

1. Read the active task from the phase plan.
2. Implement ONLY the code required for that task.
3. Run verification tests / typecheck.
4. Commit the change with conventional commit message (`feat(...)`, `fix(...)`).
5. Update `.planning/STATE.md`.
