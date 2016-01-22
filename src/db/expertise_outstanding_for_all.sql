SELECT
  e.slack,
  ARRAY_AGG(exp.name) AS outstanding
FROM employee e, expertise exp
WHERE e.date_end IS null
AND (
  SELECT count(*)
  FROM employee_expertise ee
  WHERE ee.employee_id=e.id AND ee.expertise_id=exp.id
) = 0
GROUP BY e.slack
