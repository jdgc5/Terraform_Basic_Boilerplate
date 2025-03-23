# Terraform Boilerplate

This is a basic **Terraform boilerplate** that provides a structured way to manage and deploy AWS infrastructure using Terraform. It includes modular configurations to ensure your files are well structured

## Project Structure

terraform_boilerplate/
├── .terraform/                # Terraform internal files (DO NOT commit)
├── environment/
│   ├── dev/                   # Development environment
│   │   ├── main.tf            # Environment-specific configurations
│   │   ├── output.tf          # Environment-specific outputs
│   │   ├── providers.tf       # Provider settings for this environment
│   │   ├── variables.tf       # Environment-specific variables
│   ├── staging/               # Staging environment (future use)
│   ├── prod/                  # Production environment (future use)
│
├── modules/                   # Reusable infrastructure modules
│   ├── compute/               # Compute resources (EC2, ASG, etc.)
│   │   ├── data.tf            # Data sources
│   │   ├── ec2.tf             # EC2 instance definitions
│   │   ├── locals.tf          # Local variables specific to compute
│   │   ├── output.tf          # Outputs related to compute resources
│   │   ├── providers.tf       # Provider configuration
│   │   ├── variables.tf       # Compute module variables
│   ├── networking/            # Network infrastructure (VPC, Subnets, etc.)
│   │   ├── internet_gateway.tf # Internet Gateway configuration
│   │   ├── output.tf          # Networking module outputs
│   │   ├── providers.tf       # Provider configuration
│   │   ├── route_table.tf     # Route table configurations
│   │   ├── security_group.tf  # Security group rules
│   │   ├── vpc.tf             # VPC and subnet configurations
│
├── scripts/                   # Auxiliary scripts for provisioning
│   ├── userdata.sh            # Script to initialize instances on boot
│
├── .gitignore                 # Ignore sensitive Terraform files
├── .terraform.lock.hcl         # Terraform provider lock file
├── datos_instancia.txt         # Output file containing instance details
├── instance_ips.json           # JSON file with instance IPs
│
├── main.tf                     # Root Terraform configuration
├── output.tf                    # Root module outputs
├── providers.tf                 # Root provider definitions
├── terraform.tfvars             # Tfvars file
├── variables.tf                 # Main variables
│
└── README.md                    # Project documentation

---

## **📜 File Descriptions**

### **🔹 Root Directory**
- **`providers.tf`**  
  Defines the **Terraform required providers** and the **AWS provider**, including multiple regions (`us-east-1`, `us-east-2` and `us-east` without alias).
  
- **`variables.tf`**  
  Contains global variables used across the Terraform configurations.

- **`main.tf`**  
  Holds the main Terraform module configurations, including:
  - Networking module (`modules/networking`)
  - Compute module (`modules/compute/ec2`)
  - Dev environment (`environment/dev`)
  - S3 state backend (`cloudposse/tfstate-backend/aws`)

- **`output.tf`**  
  Outputs key infrastructure information after deployment.

---

### **🔹 `environment/dev/`**
This directory contains **environment-specific** configurations. Similar structures exist for `staging/` and `prod/`.

- **`main.tf`** → Defines environment-specific configurations, referencing modules.  
- **`providers.tf`** → Specifies the AWS provider for this environment.  
- **`variables.tf`** → Contains environment-specific variables.  
- **`output.tf`** → Outputs information relevant to this environment.

---

### **🔹 `modules/compute/`**
This module defines **compute resources**, such as EC2 instances.

- **`ec2.tf`** → Defines EC2 instances and their configurations.
- **`data.tf`** → Retrieves required AWS data sources.
- **`locals.tf`** → Defines local variables for the module.
- **`variables.tf`** → Inputs for the compute module.
- **`output.tf`** → Outputs related to compute instances.

---

### **🔹 `modules/networking/`**
This module defines **networking infrastructure**, including VPCs and security groups.

- **`vpc.tf`** → Defines the Virtual Private Cloud (VPC) and subnets.
- **`internet_gateway.tf`** → Configures the internet gateway.
- **`security_group.tf`** → Defines security group rules.
- **`route_table.tf`** → Manages route tables.
- **`output.tf`** → Outputs networking-related details.
- **`variables.tf`** → Inputs for the networking module.

---

### **🔹 `scripts/`**
This folder contains scripts used during provisioning.

- **`userdata.sh`** → Used to bootstrap EC2 instances on launch. (commented EC2 option)

---

## **📖 Documentation & Resources**
- Official Terraform Registry: [terraform.io](https://registry.terraform.io/)  
- AWS Provider Docs: [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)  
- Terraform Best Practices: [HashiCorp Docs](https://developer.hashicorp.com/terraform/docs)  

---

## **👨‍💻 Author**
Created and maintained by **J. David Garcia**. Feel free to contribute or suggest improvements! 🚀

