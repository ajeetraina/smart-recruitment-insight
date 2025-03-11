// Clear existing data
MATCH (n) DETACH DELETE n;

// Create Skills
CREATE 
(skill_python:Skill {id: 'skill_1', name: 'Python', category: 'Programming'}),
(skill_java:Skill {id: 'skill_2', name: 'Java', category: 'Programming'}),
(skill_javascript:Skill {id: 'skill_3', name: 'JavaScript', category: 'Frontend'}),
(skill_react:Skill {id: 'skill_4', name: 'React', category: 'Frontend'}),
(skill_nodejs:Skill {id: 'skill_5', name: 'Node.js', category: 'Backend'}),
(skill_neo4j:Skill {id: 'skill_6', name: 'Neo4j', category: 'Database'}),
(skill_machine_learning:Skill {id: 'skill_7', name: 'Machine Learning', category: 'Data Science'}),
(skill_aws:Skill {id: 'skill_8', name: 'AWS', category: 'Cloud'}),
(skill_docker:Skill {id: 'skill_9', name: 'Docker', category: 'DevOps'}),
(skill_sql:Skill {id: 'skill_10', name: 'SQL', category: 'Database'});

// Create Companies
CREATE 
(company_tech_innovations:Company {id: 'company_1', name: 'Tech Innovations Inc.', industry: 'Technology', location: 'San Francisco'}),
(company_data_dynamics:Company {id: 'company_2', name: 'Data Dynamics', industry: 'Data Analytics', location: 'New York'}),
(company_cloud_solutions:Company {id: 'company_3', name: 'Cloud Solutions Group', industry: 'Cloud Computing', location: 'Seattle'}),
(company_ai_frontiers:Company {id: 'company_4', name: 'AI Frontiers', industry: 'Artificial Intelligence', location: 'Boston'}),
(company_digital_forge:Company {id: 'company_5', name: 'Digital Forge', industry: 'Software Development', location: 'Austin'});

// Create Recruiters
CREATE 
(recruiter_alice:Recruiter {id: 'recruiter_1', name: 'Alice Johnson', department: 'Engineering Recruitment', email: 'alice.johnson@techinnovations.com'}),
(recruiter_bob:Recruiter {id: 'recruiter_2', name: 'Bob Williams', department: 'Data Science Recruitment', email: 'bob.williams@datadynamics.com'}),
(recruiter_charlie:Recruiter {id: 'recruiter_3', name: 'Charlie Brown', department: 'Cloud Recruitment', email: 'charlie.brown@cloudsolutions.com'});

// Create Jobs
CREATE 
(job_senior_dev:Job {
    id: 'job_1', 
    title: 'Senior Software Engineer', 
    description: 'Seeking an experienced software engineer to develop scalable web applications', 
    company: 'Tech Innovations Inc.', 
    salary: 135000, 
    location: 'San Francisco',
    status: 'Open'
}),
(job_data_scientist:Job {
    id: 'job_2', 
    title: 'Machine Learning Engineer', 
    description: 'Looking for a talented ML engineer to develop cutting-edge AI solutions', 
    company: 'Data Dynamics', 
    salary: 145000, 
    location: 'New York',
    status: 'Open'
}),
(job_cloud_architect:Job {
    id: 'job_3', 
    title: 'Cloud Solutions Architect', 
    description: 'Designing and implementing cloud infrastructure for enterprise clients', 
    company: 'Cloud Solutions Group', 
    salary: 155000, 
    location: 'Seattle',
    status: 'Open'
});

// Create Candidates
CREATE 
(candidate_john:Candidate {
    id: 'candidate_1', 
    name: 'John Doe', 
    email: 'john.doe@email.com', 
    age: 28, 
    location: 'San Francisco', 
    experience_years: 5,
    current_role: 'Software Engineer',
    education: 'Bachelor of Science in Computer Science'
}),
(candidate_emily:Candidate {
    id: 'candidate_2', 
    name: 'Emily Chen', 
    email: 'emily.chen@email.com', 
    age: 32, 
    location: 'New York', 
    experience_years: 7,
    current_role: 'Data Scientist',
    education: 'Ph.D. in Machine Learning'
}),
(candidate_michael:Candidate {
    id: 'candidate_3', 
    name: 'Michael Rodriguez', 
    email: 'michael.rodriguez@email.com', 
    age: 35, 
    location: 'Seattle', 
    experience_years: 10,
    current_role: 'Cloud Solutions Architect',
    education: 'Master of Science in Cloud Computing'
}),
(candidate_sarah:Candidate {
    id: 'candidate_4', 
    name: 'Sarah Kim', 
    email: 'sarah.kim@email.com', 
    age: 29, 
    location: 'Austin', 
    experience_years: 6,
    current_role: 'Frontend Developer',
    education: 'Bachelor of Science in Software Engineering'
}),
(candidate_alex:Candidate {
    id: 'candidate_5', 
    name: 'Alex Thompson', 
    email: 'alex.thompson@email.com', 
    age: 40, 
    location: 'Boston', 
    experience_years: 15,
    current_role: 'Senior Engineering Manager',
    education: 'Master of Business Administration'
});

