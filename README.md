# HR Analytics Dashboard - SQL and Power BI
![image](https://github.com/user-attachments/assets/93f9c09b-e71a-413a-955f-49f78acc94cd)

## 📌 Project Overview
The **HR Analytics Dashboard** is built using **Power BI** to provide comprehensive insights into employee distribution, retention, termination, and workforce trends. This project leverages structured **SQL queries** for data processing and visualization to help HR professionals make data-driven decisions.

---
## 🎯 Objectives
- **Measure employee retention and termination rates** to assess workforce stability.
- **Analyze workforce diversity** based on gender distribution.
- **Evaluate turnover trends** across departments and locations.
- **Assess employee tenure** to identify workforce sustainability.
- **Identify hiring and employment trends** over time.

---
## 📂 Data Sources
- **HR Employee Records Dataset** containing demographic details, hire and termination dates, and job-related information.
- **SQL Queries** were used to extract key HR metrics before visualization in Power BI.

---
## 📊 Key Performance Indicators (KPIs)
1. **Retention Rate (%)** - Percentage of employees retained.
2. **Termination Rate (%)** - Percentage of employees leaving the company.
3. **Average Tenure (Years)** - Measures the average duration employees stay.
4. **Turnover Rate by Department** - Highlights termination trends across different departments.
5. **Employees by State** - Geographic distribution of employees.
6. **% Change in Employee Numbers (2000-2020)** - Tracks historical hiring trends.

---
## 🛠 Data Analysis Methodology
### **SQL Queries & Data Cleaning:**
```sql
-- Calculate retention and termination rates
SELECT 
    (COUNT(CASE WHEN termination_date IS NULL THEN employee_id END) * 100.0) / COUNT(employee_id) AS Retention_Rate,
    (COUNT(CASE WHEN termination_date IS NOT NULL THEN employee_id END) * 100.0) / COUNT(employee_id) AS Termination_Rate
FROM employees;

-- Clean missing and invalid termination dates
UPDATE employees
SET termination_date = NULL
WHERE termination_date = '0000-00-00';

-- Categorize age groups
SELECT 
    employee_id,
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+' 
    END AS Age_Group
FROM employees;

-- Segmentation of employees into Retained and Terminated groups
SELECT 
    employee_id, 
    CASE 
        WHEN termination_date IS NULL THEN 'Retained' 
        ELSE 'Terminated' 
    END AS Employee_Status
FROM employees;
```

### **Power BI Visualizations:**
- **Donut Chart** - Gender distribution.
- **Map** - Employee distribution by state.
- **Bar Chart** - Turnover rates across departments.
- **Line Chart** - Historical employee growth trends.
- **KPI Cards** - Retention rate, termination rate, average tenure, and employment length.

---
## 🔍 Insights & Business Impact
- **82% retention rate** indicates workforce stability, with room for improvement.
- **Turnover trends** highlight departments with high termination rates, guiding HR interventions.
- **Tenure analysis** suggests longer employment correlates with higher retention.
- **Geographical distribution** assists in strategic workforce planning.
- **Historical hiring trends** support predictive workforce forecasting.

---
## 📌 Conclusion
This dashboard offers a **data-driven approach** for HR professionals to enhance workforce planning, improve retention strategies, and drive better decision-making.

---
## 🚀 Next Steps
- Conduct **deep-dive analysis** on department-specific attrition trends.
- Add HR metrics such as **promotion rates and performance evaluations**.
- Automate data updates for real-time tracking.
- Implement **predictive analytics** for future workforce planning.

---
## 👨‍💻 Tech Stack & Tools
- **SQL** - Data extraction and transformation.
- **Power BI** - Data visualization and dashboard creation.
- **Data Cleaning** - Ensuring high-quality insights.

**🔹 Created by:** Joan Wambui

---

