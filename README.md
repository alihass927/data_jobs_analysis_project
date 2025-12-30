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
5. **⚖️ The "Sweet Spot":** Which skills offer the best balance of high demand AND high pay? 

(Spoiler: Its not Python or SQL even though these have high demand but not the highest pay.)

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
---
## 🛠️ Tools I Used
For this project, I combined industry-standard database management with modern developer workflows:

* **SQL:** The backbone of my analysis, allowing me to query the dataset and extract critical insights.
* **PostgreSQL:** My chosen Database Management System (DBMS) for handling the large-scale job posting data.
* **Visual Studio Code:** My primary code editor. I used the **PostgreSQL extension** to execute queries directly within my IDE for a faster workflow.
* **Git & GitHub:** Essential for version control and sharing my SQL scripts.
* **Gemini:** Used for creating the data visualizations from my SQL CSV exports.

---
