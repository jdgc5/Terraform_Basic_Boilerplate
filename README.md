# Terraform Boilerplate

This is a basic **Terraform boilerplate** that provides a structured way to manage and deploy AWS infrastructure using Terraform. It includes modular configurations to ensure your files are well structured

## Project Structure

### `providers.tf`
Defines the required providers and specifies the AWS provider along with the Terraform version constraints.

### `variables.tf`
Contains configurable variables such as the number of S3 buckets, AWS region, and bucket name prefix. This allows for easy customization without modifying the core Terraform files.

### `main.tf`
Holds the main Terraform configurations, including:
- Random string generator for unique resource naming.
- S3 bucket creation using the defined variables.

### `vpc.tf`

Defines the configuration for the Virtual Private Cloud (VPC), including:

- Creation of a custom VPC.
- Subnets, route tables, and internet gateway configurations.
- Security groups and network ACLs.

### `outputs.tf`
Specifies the outputs of the Terraform deployment, such as the names of the created S3 buckets.

### `terraform.tfvars`
(Optional) Defines variable values that override defaults in `variables.tf`, allowing environment-specific configurations.

---

# Boilerplate de Terraform

Este es un **boilerplate de Terraform** básico que proporciona una estructura organizada para gestionar y desplegar infraestructura en AWS con Terraform. Incluye configuraciones modulares para garantizar que tus archivos están bien estructurados

## Estructura del Proyecto

### `providers.tf`
Define los proveedores requeridos y especifica el proveedor de AWS junto con las versiones compatibles de Terraform.

### `variables.tf`
Contiene variables configurables como la cantidad de buckets S3, la región de AWS y el prefijo de los nombres de los buckets. Esto permite personalizar la infraestructura sin modificar el código principal de Terraform.

### `main.tf`
Incluye la configuración principal de Terraform, como:
- Generación de cadenas aleatorias para nombres únicos de recursos.
- Creación de buckets S3 usando las variables definidas.

### `vpc.tf`

Define la configuración de la Virtual Private Cloud (VPC), incluyendo:

- Creación de una VPC personalizada.
- Configuración de subnets, tablas de rutas e internet gateway.
- Grupos de seguridad y listas de control de acceso a la red (ACLs).

### `outputs.tf`
Define las salidas del despliegue de Terraform, como los nombres de los buckets creados.

### `terraform.tfvars`
(Opcional) Contiene valores de variables que sobrescriben los valores por defecto en `variables.tf`, permitiendo configuraciones específicas por entorno.

## Documentation

You can use official terraform documentation `https://registry.terraform.io/` to find all the information about Terraform providers, configuration syntax, and available resource

## Autor

Created and maintained by J.David Garcia . Feel free to contribute or suggest improvements!