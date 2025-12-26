
WITH high_demand_skills AS (
    SELECT 
        skills_job_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.job_id) AS skills_demand
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst' 
        AND job_postings_fact.job_work_from_home = '0'
        AND job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY
        skills_job_dim.skill_id,
        skills_dim.skills
) ,
high_salary_skills AS (
    SELECT 
        skills_job_dim.skill_id,
        skills_dim.skills,
        round(avg(job_postings_fact.salary_year_avg), 2) AS avg_salary_yearly
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst' 
        AND job_postings_fact.job_work_from_home = '0' 
        AND job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY
        skills_job_dim.skill_id,
        skills_dim.skills
)

SELECT
    high_demand_skills.skill_id,
    high_demand_skills.skills,
    high_demand_skills.skills_demand,
    high_salary_skills.avg_salary_yearly
 FROM
    high_demand_skills
INNER JOIN high_salary_skills ON high_demand_skills.skill_id = high_salary_skills.skill_id
WHERE
    high_demand_skills.skills_demand > 3
ORDER BY
    high_salary_skills.avg_salary_yearly DESC
LIMIT
10;