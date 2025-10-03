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

---

## CI/CD Pipeline Integration

A GitHub Actions workflow (.github/workflows/zap_scan.yml) automates the OWASP ZAP security scan on branches main with paths 'Security_Compliance_workshop-dhiraj/day2/**'. It checks out the code, runs the scan against the target application, and uploads the HTML report as an artifact, ensuring security testing is seamlessly integrated into the development process.

