-- Q1: Show all freelancers
SELECT * FROM Users WHERE role = 'freelancer';

-- Q2: Show open projects with organization name (JOIN Example)
SELECT P.title, O.org_name, P.budget 
FROM Projects P
JOIN Organizations O ON P.org_id = O.org_id
WHERE P.status = 'open';

-- Q3: Show freelancer skills (3-Table JOIN Example)
SELECT U.full_name, S.skill_name
FROM Users U
JOIN UserSkills US ON U.user_id = US.user_id
JOIN Skills S ON US.skill_id = S.skill_id;

-- Q4: Count applications per user (GROUP BY Example)
SELECT user_id, COUNT(*) as total_applications
FROM Applications
GROUP BY user_id;

-- Q5: UNIQUE constraint proof - This will throw error if same user applies twice to same project
-- INSERT INTO Applications (project_id, user_id) VALUES (1, 1);

-- Q6: Find project with highest budget (ORDER BY Example)
SELECT title, budget FROM Projects ORDER BY budget DESC LIMIT 1;

-- Q7: CHECK constraint proof - Rating must be between 1 and 5
-- INSERT INTO Reviews (project_id, reviewer_id, rating) VALUES (1, 1, 10);

-- Q8: Verified Experience certificates (Final output of ProofWork)
SELECT U.full_name, P.title as project, V.certificate_url
FROM VerifiedExperience V
JOIN Users U ON V.user_id = U.user_id
JOIN Projects P ON V.project_id = P.project_id;

-- Q9: Total earnings per freelancer (SUM + GROUP BY)
SELECT user_id, SUM(amount) as total_earned FROM Transactions GROUP BY user_id;

-- Q10: Submission versioning history
SELECT project_id, user_id, version_no FROM Submissions ORDER BY version_no DESC;
