# Runbook - Capstone Phoenix

## Provision from Zero
1. cd infra/terraform && terraform init && terraform apply
2. SSH into control plane and install k3s server
3. Join workers with k3s agent
4. Fetch kubeconfig and update server IP
5. kubectl apply -f manifests/ --recursive

## Scale
kubectl scale deployment backend --replicas=3 -n taskapp

## Rollback
kubectl rollout undo deployment/backend -n taskapp

## Recover Dead Worker
Pods auto-reschedule to healthy nodes within 5 minutes

## Recover Dead Backend
kubectl rollout restart deployment/backend -n taskapp

## Bad Migration
kubectl exec -n taskapp postgres-0 -- psql -U taskapp -c "DELETE FROM alembic_version WHERE version_num='<bad>';"
