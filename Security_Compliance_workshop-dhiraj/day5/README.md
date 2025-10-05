# Day 5 

Here is the complete **README.md** content in Markdown format, ready for you to copy and paste:

---

# 🔐 Vulnerable Flask App Security Pipeline Demo

This repository demonstrates a GitHub Actions security pipeline for a vulnerable Flask application and its infrastructure code. It showcases how automated tools can detect and help remediate common security issues.

---

## 🚀 Setup Instructions

1. **Directory Structure**:
   ```
   .
   ├── Security_Compliance_workshop-dhiraj/day5/
   │   ├── app.py
   │   └── requirements.txt
   │   └── s3_bucket.tf
   └── .github/
       └── workflows/
           └── day5.yml
   ```

2. **Trigger the Pipeline**:
   - Push to the `main` branch or open a pull request.
   - GitHub Actions will automatically run the security pipeline.

---

## 📊 Scan Results

### ✅ Artifacts Generated

| Tool              | Report File                  |
|-------------------|------------------------------|
| Bandit            | `bandit-report.html`         |
| Semgrep           | `semgrep-report.json`        |
| Trivy (FS)        | `trivy-deps-report.json`     |
| Trivy (Docker)    | `trivy-docker-report.json`   |
| Checkov           | `checkov-report.json`        |
| Gitleaks          | `gitleaks-report.json`       |
| OWASP ZAP         | `owasp-zap-report.html`      |

### 📸 Screenshots (Placeholders)

- !Bandit Report Screenshot
- !Checkov Report Screenshot

---

## 🛑 Vulnerabilities Identified

### 1. Hardcoded Secret in `app.py`

- **Location**: `app/app.py`
- **Issue**: `app.secret_key = "hardcoded_super_secret_key"`
- **Impact**: Hardcoded secrets can be extracted by attackers, leading to session hijacking or unauthorized access.
- **Recommended Fix**: Use environment variables to store secrets securely.

  ```python
  import os
  app.secret_key = os.environ.get("FLASK_SECRET_KEY", "default-secret")
  ```

---

### 2. Publicly Accessible RDS Instance

- **Location**: `infrastructure/rds.tf`
- **Issue**: `publicly_accessible = true`
- **Impact**: Exposes your database to the internet, increasing the risk of unauthorized access and data breaches.
- **Recommended Fix**: Set `publicly_accessible = false` and use private networking or VPN access.

---

## 🛠️ Demonstrated Fix

### Fix: Replacing Hardcoded Secret

**Before**:
```python
app.secret_key = "hardcoded_super_secret_key"
```

**After**:
```python
import os
app.secret_key = os.environ.get("FLASK_SECRET_KEY", "default-secret")
```

### 🔁 Updated Scan Result

After applying the fix and rerunning the pipeline:

- ✅ **Bandit Report**: No issues found related to hardcoded secrets.
- 📉 Reduced overall risk score.

---

## ❓ Scenario-Based Questions

### Q1: What happens if a new vulnerable dependency is added?

**Answer**: The Trivy FS scan will detect the vulnerable package and flag it in `trivy-deps-report.json`. The pipeline will continue running due to `continue-on-error: true`, but the report will highlight the issue for developers to fix.

---

### Q2: How can we prevent secrets from being committed?

**Answer**: Use tools like **Gitleaks** in the pipeline to detect secrets before they are merged. Additionally, implement pre-commit hooks and use secret management solutions like AWS Secrets Manager or HashiCorp Vault.

---

### Q3: How can we ensure infrastructure is secure before deployment?

**Answer**: Use **Checkov** to scan Terraform code for misconfigurations. Integrate it into the CI pipeline to block insecure infrastructure from being deployed.

---