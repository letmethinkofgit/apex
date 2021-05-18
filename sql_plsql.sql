--AuthID usage in procedure and function
    AUTHID clause instructs Oracle as to whether the routine is to be run with the invoker's rights (CURRENT_USER), or with the Owner rights (DEFINER). 
    If the clause is not specified, Oracle will default to using the AUTHID DEFINER.
    
