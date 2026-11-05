# ProofWork - Verified Micro-Project & Experience Ledger (RDBMS Project)
MCA 1st Sem - RDBMS Mini Project

##  Project Overview
ProofWork is a transactional RDBMS model that solves the problem of fake experience on platforms like LinkedIn. 
Unlike self-declared skills, Verified Experience is created ONLY after project completion, approved review, and successful transaction via RDBMS Transaction.

**Tagline:** Upwork + GitHub + LinkedIn + Internshala = ProofWork

##  Problem Statement
- LinkedIn allows self-declared skills (fake profiles)
- Freelance platforms give ratings but not verified certificates
- No single platform provides Project + Version History + Verified Certificate in one transactional model

##  Solution - Our RDBMS Model
`Submission -> Review (Approved) -> Transaction (Success) -> VerifiedExperience (Auto-Generated)`
Implemented using MySQL Transactions and UNIQUE Constraints to prevent duplicates.

##  Database Schema - 11 Tables
1. **Users** - Freelancers, Clients, Admin
2. **Organizations** - Company / Client org
3. **Projects** - Micro-projects posted by org
4. **Skills** - Master skill list
5. **UserSkills** - Many-to-Many mapping
6. **Applications** - UNIQUE(project_id, user_id) to prevent duplicate apply
7. **Milestones** - Project breakdown
8. **Submissions** - With version_no for revision history
9. **Reviews** - Rating 1-5, Approved/Rejected
10. **Transactions** - Payment ledger
11. **VerifiedExperience** - UNIQUE(project_id) - One project = One certificate

All tables are in 3NF.

##  ER Diagram
![ER Diagram](ER_Diagram.png)

##  Key Features / Constraints
- `UNIQUE(project_id, user_id)` in Applications
- `CHECK (rating BETWEEN 1 AND 5)` in Reviews
- `version_no` in Submissions for history tracking
- Transactional insertion for VerifiedExperience

##  SQL Files
- `01_create_tables.sql` - All 11 tables with PK, FK, Constraints
- `02_insert_data.sql` - Sample data (20 Users, 12 Projects, etc.)
- `03_queries.sql` - 15 Queries (Basic + Intermediate + Advanced with CTE, RANK, Window Functions)

##  Advanced Queries Used
```sql
-- Monthly Earning Trend using CTE
WITH monthly_earnings AS (...)

-- Top Freelancer Ranking using RANK()
SELECT RANK() OVER (ORDER BY SUM(amount) DESC) ...

-- Anomaly Detection using AVG + STDDEV
