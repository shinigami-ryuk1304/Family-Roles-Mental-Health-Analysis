-- Percentages for every question
SELECT section, question, response, frequency,
       ROUND(100.0 * frequency / SUM(frequency) OVER (PARTITION BY question), 1) AS pct
FROM frequency_tables
ORDER BY section, question, frequency DESC;

-- KPI cards
SELECT
    SUM(CASE WHEN question = 'Distribution of Respondents by Family Type' THEN frequency ELSE 0 END) AS students,
    ROUND(100.0 * SUM(CASE WHEN question = 'Perceived Effects of Changing Family Roles' AND response IN ('Mainly affects mental wellbeing', 'Affects both mental wellbeing and lifestyle') THEN frequency ELSE 0 END)
       / SUM(CASE WHEN question = 'Perceived Effects of Changing Family Roles' THEN frequency ELSE 0 END), 1) AS pct_mental_wellbeing_affected,
    ROUND(100.0 * SUM(CASE WHEN question = 'Preferred Family Responsibility Arrangement' AND response = 'Equal sharing between partners' THEN frequency ELSE 0 END)
       / SUM(CASE WHEN question = 'Preferred Family Responsibility Arrangement' THEN frequency ELSE 0 END), 1) AS pct_want_equal_sharing,
    ROUND(100.0 * SUM(CASE WHEN question = 'Effect of Education on Views of Family Roles' AND response = 'Education exposed me to more egalitarian views' THEN frequency ELSE 0 END)
       / SUM(CASE WHEN question = 'Effect of Education on Views of Family Roles' THEN frequency ELSE 0 END), 1) AS pct_education_more_equal,
    ROUND(100.0 * SUM(CASE WHEN question = 'Distribution of Respondents by Family Type' AND response = 'Nuclear family' THEN frequency ELSE 0 END)
       / SUM(CASE WHEN question = 'Distribution of Respondents by Family Type' THEN frequency ELSE 0 END), 1) AS pct_nuclear_family
FROM frequency_tables;

-- family type
SELECT response AS family_type, frequency, ROUND(100.0 * frequency / SUM(frequency) OVER (), 1) AS pct
FROM frequency_tables WHERE question = 'Distribution of Respondents by Family Type' ORDER BY frequency DESC;

-- hypothesis results (Spearman correlation run in SPSS on composite scores)
-- family change x mental health: rho = 0.358, p < .001
-- family change x peer pressure: rho = 0.334, p < .001
-- family change x lifestyle:     rho = 0.254, p < .001
