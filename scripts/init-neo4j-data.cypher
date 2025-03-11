// Sample initial data for Neo4j database

// Create Candidates
CREATE (c1:Candidate {id: '1', name: 'John Doe', email: 'john.doe@example.com', age: 28, location: 'New York'})
CREATE (c2:Candidate {id: '2', name: 'Jane Smith', email: 'jane.smith@example.com', age: 32, location: 'San Francisco'})

// Create Skills
CREATE (s1:Skill {id: '1', name: 'Python', category: 'Programming'})
CREATE (s2:Skill {id: '2', name: 'React', category: 'Frontend'})
CREATE (s3:Skill {id: '3', name: 'Neo4j', category: 'Database'})

// Create Companies
CREATE (comp1:Company {id: '1', name: 'TechCorp', industry: 'Technology', location: 'San Francisco'})

// Create Jobs
CREATE (job1:Job {id: '1', title: 'Senior Software Engineer', description: 'Looking for an experienced software engineer', company: 'TechCorp', salary: 120000})

// Create Relationships
CREATE (c1)-[:HAS_SKILL]->(s1)
CREATE (c1)-[:HAS_SKILL]->(s2)
CREATE (c2)-[:HAS_SKILL]->(s3)

CREATE (job1)-[:REQUIRES_SKILL]->(s1)
CREATE (job1)-[:REQUIRES_SKILL]->(s2)

CREATE (c1)-[:APPLIED_TO {status: 'Pending', applicationDate: date()}]->(job1)

// Create a Recruiter
CREATE (r1:Recruiter {id: '1', name: 'Alice Johnson', department: 'Engineering'})
CREATE (r1)-[:POSTED]->(job1)