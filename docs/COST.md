# Cost - Capstone Phoenix

## Monthly Cost Breakdown (AWS us-east-1)

| Resource | Type | Qty | Unit Cost | Monthly Cost |
|----------|------|-----|-----------|--------------|
| EC2 Instances | t3.micro | 3 | $0.0104/hr | $22.46 |
| EBS Volumes | gp3 20GB | 3 | $0.08/GB/mo | $4.80 |
| S3 (Terraform state) | Standard | 1 | $0.023/GB | $0.01 |
| DynamoDB (TF lock) | On-demand | 1 | Minimal | $0.01 |
| Data Transfer | Outbound | ~10GB | $0.09/GB | $0.90 |
| **Total** | | | | **~$28.18/mo** |

## How to Cut Cost in Half

Switch from t3.micro to ARM-based t4g.micro instances ($0.0084/hr) saving 20%, 
use reserved instances for 1-year commitment saving 40%, 
and run only 1 worker during development saving another 33%. 
Combined these changes would bring the monthly cost to approximately $13/mo.
Alternatively, migrate to Hetzner Cloud where 3x CX21 instances (2 vCPU, 4GB RAM) 
cost only 12 EUR/month total, solving both cost and memory pressure issues.
