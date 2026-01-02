

SELECT	
	job_postings_fact.job_title_short,
    company_dim.name AS company_name,
	job_postings_fact.salary_year_avg,
	job_postings_fact.job_country
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' AND 
    job_postings_fact.job_country = 'United States' AND 
    job_postings_fact.salary_year_avg IS NOT NULL
ORDER BY
    job_postings_fact.salary_year_avg
LIMIT 50;