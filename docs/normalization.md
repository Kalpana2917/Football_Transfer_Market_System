# Normalization - ProofWork Database

## 1NF - First Normal Form
All tables have atomic values. No repeating groups.
Example: Users table has single value for email, full_name.

## 2NF - Second Normal Form
- Already in 1NF
- All non-key attributes fully dependent on Primary Key.
- Example: In Projects, budget depends only on project_id, not partially.

## 3NF - Third Normal Form
- Already in 2NF
- No transitive dependency.
- Example: Separated Skills and UserSkills tables to avoid transitive dependency of skill_name on user_id.

## BCNF
All determinants are candidate keys. Our design satisfies BCNF.

## Constraints Used (Professional)
- PRIMARY KEY: On all tables
- FOREIGN KEY: Users -> Organizations -> Projects chain
- UNIQUE: UNIQUE(project_id, user_id) in Applications table
- CHECK: rating BETWEEN 1 AND 5 in Reviews table
