# ✈️ India Flight Delay Analytics & Prediction System

An end-to-end Business Analytics and Machine Learning project designed to analyze historical flight delays, identify operational risk factors, and predict flight delay risk.

The project combines **Business Analysis, Python, SQL, Power BI, Tableau, and Machine Learning** to demonstrate how operational data can be transformed into actionable business insights.

---

## 📌 Project Overview

Flight delays can affect aircraft utilization, turnaround operations, passenger experience, and overall operational efficiency.

This project addresses the problem through a complete analytics workflow:

**Business Problem → Requirements → Data Analysis → SQL → Dashboards → Machine Learning → Business Recommendations**

The system provides both historical analysis and predictive risk classification to support operational decision-making.

> **Dataset Note:** The dataset used in this project is synthetic/model-generated. The results should therefore be treated as a demonstration of analytical methodology rather than real-world Indian aviation statistics.

---

## 🎯 Business Objectives

- Analyze historical flight-delay patterns
- Identify operational factors associated with delays
- Monitor key flight-delay KPIs
- Compare delay performance across airlines and airports
- Analyze route-level delay patterns
- Understand relationships between congestion, turnaround risk, weather, and delays
- Predict flight delay risk before the outcome is known
- Classify flights into Low, Medium, and High risk
- Provide actionable recommendations for operational decision-making

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Python / Pandas | Data cleaning, feature engineering, and exploratory analysis |
| PostgreSQL | Data storage and SQL-based analysis |
| Power BI | Executive operational dashboard |
| Tableau | Analytical dashboard and visualization |
| Scikit-learn | Machine learning and risk prediction |
| Jupyter / Google Colab | Analysis and model development |
| GitHub | Project version control and portfolio presentation |

---

## 📊 Dataset

The final analytical dataset contains:

- **150,000 flight records**
- **29 variables**
- No missing values
- No duplicate records

### Key fields

- Flight Date
- Airline
- Flight Number
- Origin Airport
- Destination Airport
- Scheduled Departure Time
- Weather Conditions
- Temperature
- Humidity
- Wind Speed
- Visibility
- Rainfall
- Cloud Cover
- Origin Congestion Index
- Previous Flight Delay
- Turnaround Risk Index
- Departure Delay
- Delay Target

---

## 📈 Key Dataset-Level KPIs

| KPI | Value |
|---|---:|
| Total Flights | 150,000 |
| Delayed Flights | 129,925 |
| On-Time Flights | 20,075 |
| Delay Rate | 86.62% |
| Average Departure Delay | 42.66 min |

These values describe the synthetic project dataset and are not representative of actual Indian aviation performance.

---

# 🔍 Data Analysis

The initial Python analysis included:

- Data quality assessment
- Missing-value analysis
- Duplicate detection
- Target distribution analysis
- Categorical analysis
- Numerical analysis
- Delay pattern analysis
- Feature engineering
- Route construction
- Congestion bands
- Turnaround-risk bands
- Previous-delay bands
- Departure-time bands

### Important Data Quality Finding

`Departure_Delay` is highly related to the target outcome and represents information associated with the actual delay event.

Therefore, it was retained for **historical analysis and dashboards**, but excluded from machine learning predictors to prevent **target leakage**.

---

# 🧠 Machine Learning

The machine learning component predicts whether a flight is likely to experience a delay.

### Target

`Delay_Target`

- `0` → On-Time
- `1` → Delayed

### Features excluded from prediction

- `Departure_Delay` — target leakage
- `Flight_Date` — excluded from the modeling feature set
- `Flight_Number` — excluded from the modeling feature set

### Train/Test Split

- Training set: **120,000 records**
- Test set: **30,000 records**
- Stratified 80/20 split

---

## 🤖 Models Evaluated

### Logistic Regression

| Metric | Score |
|---|---:|
| Accuracy | 93.83% |
| Precision | 94.82% |
| Recall | 98.24% |
| F1 Score | 96.50% |
| ROC-AUC | 85.52% |

### Random Forest

| Metric | Score |
|---|---:|
| Accuracy | 90.21% |
| Precision | 95.87% |
| Recall | 92.68% |
| F1 Score | 94.25% |
| ROC-AUC | 85.31% |

### Selected Model

**Logistic Regression**

It was selected based on the overall evaluation, particularly its stronger **recall, F1 score, and ROC-AUC** compared with the Random Forest model.

---

# 🚦 Operational Risk Classification

The model's predicted probability is converted into operational risk levels:

| Delay Probability | Risk Level |
|---:|---|
| < 40% | 🟢 Low Risk |
| 40% – <70% | 🟡 Medium Risk |
| ≥ 70% | 🔴 High Risk |

### Test Set Risk Distribution

