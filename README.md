# SISTEMA DE REDE SOCIAL

## MICROSERVICE

### NGINX API Manager
v- Rotas  
x- Authentication - JWT  
v- Observability - Prometheus, Grafana, AlertManager  
v- SSL  
v- Load Balancing - least connections, round robin, weight, ip hash
x- Health Checks - low startup, max fails, fail timeout
v- Keepalive

### Grafana

localhost:3000

user/password:  
admin  
admin  

reset admin password:  
`docker exec -ti ef667da08ac2 grafana cli admin reset-admin-password --password-from-stdin admin`  

