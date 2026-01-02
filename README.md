# Data Professional Salary & Skills Analysis

## 🚀 Introduction
Welcome to my first major data analysis project! As someone starting into the **Data Analytics** field, I wanted to move beyond theory and get my hands dirty with real-world data. 

I built this project to answer the burning questions I had as a beginner: *What can I actually expect to earn?* and *What skills should I focus on first to be employable?* By applying my SQL knowledge to this dataset, I’ve uncovered the current landscape for entry-level **Data Analysts** and **Business Analysts**. 

My goal is for this project to serve as a roadmap for myself and other aspiring analysts navigating the start of their careers.

Have a look at my 

---

## 🎯 The Research Questions
In this analysis, I tried to answer 6 key questions:

1. **💰 Entry-Level Pay:** What is the average starting salary for Data vs. Business Analysts?
2. **🏆 Top 10 Checklist:** What are the most frequent skills appearing in job descriptions?
3. **📈 Employer Demand:** Which skills are currently being requested most by hiring managers?
4. **💎 High-Value Skills:** Which specific technical skills command the highest paychecks?
5. **⚖️ The "Sweet Spot":** Which skills offer the best balance of high demand AND high pay? (Spoiler: Its not Python or SQL even though these have high demand but not the highest pay.) 
6. **🤝 The Common Ground:** What "overlap" skills are shared between both Data and Business Analyst roles?

---
## 📖 Background
The data for this project was sourced from **Luke Barousse's SQL for Data Analytics course**. It provides a massive dataset of over **786,000+ job postings** from December 2022 to December 2023.

* **Scope:** While the original dataset is global, I specifically filtered the data to focus on **United States job postings** to ensure localized accuracy for my career research.
* **Data Quality:** The dataset was highly structured and reliable. However, I performed data cleaning to handle 
* **null values** in the salary columns and job location fields to ensure my final averages were not skewed.

## 📂 Project Structure
- 📁 **[sql_project/](sql_project)**: Contains the 6 individual SQL files for each analysis question. 
(Just changed the 'Data Analyst' to 'Business Analyst' in WHERE statement to get results for job titles.)
- 📁 **[csv_data/](csv_data)**: The resulting data exports used for visualization.
- 📁 **[visuals/](visuals)**: Screenshots and charts generated from the data.
- 📄 **[README.md](README.md)**: Project documentation.

---
## 🛠️ Tools I Used
For this project, I combined industry-standard database management with modern developer workflows:

* **SQL:** The backbone of my analysis, allowing me to query the dataset and extract critical insights.
* **PostgreSQL:** My chosen Database Management System (DBMS) for handling the large-scale job posting data.
* **Visual Studio Code:** My primary code editor. I used the **PostgreSQL extension** to execute queries directly within my IDE for a faster workflow.
* **Git & GitHub:** Essential for version control and sharing my SQL scripts.
* **Excel / Gemini:** Used for creating the data visualizations from my SQL CSV exports.

---
## 🔍 The Analysis
In this section, I dive deep into the data to uncover the realities of the job market for Data and Business Analysts. By querying over 780,000 job postings, I’ve broken down the results into six distinct areas of focus. 

For each question below, you will find:
* **Visual Analysis:** Clear charts and tables to help you visualize the trends.
* **Key Insights:** A "Bottom Line" summary of what the data actually means for a job seeker.
* **The SQL Query:** The exact code used to pull the data, so you can reproduce these results yourself.



### 💰 1. Entry-Level Salary Trends
To identify the starting point for these careers, I filtered the dataset for job postings in the United States and focused on the roles specifically mentioning "Data Analyst" and "Business Analyst."

![Entry_jobs_D.An](visuals\data_an_assets\1_D.An.png)
*Figure 1: Entry-Level Data Analyst Salary Distribution (Source: 1_entry_jobs D.An.csv)*

![Entry_jobs_B.An](visuals\business_an_assets\1_B.An.png)
*Figure 2: Entry-Level Business Analyst Salary Distribution (Source: 1_entry_jobs B.An.csv)*

**The Insight**
- **Entry-Level Gap:** Based on the data, entry-level Business Analysts earn significantly more on average ($55,780) compared to Data Analysts ($37,650) in this specific dataset.

**The SQL Code**
```sql
SELECT	
	job_postings_fact.job_title_short,
    company_dim.name AS company_name,
	job_postings_fact.salary_year_avg,
	job_postings_fact.job_country
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' --change to 'Business Analyst' for BA results
    AND job_postings_fact.job_country = 'United States' 
    AND job_postings_fact.salary_year_avg IS NOT NULL
ORDER BY
    job_postings_fact.salary_year_avg
LIMIT 50;
```
*By modifying the WHERE statement, reults can be extracted for both roles.*

---
### 🛠️ 2. Top 10 Required Skills
I identified the technical skills most frequently requested in job descriptions to determine the core toolkit for each role. This highlights the foundational skills entry-level candidates should focus on mastering.
![Entry_skills_D.An](visuals\data_an_assets\2_D.An_modify.png)
*Figure 3: Top 10 Required Skills for Entry-Level Data Analysts (Source: 2_entry_skills_D.An.csv)*

![Entry_skills_B.An](visuals\business_an_assets\2_B.An_modify.png)
*Figure 4: Top 10 Required Skills for Entry-Level Business Analysts (Source: 2_entry_skills_B.An.csv)*

**The Insight**
- **The Foundation:** At the entry-level, Excel and SQL are the most critical skills, appearing in nearly every posting. Excel is particularly dominant for Data Analysts starting out.

- **General Tools:** Unlike high-paying roles that require niche libraries, these positions often list standard office software like Word and PowerPoint as requirements.

- **Consistency:** Tableau and Python remain important even at the lowest salary tiers, showing they are essential skills regardless of pay grade.

**The SQL Code**
```sql
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
    job_postings_fact.job_title_short = 'Business Analyst' --Change to 'Data Analyst' for DA results
    AND job_postings_fact.job_country = 'United States' 
    AND job_postings_fact.salary_year_avg IS NOT NULL
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
```
*By modifying the WHERE statement, reults can be extracted for both roles.*

---
### 📈 3. Most Demanded Skills
I analyzed the total volume of job postings to identify the skills most frequently requested by employers. This reveals which tools provide the broadest range of career opportunities in the current market.

![Demanded_skills_D.An](visuals\data_an_assets\3_D.An.png)
*Figure 5: Most Demanded Skills for Data Analysts (Source: 3_demanded_skills D.An.csv)*
![Demanded_skills_B.An](visuals\business_an_assets\3_B.An.png)
*Figure 6: Most Demanded Skills for Business Analysts (Source: 3_demanded_skills B.An.csv)*

**The Insight**
- **The "Big Three":** For both roles, SQL, Excel, and Tableau form the core of the demand. If you master these three, you become eligible for the vast majority of job openings.
- **Modern Stack:** Python and Power BI are strong contenders for the #4 and #5 spots, showing that modern data stacks are becoming standard requirements for entry-level professionals.

**The SQL Code**
