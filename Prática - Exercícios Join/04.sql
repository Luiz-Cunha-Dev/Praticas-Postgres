SELECT users.id, users.name, roles.name AS role, companies.name AS company, experiences."startDate" from users JOIN experiences ON users.id = experiences."userId" JOIN roles ON roles.id = experiences."roleId" JOIN companies ON companies.id = experiences."companyId" WHERE users.id = 50 AND experiences."endDate" IS null;