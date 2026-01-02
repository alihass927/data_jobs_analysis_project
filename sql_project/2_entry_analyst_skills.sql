
WITH top_analyst_skills AS (
    SELECT	
	job_postings_fact.job_id,
	job_postings_fact.job_title_short,
    company_dim.name AS company_name,
	job_postings_fact.salary_year_avg,
	job_postings_fact.job_country
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_postings_fact.job_title_short = 'Business Analyst' AND 
    job_postings_fact.job_country = 'United States' AND 
    job_postings_fact.salary_year_avg IS NOT NULL
ORDER BY
    job_postings_fact.salary_year_avg ASC
LIMIT 100
)
SELECT 
    top_analyst_skills.*,
    skills_dim.skills
FROM 
    top_analyst_skills
INNER JOIN skills_job_dim ON top_analyst_skills.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    top_analyst_skills.salary_year_avg ASC;
