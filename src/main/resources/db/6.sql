USE projectmanagementdb;

SELECT
  projects.*,
  avg(developers.salary) average_salary
FROM developers, projects
WHERE developers.project_id = projects.id AND projects.id IN (
  SELECT id
  FROM projects
  WHERE cost IN (
    SELECT min(projects.cost)
    FROM projects)
);