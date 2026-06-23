# Installation & Setup

## Prerequisites

Before running the project, ensure the following are installed:

* Docker Desktop
* Docker Compose
* OpenAI API Key
* PostgreSQL (if running outside Docker)
* n8n account (Cloud) or self-hosted n8n instance

---

# Option 1: Self-Hosted Setup (Recommended)

This project can be deployed locally using Docker.

## Clone the Repository

```bash
git clone https://github.com/<your-username>/AI-Strategy-Simulator.git

cd AI-Strategy-Simulator
```

## Start the Services

```bash
docker compose -f docker/docker-compose-full.yml up -d
```

This will start:

| Service               | URL                   |
| --------------------- | --------------------- |
| n8n                   | http://localhost:5678 |
| PostgreSQL            | localhost:5432        |
| Gotenberg PDF Service | http://localhost:3000 |

---

## Verify Containers

```bash
docker ps
```

Expected containers:

```text
n8n
postgres
gotenberg
```

---

## Configure PostgreSQL

Create the project schema:

```bash
docker exec -i postgres psql -U n8n -d ai_strategy < sql/schema.sql
```

Verify:

```bash
docker exec -it postgres psql -U n8n -d ai_strategy
```

Inside PostgreSQL:

```sql
\dt
```

Expected output:

```text
ai_assessments
```

---

## Import Workflow

1. Open n8n

```text
http://localhost:5678
```

2. Create an account.

3. Click:

```text
Workflows → Import from File
```

4. Select:

```text
workflows/ai_strategy_simulator.json
```

---

## Configure Credentials

### OpenAI

Create a new OpenAI credential and add your API key.

### PostgreSQL

Configure:

```text
Host: postgres
Port: 5432
Database: ai_strategy
Username: n8n
Password: n8npassword
```

---

## Run the Workflow

Execute the workflow manually or activate it and access the generated form URL.

---

# Option 2: n8n Cloud Setup

The project can also be deployed on n8n Cloud without Docker.

## Create an n8n Cloud Workspace

Sign up and create a workspace.

## Import Workflow

Navigate to:

```text
Workflows → Import from File
```

Upload:

```text
workflows/ai_strategy_simulator.json
```

---

## Configure OpenAI Credential

Add your OpenAI API key.

---

## Database Options

### Option A: Managed PostgreSQL

Recommended services:

* Neon
* Supabase
* Railway
* Aiven

Update the PostgreSQL credentials in n8n.

### Option B: Airtable

Replace PostgreSQL nodes with Airtable nodes if preferred.

---

## PDF Generation

For n8n Cloud deployments, use one of:

* PDF.co
* PDFMonkey
* APITemplate.io

Replace the Gotenberg HTTP Request node with the corresponding service.

---

# Environment Variables

The following variables may be customized:

```env
OPENAI_API_KEY=your_openai_key

DB_HOST=postgres
DB_PORT=5432
DB_NAME=ai_strategy
DB_USER=n8n
DB_PASSWORD=n8npassword

GOTENBERG_URL=http://gotenberg:3000
```

---

# Testing

Sample Input:

```json
{
  "useCase": "Customer Churn Prediction",
  "industry": "Retail",
  "budget": 100000,
  "employees": 50,
  "revenue": 2000000,
  "priority": "High"
}
```

Expected Output:

* ROI Calculation
* Risk Assessment
* Readiness Score
* Executive Summary
* Strategic Recommendation
* PDF Report
* Database Record

---

# Troubleshooting

## n8n Not Accessible

Check:

```bash
docker ps
```

Verify port:

```text
5678
```

is exposed.

---

## PostgreSQL Connection Failed

Verify:

```bash
docker logs postgres
```

and confirm credentials match the workflow configuration.

---

## PDF Generation Failed

Verify Gotenberg:

```text
http://localhost:3000/health
```

Expected response:

```json
{
  "status": "up"
}
```

---

# Stopping Services

```bash
docker compose -f docker/docker-compose-full.yml down
```

To remove all persisted data:

```bash
docker compose -f docker/docker-compose-full.yml down -v
```

---

# Production Recommendations

For production deployments:

* Use HTTPS
* Use a reverse proxy (Nginx or Traefik)
* Store secrets in environment variables
* Enable database backups
* Restrict network access to PostgreSQL
* Configure monitoring and logging

This repository is intended as a demonstration of AI-powered business decision automation using n8n, PostgreSQL, OpenAI, and PDF-based executive reporting.
