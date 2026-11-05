-- VIEW 1: Freelancer Dashboard View
CREATE VIEW FreelancerDashboard AS
SELECT U.full_name, P.title, T.amount, T.status
FROM Users U
JOIN Transactions T ON U.user_id = T.user_id
JOIN Projects P ON T.project_id = P.project_id
WHERE U.role = 'freelancer';

-- VIEW 2: Verified Experience Report
CREATE VIEW VerifiedReport AS
SELECT U.full_name, O.org_name, P.title
FROM VerifiedExperience V
JOIN Users U ON V.user_id = U.user_id
JOIN Projects P ON V.project_id = P.project_id
JOIN Organizations O ON P.org_id = O.org_id
WHERE V.is_verified = TRUE;

-- INDEXES for performance
CREATE INDEX idx_project_status ON Projects(status);
CREATE INDEX idx_user_role ON Users(role);
