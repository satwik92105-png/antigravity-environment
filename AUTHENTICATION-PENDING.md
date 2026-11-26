# Authentication Pending Queue

To maintain security and avoid unapproved charges, authentication for external services is handled **strictly one service at a time**, with clear explanations of free tiers, permissions, and requirements.

---

## Service 1: Vercel (`vercel-plugin`) — ACTIVE IN QUEUE

- **Purpose:** Full integration with the Vercel platform: deployment previews, production deployments, Vercel Functions, Edge Middleware, Blob Storage, AI SDK tracing, and cloud sandboxing (`offload-to-sandbox`).
- **Free Tier:**
  - Vercel **Hobby Tier** is **100% Free** forever for personal non-commercial projects.
  - Includes unlimited deployments, 100 GB/mo bandwidth, and serverless compute execution.
- **Paid Requirements:**
  - Pro tier ($20/seat/month) is only required for commercial teams. **No paid tier is required for your setup.**
- **Permissions Requested:**
  - Read/write access to project deployments, environment variables, and build logs.
- **Action Required:**
  - When you are ready, confirm in chat to authenticate Vercel.
  - An official browser authorization card will open for one-click authorization.
  - Once signed in, 250+ Vercel MCP tools and CLI deployment actions become fully active.

---

## Service 2: MongoDB Atlas (`mongodb-atlas`)

- **Purpose:** Query database collections, inspect schemas, generate query optimizations, and estimate Queryable Encryption (QE) storage overhead.
- **Free Tier:**
  - MongoDB Atlas **M0 Shared Cluster** is **100% Free** forever (512 MB storage, shared RAM/vCPU).
- **Paid Requirements:**
  - Dedicated clusters (M10+) require paid billing, but are not needed for development or schema queries.
- **Permissions Requested:**
  - Cluster read/write access and monitoring metrics.
- **Action Required:**
  - Authenticate using the MongoDB Atlas plugin connection card or API keys when database testing is required.

---

## Service 3: GitHub Platform (`github`) *(Optional)*

- **Purpose:** Issue tracking, Pull Request management, code search, and GitHub Actions trigger via GitHub MCP.
- **Free Tier:**
  - Standard GitHub accounts have **100% Free** access to public and private repositories, issues, and PR management via Personal Access Tokens (PAT).
- **Paid Requirements:**
  - None for standard developer operations.
- **Permissions Requested:**
  - Scoped PAT (`repo`, `workflow`, `read:org`).
- **Action Required:**
  - Connect PAT when deep GitHub issue/PR automation via MCP is requested.

---

## User Confirmation Protocol
*The agent will NEVER ask for multiple API keys simultaneously. When you are ready to authenticate Service 1 (Vercel), let me know and we will complete it before moving to Service 2.*
