-- Arquivo com Queries para Monitoramento

-- Query para stressar BD do Jonas por 4-30 segundos.
--DO $$
--DECLARE
--    table_record RECORD;
--    variavel TEXT;
--   
--BEGIN
--    -- Iterar sobre todas as tabelas na base de dados
--    FOR i in 1..10000000
--    loop
--	    select * into variavel from tb_prova;
--    END LOOP;
--END $$;

-- Criação da extensão pg_stat_statements para monitorar

create extension pg_stat_statements; 
select pg_stat_statements_reset();


-- Monitoramento sem TIMESTAMP

SELECT 
	userid, query, pg_user.usename, total_exec_time, calls,
	rows AS rows_processed
FROM 
    pg_stat_statements
JOIN 
    pg_user ON pg_stat_statements.userid = pg_user.usesysid and pg_user.usename <> 'postgres'
JOIN 
    pg_database ON pg_stat_statements.dbid = pg_database.oid;
   
-- Query antiga

--SELECT pg_stat_statements.userid, pg_roles.rolname, pg_stat_statements.query, pg_stat_activity.query_start
--FROM pg_stat_statements
--JOIN pg_roles ON pg_stat_statements.userid = pg_roles.oid
--join pg_catalog.pg_stat_activity on pg_stat_statements.userid  = pg_stat_activity.usesysid
--WHERE pg_stat_statements.query NOT LIKE '%pg_catalog%'
--  AND pg_stat_statements.query NOT LIKE '%pg_attribute%'
--  AND pg_stat_statements.query NOT LIKE '%pg_class%'
--  AND pg_stat_statements.query NOT LIKE '%pg_namespace%'
--  AND pg_stat_statements.query NOT LIKE '%SHOW%'
--  AND pg_stat_statements.query NOT LIKE '%version()%'
--  AND pg_stat_statements.query NOT LIKE '%pg%'
--  AND pg_stat_statements.query NOT LIKE '%current%'
--  and pg_stat_statements.query not like '%pg_stat%'
--  and pg_stat_statements.query not like 'SET %'
--  and pg_stat_statements.toplevel <> false
--  and pg_stat_activity.query_start is not null
-- order by pg_stat_activity.query_start desc;
 
-- Monitoramento com TIMESTAMP
   
SELECT pg_stat_statements.userid, pg_roles.rolname, pg_stat_statements.query, pg_stat_activity.query_start
FROM pg_stat_statements
JOIN pg_roles ON pg_stat_statements.userid = pg_roles.oid
LEFT JOIN pg_catalog.pg_stat_activity ON pg_stat_statements.userid = pg_stat_activity.usesysid
WHERE pg_stat_statements.query NOT LIKE '%pg_catalog%'
  AND pg_stat_statements.query NOT LIKE '%pg_attribute%'
  AND pg_stat_statements.query NOT LIKE '%pg_class%'
  AND pg_stat_statements.query NOT LIKE '%pg_namespace%'
  AND pg_stat_statements.query NOT LIKE '%SHOW%'
  AND pg_stat_statements.query NOT LIKE '%version()%'
  AND pg_stat_statements.query NOT LIKE '%pg%'
  AND pg_stat_statements.query NOT LIKE '%current%'
  AND pg_stat_statements.query NOT LIKE '%pg_stat%'
  AND pg_stat_statements.query NOT LIKE 'SET %'
  and pg_roles.rolname <> 'postgres'
  AND pg_stat_statements.toplevel <> false
ORDER BY pg_stat_activity.query_start DESC;