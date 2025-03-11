# Smart Recruitment Insight Platform

## 🚀 Overview
Advanced recruitment platform leveraging Next.js and Neo4j to provide deep insights into candidate data, job applications, and recruitment analytics.

## 🔍 System Architecture

```mermaid
graph TD
    A[User Interface] --> B[Next.js Frontend]
    B --> C{API Routes}
    
    subgraph Database Layer
        D[Neo4j Graph Database]
        E[Natural Language Query Parser]
    end
    
    subgraph Data Flow
        C --> E
        E --> D
        D --> F[Data Processing]
        F --> G[Visualization Components]
    end
    
    G --> H[Dashboard Visualizations]
    G --> I[Exportable Data Formats]
    
    subgraph Key Components
        J[Candidate Management]
        K[Job Application Tracking]
        L[Recruitment Analytics]
        M[Export Functionality]
    end
    
    D --> J
    D --> K
    D --> L
    C --> M
```

## 🔄 Data Flow Diagram

```mermaid
sequenceDiagram
    participant UI as User Interface
    participant NQ as Natural Query Parser
    participant DB as Neo4j Database
    participant AN as Analytics Engine
    participant VIZ as Visualization Module
    participant EXP as Export Module

    UI->>NQ: Submit Natural Language Query
    NQ->>DB: Translate & Execute Query
    DB-->>NQ: Retrieve Candidate/Job Data
    NQ-->>AN: Process Raw Data
    
    AN->>VIZ: Generate Insights
    VIZ->>UI: Render Dashboard
    
    UI->>EXP: Export Request
    EXP->>DB: Fetch Complete Dataset
    DB-->>EXP: Return Full Data
    EXP->>UI: Provide CSV/PDF Export
```

## 📊 Neo4j Graph Data Model

```mermaid
erDiagram
    CANDIDATE ||--o{ JOB_APPLICATION : "applies to"
    CANDIDATE ||--|| SKILL : "possesses"
    JOB ||--o{ SKILL : "requires"
    RECRUITER ||--o{ JOB : "posts"
    COMPANY ||--o{ JOB : "offers"

    CANDIDATE {
        string id PK
        string name
        string email
        int age
        string location
    }

    JOB {
        string id PK
        string title
        string description
        string company
        float salary
    }
```

## ✨ Features
- 🧠 Natural Language Query Interface
- 📋 Candidate Dashboard
- 📊 Top Job Seekers Visualization
- 📥 Data Export Capabilities
- 🔍 Advanced Filtering

## 🛠 Technology Stack
- Next.js 14
- React
- Neo4j
- Recharts
- Tailwind CSS
- Docker
- TypeScript

## 📋 Prerequisites
- Node.js 18+
- Docker
- Docker Compose
- Neo4j

## 🚢 Containerization

### Quick Start
```bash
# Clone the repository
git clone https://github.com/ajeetraina/smart-recruitment-insight.git

# Navigate to project directory
cd smart-recruitment-insight

# Build and start services
docker-compose up --build

# Stop services
docker-compose down
```

### Services
- **App**: Next.js Application (http://localhost:3000)
- **Neo4j**: Graph Database (http://localhost:7474)
- **Adminer**: Database Management (http://localhost:8080)

## 🔧 Local Development Setup

### Install Dependencies
```bash
npm install
# or
yarn install
```

### Configure Environment
Create a `.env` file:
```
NEO4J_URI=bolt://localhost:7687
NEO4J_USERNAME=neo4j
NEO4J_PASSWORD=your_password
```

### Run Development Server
```bash
npm run dev
# or
yarn dev
```

## 🤝 Contributing
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License
MIT License

## 🌟 Star the Project
If you find this project useful, please give it a star! ⭐
