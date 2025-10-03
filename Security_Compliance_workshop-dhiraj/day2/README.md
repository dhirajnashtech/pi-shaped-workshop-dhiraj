# Day 2 — OWASP ZAP: Detecting & Understanding Web Vulnerabilities

## Objective

## Pull & run the target app (Juice Shop) locally

```bash
# pull the image (optional if you already pulled)
docker pull bkimminich/juice-shop:latest

# run the app as a background container
docker run -d --name juice -p 8080:3000 bkimminich/juice-shop:latest

# verify it is up (open in browser)
http://localhost:8080
```