// Create Job Applications
CREATE 
(job_application_1:JobApplication {
    id: 'application_1', 
    status: 'Applied', 
    application_date: date(), 
    cover_letter: 'Excited about the opportunity to contribute to innovative software solutions.'
}),
(job_application_2:JobApplication {
    id: 'application_2', 
    status: 'Screening', 
    application_date: date(), 
    cover_letter: 'Passionate about leveraging machine learning to solve complex business challenges.'
}),
(job_application_3:JobApplication {
    id: 'application_3', 
    status: 'Interview', 
    application_date: date(), 
    cover_letter: 'Experienced cloud architect looking to drive digital transformation.'
});

// Create Relationships
// Skill Relationships
CREATE 
(candidate_john)-[:HAS_SKILL {proficiency: 'Expert'}]->(skill_python),
(candidate_john)-[:HAS_SKILL {proficiency: 'Advanced'}]->(skill_javascript),
(candidate_john)-[:HAS_SKILL {proficiency: 'Intermediate'}]->(skill_react),

(candidate_emily)-[:HAS_SKILL {proficiency: 'Expert'}]->(skill_machine_learning),
(candidate_emily)-[:HAS_SKILL {proficiency: 'Advanced'}]->(skill_python),
(candidate_emily)-[:HAS_SKILL {proficiency: 'Intermediate'}]->(skill_sql),

(candidate_michael)-[:HAS_SKILL {proficiency: 'Expert'}]->(skill_aws),
(candidate_michael)-[:HAS_SKILL {proficiency: 'Advanced'}]->(skill_docker),
(candidate_michael)-[:HAS_SKILL {proficiency: 'Intermediate'}]->(skill_neo4j),

(candidate_sarah)-[:HAS_SKILL {proficiency: 'Expert'}]->(skill_react),
(candidate_sarah)-[:HAS_SKILL {proficiency: 'Advanced'}]->(skill_javascript),
(candidate_sarah)-[:HAS_SKILL {proficiency: 'Intermediate'}]->(skill_nodejs),

(candidate_alex)-[:HAS_SKILL {proficiency: 'Expert'}]->(skill_java),
(candidate_alex)-[:HAS_SKILL {proficiency: 'Advanced'}]->(skill_python),
(candidate_alex)-[:HAS_SKILL {proficiency: 'Intermediate'}]->(skill_machine_learning);

// Job-Skill Relationships
CREATE 
(job_senior_dev)-[:REQUIRES_SKILL {importance: 'Critical'}]->(skill_python),
(job_senior_dev)-[:REQUIRES_SKILL {importance: 'Important'}]->(skill_javascript),
(job_senior_dev)-[:REQUIRES_SKILL {importance: 'Desirable'}]->(skill_react),

(job_data_scientist)-[:REQUIRES_SKILL {importance: 'Critical'}]->(skill_machine_learning),
(job_data_scientist)-[:REQUIRES_SKILL {importance: 'Important'}]->(skill_python),
(job_data_scientist)-[:REQUIRES_SKILL {importance: 'Desirable'}]->(skill_sql),

(job_cloud_architect)-[:REQUIRES_SKILL {importance: 'Critical'}]->(skill_aws),
(job_cloud_architect)-[:REQUIRES_SKILL {importance: 'Important'}]->(skill_docker),
(job_cloud_architect)-[:REQUIRES_SKILL {importance: 'Desirable'}]->(skill_neo4j);

// Job Application Relationships
CREATE 
(candidate_john)-[:APPLIED {application_id: 'application_1'}]->(job_senior_dev),
(candidate_emily)-[:APPLIED {application_id: 'application_2'}]->(job_data_scientist),
(candidate_michael)-[:APPLIED {application_id: 'application_3'}]->(job_cloud_architect);

// Recruiter-Job Relationships
CREATE 
(recruiter_alice)-[:POSTED]->(job_senior_dev),
(recruiter_bob)-[:POSTED]->(job_data_scientist),
(recruiter_charlie)-[:POSTED]->(job_cloud_architect);

// Company-Job Relationships
CREATE 
(company_tech_innovations)-[:OFFERS]->(job_senior_dev),
(company_data_dynamics)-[:OFFERS]->(job_data_scientist),
(company_cloud_solutions)-[:OFFERS]->(job_cloud_architect);

RETURN 'Mock data generation complete' AS result;
