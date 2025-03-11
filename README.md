# Smart Recruitment Insight Platform

## Containerization

### Prerequisites
- Docker
- Docker Compose

### Building and Running
```bash
# Build and start the services
docker-compose up --build

# Stop the services
docker-compose down
```

### Environment Configuration
Configure your Neo4j credentials in `docker-compose.yml`

## Additional Documentation (Previous content remains the same)

### Docker Services
- **app**: Next.js application
- **neo4j**: Graph database
- **adminer**: Optional database management interface

## Deployment Notes
- Ensure to change default passwords
- Use environment variables for sensitive information
- Adjust resource limits as needed

## Volumes
- `neo4j-data`: Persistent Neo4j database storage
- `neo4j-logs`: Neo4j log storage

## Accessing Services
- App: http://localhost:3000
- Neo4j Browser: http://localhost:7474
- Adminer: http://localhost:8080