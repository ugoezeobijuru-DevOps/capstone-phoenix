# Architecture - Capstone Phoenix

## Node Topology
- 1 Control Plane: ip-10-0-1-102 (44.222.237.121)
- 2 Workers: ip-10-0-1-242 (98.92.63.99), ip-10-0-1-152 (3.227.22.85)

## How a Request Flows
DNS (taskapp-ugoeze.duckdns.org) -> AWS Security Group -> Nginx Ingress Controller -> Frontend Service (port 80) -> Frontend Pod -> /api/ -> Backend Service (port 5000) -> Backend Pod -> Postgres Service (port 5432) -> Postgres StatefulSet

## Infrastructure
- Cloud: AWS (us-east-1)
- Nodes: 3x t3.micro EC2 instances
- Networking: Custom VPC (10.0.0.0/16), public subnet
- Firewall: ports 22, 80, 443 open; 6443 restricted to my IP
- Remote state: S3 bucket + DynamoDB lock

## Kubernetes Components
- Distribution: k3s v1.35.5
- Ingress: nginx ingress controller
- TLS: cert-manager + Lets Encrypt
- GitOps: Argo CD
- Autoscaling: HPA (metrics-server)

## Core Requirements vs Single Server
| Requirement | Single-server problem fixed |
|-------------|----------------------------|
| StatefulSet + PVC | Data survives pod restarts |
| 2 replicas + anti-affinity | No single point of failure |
| Migrations as Job | No race condition at startup |
| Probes | Traffic only goes to healthy pods |
| Resource limits | One pod cannot starve others |
| RollingUpdate | Zero downtime deploys |
| Ingress + TLS | Real HTTPS on real domain |
| HPA | Auto-scales under load |
| NetworkPolicy | Blast radius containment |
| PDB | No outages during maintenance |
