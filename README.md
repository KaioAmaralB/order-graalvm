# GraalVM JIT vs AOT on OCI OKE (Spring Boot + Log4j2)

This repository contains a hands-on lab to deploy and benchmark the same Spring Boot service on **OCI OKE** using two approaches:
- **GraalVM JIT** (running as a traditional Spring Boot JAR on the GraalVM JDK)
- **GraalVM Native Image (AOT)** (running as a native executable)

The full step-by-step guide, architecture, provisioning, deployment, and benchmark results are documented in the Medium article:

https://medium.com/@kaioamaralbispo/running-graalvm-aot-jit-java-17-spring-boot-log4j2-on-oci-oke-e60c47ac8f6c

## What’s inside (high level)
- Terraform code (OCI Resource Manager) to provision the environment
- Dockerfiles to build **JIT** and **AOT** images
- Kubernetes manifests to deploy both versions on OKE
- JMeter test plan (`GraalVM.jmx`) used for the benchmark

## Quick start
Follow the Medium article and run the steps in order:
1. Provision the environment (Terraform via OCI Resource Manager)
2. Build and push images to OCIR (JIT + AOT)
3. Configure kubectl access to the OKE cluster
4. Apply Kubernetes manifests
5. Run the JMeter benchmark and compare results

## Repository structure
- `graalvm/` — application source + Dockerfile(s)
- `manifests/` — Kubernetes manifests (JIT and Native)
- `terraform/` (or similar) — provisioning via Terraform/Resource Manager
- `GraalVM.jmx` — JMeter test plan

## Notes
If you run into authentication issues when accessing the cluster via `kubectl`, check the “Notes / Troubleshooting” section in the article.
