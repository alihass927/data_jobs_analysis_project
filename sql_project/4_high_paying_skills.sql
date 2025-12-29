/*
1. find out what are highest paid skills.
2. avg salary_year_avg
3. handle null values
*/

SELECT 
    skills,
    round(avg(job_postings_fact.salary_year_avg), 2) AS avg_salary_yearly
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Business Analyst' 
    AND job_postings_fact.job_country = 'United States'
    AND job_postings_fact.job_work_from_home = '0' 
    AND job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
ORDER BY
    avg_salary_yearly DESC
LIMIT 10;
