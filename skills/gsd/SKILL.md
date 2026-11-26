---
name: gsd
description: "Get Shit Done (GSD) meta-prompting and spec-driven development framework. Triggers on: gsd, get shit done, new project, plan phase, execute phase, verify work, /gsd:new-project, /gsd:plan-phase, /gsd:execute-phase."
user-invocable: true
---

# Get Shit Done (GSD)

GSD provides structured, phase-based execution to keep complex coding tasks focused and robust.

## Commands

- `/gsd:new-project` - Initialize a new project with requirements gathering and roadmap creation.
- `/gsd:map-codebase` - Analyze an existing codebase to generate architecture documentation.
- `/gsd:plan-phase <N>` - Plan phase N by researching patterns, creating task lists, and defining verification criteria.
- `/gsd:execute-phase <N>` - Execute planned tasks in phase N with test-driven validation.
- `/gsd:verify-work <N>` - Run verification suites and manual acceptance checks against requirements.
- `/gsd:code-review` - Conduct a thorough code quality and security review.
- `/gsd:ship` - Finalize, commit, and prepare the release artifact.

## Workflow

1. Check `.planning/STATE.md` for current project state.
2. Follow the sequence: **Discuss -> Plan -> Execute -> Verify -> Ship**.
3. Keep atomic git commits per task.
