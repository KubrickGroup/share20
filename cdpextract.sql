SELECT t.empid AS employeeid,
    t.firstname,
    t.lastname,
    t.emailid,
    to_date(t.dateofjoining, 'dd/mm/yyyy'::text) AS dateofjoining,
    to_date(t.dateofexit, 'dd/mm/yyyy'::text) AS dateofexit,
    t.employeestatus,
    t.department,
    t.traininggroup,
    to_date(t.addedtime, 'dd/mm/yyyy'::text) AS addedtime,
    t.employeeid AS employeeindex
   FROM (SELECT zp_employee.index AS employeeid
    ,"FirstName" AS firstname
    ,"LastName" AS lastname
    ,"EmailID" AS emailid
    ,"Dateofjoining"  AS dateofjoining
    ,"Dateofexit"  AS dateofexit
    ,"Employeestatus" AS employeestatus
    ,"Department" AS department
    ,"Training Group" AS traininggroup
    ,"AddedTime" AS addedtime
    ,"EmployeeID" AS empid
    ,"End of Training New" AS endoftraining
    ,"First Deployment Date" AS firstplacement
   FROM zprc_raw.zp_employee) t(employeeid, firstname, lastname, emailid, dateofjoining, dateofexit, employeestatus, department, traininggroup, addedtime, empid, endoftraining, firstplacement)
