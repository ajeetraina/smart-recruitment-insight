# Smart Recruitment Insight Platform

## Overview
A cutting-edge recruitment platform leveraging Next.js and Neo4j to provide deep insights into candidate data, job applications, and recruitment analytics.

## System Architecture

```mermaid
%%{init: {'theme': 'base', 'themeVariables': {
    'primaryColor': '#4C7BE3',
    'primaryTextColor': '#fff',
    'primaryBorderColor': '#1A3B6C',
    'lineColor': '#4C7BE3',
    'secondaryColor': '#6C757D',
    'tertiaryColor': '#F8F9FA'
}}}%%

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

## Data Flow Diagram

```mermaid
%%{init: {'theme': 'neutral', 'themeVariables': {
    'primaryColor': '#3498db',
    'primaryTextColor': '#ffffff',
    'fontFamily': 'Arial, sans-serif'
}}}%%

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

## Neo4j Graph Data Model

```mermaid
%%{init: {'theme': 'forest', 'themeVariables': {
    'primaryColor': '#2ecc71',
    'primaryTextColor': '#ffffff',
    'lineColor': '#3498db'
}}}%%

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

    SKILL {
        string id PK
        string name
        string category
    }

    RECRUITER {
        string id PK
        string name
        string department
    }

    COMPANY {
        string id PK
        string name
        string industry
        string location
    }

    JOB_APPLICATION {
        string id PK
        date applicationDate
        string status
    }
```

## Features
- Natural Language Query Interface
- Candidate Dashboard
- Top Job Seekers Visualization
- Data Export Capabilities
- Advanced Filtering

## Prerequisites
- Node.js (v18+)
- Neo4j Desktop or Cloud Instance
- npm or yarn

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/ajeetraina/smart-recruitment-insight.git
cd smart-recruitment-insight
```

### 2. Install Dependencies
```bash
npm install
# or
yarn install
```

### 3. Configure Neo4j Connection
Create a `.env` file in the root directory:
```
NEO4J_URI=bolt://localhost:7687
NEO4J_USERNAME=neo4j
NEO4J_PASSWORD=your_password
```

### 4. Run Development Server
```bash
npm run dev
# or
yarn dev
```

## Key Technologies
- Next.js 14
- React
- Neo4j
- Recharts
- Tailwind CSS

## Deployment
Easily deployable on Vercel, Netlify, or any Node.js-supported platform.

## Contributing
1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License
MIT License
