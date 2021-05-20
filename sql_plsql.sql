--AuthID usage in procedure and function
    AUTHID clause instructs Oracle as to whether the routine is to be run with the invoker's rights (CURRENT_USER), or with the Owner rights (DEFINER). 
    If the clause is not specified, Oracle will default to using the AUTHID DEFINER.
    
--Regarding function calls in sql queries : https://oracle-base.com/articles/misc/efficient-function-calls-from-sql
    -- Scalar functions

-- RESULT_CACHE : https://docs.oracle.com/database/121/TGDBA/tune_result_cache.htm#TGDBA631
    When a query executes, the database searches the cache memory to determine whether the result exists in the result cache. If the result exists, 
    then the database retrieves the result from memory instead of executing the query. If the result is not cached, then the database executes the query, 
    returns the result as output, and stores the result in the result cache.
    
    When users execute queries and functions repeatedly, the database retrieves rows from the cache, decreasing response time. 
    Cached results become invalid when data in dependent database objects is modified.

    Below query caches the result of function calls. When the function is called with same parameter again, then the result will be retrieved from Cache.
    CREATE OR REPLACE FUNCTION slow_function (p_in IN NUMBER)
      RETURN NUMBER
      RESULT_CACHE
    AS
    BEGIN
      DBMS_LOCK.sleep(1);
      RETURN p_in;
    END;
    
    -- Usage in query as hint : 
        SELECT /*+ RESULT_CACHE */ department_id, AVG(salary)
          FROM hr.employees
         GROUP BY department_id;
         
         
