## Quick Start

```bash
git clone https://github.com/<username>/AI-Strategy-Simulator.git

cd AI-Strategy-Simulator

docker compose -f docker/docker-compose-full.yml up -d
```

Services:

- n8n: http://localhost:5678
- PostgreSQL: localhost:5432
- Gotenberg: http://localhost:3000