# 🚀 Scalable EKS Cloud Architecture with GitLab CI/CD

[![pipeline status](https://gitlab.com/trukazz/eks-terraform-gitlab-cicd/badges/main/pipeline.svg)](https://gitlab.com/trukazz/eks-terraform-gitlab-cicd/-/pipelines)






### **Project Overview** 📝
This project implements a professional, automated workflow for deploying a high-availability **Amazon EKS (Elastic Kubernetes Service)** cluster. I utilized **Modular Terraform** for Infrastructure-as-Code (IaC) and **GitLab CI/CD** to ensure every infrastructure change is validated, linted, and planned before deployment.

---

### **🏗️ Architecture Implementation**
*   **High-Availability VPC**: Multi-AZ topology featuring 2 Public and 2 Private subnets for network isolation.
*   **Secure Egress**: Integrated NAT Gateways to facilitate secure outbound communication for private-tier worker nodes.
*   **Managed Compute**: EKS Managed Node Groups utilizing `t3.small` instances, balancing cost-efficiency with high-availability.
*   **K8s Orchestration**: Decoupled Kubernetes manifests for automated application lifecycle management.

### **Architecture Diagram**
```text
                                   ┌─────────────────────┐
                                   │  GitLab CI/CD       │
                                   │  (Orchestration)    │
                                   └──────────┬──────────┘
                                              │
                                   ┌──────────▼──────────┐
                                   │   Amazon EKS        │
                                   │   (Control Plane)   │
                                   └──────────┬───────────┘
                                              │
                        ┌─────────────────────┴─────────────────────┐
                        │                                           │
              ┌─────────▼─────────┐                     ┌──────────▼─────────┐
              │    Worker Node     │                     │    Worker Node     │
              │ (Private Subnet)   │                     │ (Private Subnet)   │
              └────────────────────┘                     └────────────────────┘
```
### **⚙️ The CI/CD Pipeline & Safety Gates**
I built the pipeline with automated checks to make sure every change is safe before it touches the cloud:
*   **Code Validation**: Automatically runs `terraform fmt` and `validate` to catch typos or syntax errors early.
*   **Infrastructure Planning**: Generates a `terraform plan` so I can see exactly what AWS will build before spending money.
*   **K8s Manifest Check**: Uses `kubeconform` to scan my Kubernetes files for errors before they go to the cluster.
*   **Manual Approval**: The `deploy` stage is intentionally set to **Manual**. This mimics a real-world setup where a Lead or Senior dev must approve the plan before it goes live.

### **🧩 Key Engineering Features**
*   **Built for Failure**: Used a Multi-AZ setup so the network stays online even if one AWS data centre goes down.
*   **Secure Secrets**: Used GitLab **Masked Variables** and **File-type secrets** so my AWS keys and passwords never leak in the logs.
*   **Clean & Modular**: Wrote the Terraform code in modules so it's easy to reuse and scale later.
*   **Approval Workflow**: Automated the planning but kept a "human in the loop" for the final deployment to stay safe.

### **🐛 Real-World Troubleshooting**
Building this wasn't just following a tutorial—I had to solve some tricky issues:
*   **GitLab Variable Mapping**: Figured out how to use **File-type variables** in GitLab to securely inject my `.tfvars` at runtime.
*   **Runner Maintenance**: Managed the EC2 runner environment, including cleaning up Docker images when the disk got full.
*   **Branch Security**: Set up **Branch Protection** so that my sensitive AWS keys are only released to verified pipelines.
*   **Runner Troubleshooting**: Resolved "Security Token" and connectivity errors by identifying a terminated EC2 runner and migrating the workload to GitLab Shared Runners.

### **🚀 How to Run this Project**
1.  **Clone the Code**: `git clone https://github.com`
2.  **Initialize**: Run `terraform init` to download the providers.
3.  **Check the Plan**: Run `terraform plan -var-file=terraform.tfvars` to see what will be built.
4.  **Deploy**: Push your code to GitLab to trigger the automation, then click "Play" on the manual stage.

---
## 📬 Contact & Connect
* **LinkedIn:** [Toga Mkandawire](https://www.linkedin.com)
