-- Query to build a question list with an ID for each question and a sort order for each section

SELECT DISTINCT
    DENSE_RANK() OVER (ORDER BY section, question) AS QuestionID,  -- Unique identifier for each question
    section AS Section,  -- Which part of the questionnaire the question belongs to
    CASE section  -- Keeps the sections in the same order as the report
        WHEN 'Respondent profile' THEN 1
        WHEN 'Forms and patterns of family roles' THEN 2
        WHEN 'Family functions' THEN 3
        WHEN 'Effects on mental health, peers and lifestyle' THEN 4
        WHEN 'Future family formation' THEN 5
    END AS SectionOrder,
    LTRIM(RTRIM(question)) AS Question  -- Removes stray spaces
FROM
    dbo.frequency_tables;  -- Frequency tables from the final report, imported from Data/frequency_tables.csv
