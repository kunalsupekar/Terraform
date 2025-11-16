# Infracost Setup Guide (Windows Only)

This guide explains how to install and configure **Infracost** on a Windows machine and integrate it with your Terraform project.

🔗 **Official Docs:** https://www.infracost.io/docs/

---

## ✅ Prerequisites
Make sure you have the following installed:

1. **Terraform** – Download from: https://developer.hashicorp.com/terraform/downloads
2. **Git** – Download from: https://git-scm.com/downloads
3. **PowerShell** or **Command Prompt**

---

## 🛠️ Step 1: Install Infracost on Windows

Open **PowerShell** and run:

```powershell
choco install infracost -y
```

If you don't have Chocolatey installed, install it first:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = 
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex
```

Then run the Infracost install command again.

---

## 🔐 Step 2: Setup Infracost API Key
Create a free account and get your API key:

👉 https://dashboard.infracost.io

Then configure it:

```powershell
infracost auth login
```

---

## 📁 Step 3: Navigate to Your Terraform Project
Go to the folder containing your `main.tf`:

```powershell
cd D:\Your\Terraform\Project
```

---

## ▶️ Step 4: Run Terraform Init
```powershell
terraform init
```

---

## 💰 Step 5: Generate Cost Estimate
Run:

```powershell
infracost breakdown --path . --format table
```

Or generate a detailed HTML report:

```powershell
infracost breakdown --path . --format html --out-file infracost-report.html
```

---

## 📊 Step 6: Open the Cost Report
If you generated the HTML output:

```powershell
start infracost-report.html
```

---

## 🔄 Optional: Automate Cost Estimation in GitHub
If you want PR comments with pricing changes, follow:

https://www.infracost.io/docs/integrations/github_app/

---

## 🎉 You're Ready!
You now have Infracost running on Windows and can calculate AWS infrastructure cost directly from your Terraform code.

For more modules and examples, check my GitHub re