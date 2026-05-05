# List Services 
docker compose ps

# Also verify Docker images it downloaed
docker images
# Stop a Service
docker compose stop orders

# Verify if service is stopped
docker compose ps
docker compose ps -a

# Start a Service
docker compose start orders
# Restart a Service
docker compose restart cart

# Verify if service restarted
docker compose ps
# Logs for all services
docker compose logs

# Logs for a specific service
docker compose logs checkout

# Follow logs
docker compose logs -f checkout

# Stats 
docker compose stats

# Specific Containers
docker compose stats ui

# Display the running process of all service containers
docker compose top

# Specific containers
docker compose top ui
docker compose top checkout

# Stop and remove containers, networks
docker compose down

# List Docker Containers
docker ps
docker ps -a

# List Docker Images
docker images

# Prune all unused Docker objects (careful!)
docker system prune -a --volumes -f

# List Docker Images
docker images