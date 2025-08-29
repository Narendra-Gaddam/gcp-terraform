# Terraform Basics with GCP

## 1. Prerequisites
- Google Cloud Project (with billing enabled).
- Service Account with JSON key.
- Terraform installed locally (or Cloud Shell).

---

## 2. Create a Service Account Key (JSON)
1. Go to **GCP Console** → [IAM & Admin → Service Accounts](https://console.cloud.google.com/iam-admin/serviceaccounts).
2. Click **Create Service Account**.
3. Give it a name (e.g., `terraform-sa`).
4. Assign roles (minimum recommended):
   - `Compute Admin`
   - `Storage Admin`
   - `Viewer`
5. After creation → go to **Keys** tab → **Add Key** → **JSON**.
6. Download the file (e.g., `terraform-sa.json`).

⚠️ Do **NOT** commit this file to GitHub. Keep it secret.

---

## 3. Set Authentication
### Option A – Environment Variable (recommended)
```bash
export GOOGLE_APPLICATION_CREDENTIALS="/absolute/path/to/terraform-sa.json"

