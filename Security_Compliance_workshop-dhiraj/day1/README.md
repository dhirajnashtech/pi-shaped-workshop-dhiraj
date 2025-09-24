
# Gitleaks Secret Scanning Documentation

## Setup Instructions

1. **Install Gitleaks**  
   Download the latest Gitleaks release binary from the [official GitHub releases](https://github.com/gitleaks/gitleaks/releases) or install via package manager:
   ```
   wget https://github.com/gitleaks/gitleaks/releases/download/v8.28.0/gitleaks-linux-amd64.tar.gz
   tar -xzf gitleaks-linux-amd64.tar.gz
   sudo mv gitleaks /usr/local/bin/
   gitleaks --version
   ```
2. **Prepare the Repository**  
   Clone or initialize your Git repository containing your application code.
3. **Run Initial Scan**  
   Run Gitleaks to scan for any existing secrets in the repo:
   ```
   gitleaks detect --source .
   ```
   <img width="635" height="325" alt="gitleaks_before" src="https://github.com/user-attachments/assets/1794e9c6-b8e2-4bd4-b0ee-193a96411923" />


## Removing Detected Secrets

1. **Identify the Secret**  
   Review the Gitleaks report to find files and lines containing secrets.
2. **Remove or Rotate Secrets**  
   - Remove hardcoded secrets from files or replace with environment variables.
   - Rotate secrets or API keys that were exposed.
3. **Rewrite Git History if Needed**  
   If secrets are found in previous commits, rewrite git history using: git-filter-repo first download
   ```
   sudo apt install git-filter-repo
   git filter-repo --replace-text <(echo "REMOVED==>REMOVED") --force
   gitleaks detect --source .
   
   ```
   <img width="621" height="325" alt="gitleaks_after" src="https://github.com/user-attachments/assets/adfd9a42-21ac-4ef0-aa60-47631342a1e5" />


## Shift-Left Security Benefits

- **Early Detection:** Detect secrets before merging code to main branches, preventing leaks early.
- **Continuous Integration:** Automated scans in pipelines maintain clean codebases.
- **Cost Savings:** Fix security issues early to reduce remediation costs later.
- **Security Culture:** Encourages developers to follow security best practices as part of development workflow.

## Challenges Faced & Solutions

| Challenge                             | Solution                                           |
|-------------------------------------|--------------------------------------------------|
| False positives in scanning         | Fine-tune Gitleaks configuration with ignore rules and allowlists. |
| Secrets in old commits               | Use git history rewriting tools like `git filter-repo` or BFG.          |
| Secrets embedded in binary files    | Use specialized tools or exclude binary paths from scan.               |
| Developer resistance to secret removal | Educate teams on risks and benefits of shift-left security.               |
| Dependency conflicts during installation | Use consistent dependency versions and containerization for reproducibility. |

---

## Shift-Left Security in DevSecOps

**Shift-left security** is an approach where security testing, reviews, and fixes are integrated early in the software development lifecycle—ideally during design, coding, and initial commit phases, rather than waiting for post-deployment or late-stage review. In DevSecOps, this means developers, operations, and security collaborate from the start, using automated tools and secure coding practices.

### Why Is Shift-Left Security Important?

- **Early detection leads to safer code:** By moving security “left” in the timeline, vulnerabilities and secret leaks are caught when they are cheaper and simpler to fix—before they reach production.
- **Reduces cost and technical debt:** Fixing security issues at design/coding is exponentially less expensive than remediating production issues. Studies show costs can be up to 100 times higher if remediation happens post-release.
- **Better developer awareness and culture:** Developers learn secure coding early, improving code quality and fostering security awareness.
- **Faster shipping and fewer delays:** Fewer security surprises during release cycles translate to faster delivery and reduced bottlenecks.

---

## Detecting Secrets Early in the CI/CD Pipeline

Automated tools like Gitleaks scan for hardcoded secrets (API keys, passwords, certificates) early in the pipeline. Early detection:

- **Prevents production vulnerabilities:** Secrets are removed before code is released, ensuring attackers cannot access credentials from public repositories or deployed code.
- **Ensures compliance:** Sensitive data is less likely to leak, reducing compliance and regulatory risks.
- **Supports instant remediation:** Developers can rotate keys and fix code immediately after a failed secret scan, safeguarding production environments.

---

## Secure Strategies for Secret Management

Instead of hardcoding, use secure practices:

- **Environment variables:** Store secrets externally and inject via environment, not in source code.
- **Secret management services:** Use vaults (AWS Secrets Manager, HashiCorp Vault, Azure Key Vault) to securely manage access.
- **Config files kept out of source:** Store sensitive configs separately and never commit to the repo.
- **CI/CD secrets injection:** Use CI/CD platforms’ secret management features to inject sensitive values at build/deploy time.

---

## Example of Ongoing Secret Exposure & Prevention

**Situation:**  
A developer removes a secret from the latest code but does not rewrite older git commits. The secret remains visible in the repository’s history, so it is still accessible to anyone who clones the repo or uses git log tools.

**Prevention:**
- Always rewrite git history with tools like `git filter-repo` or BFG Repo Cleaner.
- After removing secrets and rewriting history, force-push cleaned branches.
- Rotate or revoke any secrets exposed, even if removed from code.
- Periodically rescan the repository, including its history, even after initial clean-up.

---
