# Family Roles and Student Mental Health Analysis (University of Lagos)

Nigerian families are changing. More mothers now work outside the home, more students grow up with one parent, and roles at home are shared differently from before. This project looks at whether these changes are linked to undergraduates' mental health, the peer pressure they face and their lifestyle choices. The study surveyed 410 students at UNILAG and I did the analysis.

Key Points:
* Family structure is changing: a big share of students do not grow up in a nuclear family.
* Roles at home are shifting: mothers working, decisions being shared.
* Wellbeing: most students feel these changes affect them.

Tools I used: SPSS, SQL Server, Python (pandas), Excel, Power BI

Data: 410 undergraduates from 100 to 500 level, collected in 2026. The figures here come from the frequency tables in the final report.

## Objectives
1. Describe how family roles are changing
2. See how family functions have changed
3. Test whether these changes are linked to mental health, peer pressure and lifestyle

## Dashboard
![Family Roles Dashboard](Dashboard/dashboard.png)

## What I found
* 39% of the students do not come from a nuclear family, and 21% come from single-parent homes.
* The change students notice most is mothers working outside the home (42%).
* 66% said these changes affect their mental wellbeing.
* The Spearman correlations show family change is linked to mental health (ρ = .36), peer pressure (ρ = .33) and lifestyle (ρ = .25), all p < .001. The links are real but moderate to weak, so family change is one factor among many.
* 61% want to share responsibilities equally with a future partner, and 59% said education made their views more equal.

## Recommendations
* Counselling services that take students' family situations into account
* Peer support groups, since family change is linked to peer pressure
* Orientation sessions on handling independence and new responsibilities

## Repo structure
```
Data/
  frequency_tables.csv     every frequency table from the report in one table
Scripts/
  dim_questions.sql
  fact_frequencies.sql
Frequency Analysis/
  percentages.py
  frequency_tables_with_percentages.csv
Dashboard/
  dashboard.png / dashboard.html
  Excel workbook (dashboard, a chart for every table, data, tests)
```

## How to run it
1. In SQL Server create a database called UnilagFamilySurveyDB and import `Data/frequency_tables.csv` as `dbo.frequency_tables` (Tasks > Import Flat File).
2. Run `Scripts/dim_questions.sql` and `Scripts/fact_frequencies.sql`.
3. Load the query results into Power BI (Get data > SQL Server) to build the dashboard.
4. Run `Frequency Analysis/percentages.py`. It reads from SQL Server, or from the CSV if SQL Server is not set up.


Researcher and analyst: Daniel Oluwaseun David. No names or personal details are included.
