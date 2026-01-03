WITH job_skills AS (
    SELECT 
    skills_dim.skills,
    job_postings_fact.job_title_short
    FROM skills_dim
    INNER JOIN skills_job_dim  ON skills_dim.skill_id = skills_job_dim.skill_id
    INNER JOIN job_postings_fact  ON skills_job_dim.job_id = job_postings_fact.job_id
    WHERE job_postings_fact.job_title_short IN ('Data Analyst', 'Business Analyst')
)
SELECT 
    skills,
    COUNT(DISTINCT job_title_short) AS roles_count,
    COUNT(*) AS total_postings
FROM job_skills
GROUP BY skills
HAVING COUNT(DISTINCT job_title_short) = 2
ORDER BY total_postings DESC
LIMIT 10;



/*
[
  {
    "skills": "sql",
    "roles_count": "2",
    "total_postings": "110000"
  },
  {
    "skills": "excel",
    "roles_count": "2",
    "total_postings": "84165"
  },
  {
    "skills": "python",
    "roles_count": "2",
    "total_postings": "65423"
  },
  {
    "skills": "tableau",
    "roles_count": "2",
    "total_postings": "55878"
  },
  {
    "skills": "power bi",
    "roles_count": "2",
    "total_postings": "48719"
  },
  {
    "skills": "r",
    "roles_count": "2",
    "total_postings": "34110"
  },
  {
    "skills": "sas",
    "roles_count": "2",
    "total_postings": "31672"
  },
  {
    "skills": "powerpoint",
    "roles_count": "2",
    "total_postings": "18439"
  },
  {
    "skills": "word",
    "roles_count": "2",
    "total_postings": "17266"
  },
  {
    "skills": "sap",
    "roles_count": "2",
    "total_postings": "14948"
  }
]
*/