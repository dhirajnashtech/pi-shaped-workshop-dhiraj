```markdown
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
   ```

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
```
