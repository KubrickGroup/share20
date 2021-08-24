SELECT t.employeeid,
    t.firstname,
    t.lastname,
    t.emailid,
    to_date(t.dateofjoining, 'dd/mm/yyyy'::text) AS dateofjoining,
    to_date(t.dateofexit, 'dd/mm/yyyy'::text) AS dateofexit,
    t.employeestatus,
    t.department,
    t.traininggroup,
    t.empid,
    to_date(t.endoftraining, 'dd/mm/yyyy'::text) AS endoftraining,
    to_date(t.firstplacement, 'dd/mm/yyyy'::text) AS firstplacement
   FROM (SELECT zp_employee.index AS employeeid
    ,"FirstName" AS firstname
    ,"LastName" AS lastname
    ,"EmailID" AS emailid
    ,"Dateofjoining"  AS dateofjoining
    ,"Dateofexit"  AS dateofexit
    ,"Employeestatus" AS employeestatus
    ,"Department" AS department
    ,"Training Group" AS traininggroup
    ,"EmployeeID" AS empid
	,"End of Training New" AS endoftraining
	,"First Deployment Date" AS firstplacement
   FROM zprc_raw.zp_employee) t(employeeid, firstname, lastname, emailid, dateofjoining, dateofexit, employeestatus, department, traininggroup, empid, endoftraining, firstplacement)
