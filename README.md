---
# Project Overview
project_name: "Personal Fitness Tracking Dashboard"
description: |
  A comprehensive fitness tracking dashboard developed using data collected from Apple Health and Apple Watch. 
  This project involves data cleaning, exploratory data analysis (EDA), and visualization to extract insights on 
  activity levels, heart rate, sleep patterns, and menstrual cycle phases.

# Tools and Technologies
technologies:
  - Data Collection: Apple Health, Apple Watch
  - Data Cleaning: Google Sheets, SQL
  - Analysis: SQL
  - Visualization: Tableau

# Key Features
features:
  - Interactive Tableau dashboard with key performance indicators (KPIs) and trend visualizations.
  - Insights on activity levels, resting heart rate, sleep patterns, and their correlation to menstrual cycle phases.
  - Data segmented into categories (Active, Moderate, Sedentary) and phases (Menstrual, Follicular, Ovulation, Luteal).

# Data Collection and Cleaning
data:
  - source: Apple Health and Apple Watch
  - steps:
      - Exported data from Apple Health and Watch into raw files.
      - Standardized file formats and corrected units during data cleaning.
      - Renamed columns for clarity and addressed missing values.

# Analysis Highlights
analysis:
  - Steps and Distance:
      description: |
        Steps and distance showed a strong positive correlation, with fluctuations influenced by travel, Ramadan, 
        and periods. Monthly variations highlighted specific patterns, such as lower steps in September due to travel.

  - Active Energy and Resting Heart Rate:
      description: |
        Active energy displayed a strong positive correlation (0.93) with exercise time. Resting heart rate dropped 
        significantly after June, likely due to consistent physical activity.

  - Menstrual Cycle Analysis:
      description: |
        Activity metrics and heart rate varied across menstrual cycle phases, with ovulation showing the highest activity 
        and menstrual phase the least. Resting heart rate was higher during ovulation and luteal phases.

  - Sleep Patterns:
      description: |
        Active days showed the least sleep (5.96 hours), while moderately active days had the most (6.85 hours), indicating 
        the need for better sleep consistency.

# Recommendations
recommendations:
  - Gradually increase "Active" and "Moderate" days to improve cardiovascular health.
  - Investigate factors affecting shorter sleep on "Active" and "Sedentary" days.
  - Continue tracking metrics to observe the impact of activity levels on resting heart rate and overall fitness.

# Tableau Dashboard
link: "[View the Interactive Dashboard](https://public.tableau.com/views/Book2_17340213553040/UnderstandingMyFitnessJourneyThroughData?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)"