| Risk Level | Flights | Observed Delay Rate |
|---|---:|---:|
| Low Risk | 2,479 | 8.27% |
| Medium Risk | 1,612 | 61.72% |
| High Risk | 25,909 | 95.66% |

This allows operations teams to prioritize attention toward flights with higher predicted risk.

---

# 🔑 Key Predictive Insights

Permutation importance identified the following as important predictive factors:

1. **Origin Congestion Index**
2. **Congestion Band**
3. **Previous Flight Delay**
4. **Turnaround Risk Band**

Weather-related variables showed comparatively smaller predictive importance in the current model.

> These relationships represent associations within the dataset and should not be interpreted as proof of causation.

---

# 📊 Dashboards

## Power BI — Executive Operational Dashboard

The Power BI dashboard focuses on management-level monitoring and includes:

- Total Flights
- Delayed Flights
- On-Time Flights
- Delay Rate
- Average Delay
- Monthly Delayed Flights
- Delay Rate by Airline
- Airport Delay Rate
- Congestion vs Delay Rate
- Turnaround Risk vs Delay Rate
- Weather vs Delay Rate
- High-Volume Route Analysis
- Interactive filters

---

## Tableau — Analytical Dashboard

The Tableau dashboard provides deeper analytical exploration through:

- Delay Rate by Airline
- Congestion Level vs Delay Rate
- Turnaround Risk vs Delay Rate
- Monthly Delay Rate Trend
- Airport Delay Rate
- Delay Rate by Weather
- High-Volume Route Analysis
- Interactive filters for Airline, Airport, Weather, Congestion, and Turnaround Risk

---

# 💼 Business Analysis

The project also includes a formal **Business Requirements Document (BRD)**.

The BA component covers:

- Business problem
- Project objectives
- Stakeholder analysis
- Business requirements
- Functional requirements
- Non-functional requirements
- KPIs
- User stories
- Acceptance criteria
- Business rules
- Process flow
- Risks and limitations
- Business recommendations

This connects the technical implementation to a realistic business decision-making workflow.

---

# 💡 Business Recommendations

### 1. Prioritize High-Congestion Operations

Operations teams should pay particular attention to flights originating from airports experiencing elevated congestion.

### 2. Monitor Turnaround Risk

Flights with elevated turnaround risk should receive additional operational monitoring.

### 3. Consider Previous Flight Delays

Previous delays can indicate potential downstream operational disruption.

### 4. Use Risk-Based Prioritization

Operational resources can be prioritized toward flights classified as high risk rather than treating every flight equally.

### 5. Combine Analytics With Human Judgment

Machine learning predictions should support operational decisions rather than automatically determine them.

---

# ⚠️ Limitations

- The dataset is synthetic/model-generated.
- Results may not generalize to real-world airline operations.
- The overall delay rate is a characteristic of the dataset.
- Some categories contain very small sample sizes.
- Predictive relationships do not establish causation.
- Real-world deployment would require live operational data.
- A production model would require continuous monitoring and validation.

---

# 📁 Project Structure

india-flight-delay-analytics/
│
├── dashboards/
│   ├── powerbi/
│   │   ├── India_Flight_Delay_Analytics.pbix
│   │   └── README.md
│   │
│   └── tableau/
│       ├── India_Flight_Delay_Analytics.twbx
│       └── .gitkeep
│
├── docs/
│   └── Business_Requirements_Document.md
│
├── India_Flight_Delay_Data_Analysis.ipynb
├── India_Flight_Delay_ML_Analysis.ipynb
├── flight_delay_analysis.sql
└── README.md

# 🚀 End-to-End Workflow

Business Problem
       ↓
Business Requirements
       ↓
Data Collection
       ↓
Data Cleaning & Validation
       ↓
Feature Engineering
       ↓
Exploratory Data Analysis
       ↓
PostgreSQL + SQL Analysis
       ↓
Power BI Executive Dashboard
       ↓
Tableau Analytical Dashboard
       ↓
Machine Learning
       ↓
Delay Risk Classification
       ↓
Business Recommendations

👨‍💼 Skills Demonstrated

Business Analysis
Requirements gathering
Stakeholder analysis
KPI definition
User stories
Acceptance criteria
Business rules
Process analysis
Decision-support design
Data Analytics
Python
Pandas
SQL
PostgreSQL
Exploratory Data Analysis
Feature Engineering
Business Intelligence
Power BI
Tableau
Interactive dashboards
KPI reporting
Data visualization
Machine Learning
Classification
Logistic Regression
Random Forest
Model evaluation
ROC-AUC
Feature importance
Risk classification

📌 Conclusion

This project demonstrates an end-to-end approach to solving a business problem using analytics and machine learning.

Rather than focusing only on model accuracy, the project connects:

Business Requirements → Data → Analysis → Visualization → Prediction → Business Action

The goal is to demonstrate how a Business Analyst with strong data and technical skills can translate operational data into meaningful decision support.
