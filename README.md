# universityManufacturingSystem
SQL based first year project to create a relation database management system for fictional manufacturing company for given system requirements. Sept 2017 -  Dec 2017


To view this RDMS import the SQL files into your SQL workbench, in the following order:

1. Schema.sql
2. Data.sql

To run queries import individual query statements to your SQL workbench from the query.sql file. 
There are 10 queries in this file in the following order:

1. The EquipmentID, Make, Model, and Description of items of equipment that are (one query matching all the conditions):

      · Not currently marked as damaged

      · Not currently on loan

      · Have the word ‘video’ in their Type or Description

2. The EmployeeID, FirstName, and LastName of all current Employees who have a contract due to finish in 2019

3. A list of Project titles along with a column called Expenses showing the total expenses claimed against that Project (for no expenses NULL is fine as a value)

4. A list of employees showing FirstName, LastName, Email, and Grade (textual title) where they have a skill containing the word ‘video’ (one entry per employee only even if employees have multiple video skills)

5. A list of project titles and number of employees assigned to each project (one query matching all the conditions) where:

· More than 2 employees are assigned

· The employees are current

· The project is not internal

6. A list of employees current or otherwise (EmployeeID, FirstName, LastName) who are not assigned to any projects

7. A list of all skills available (where one or more employee has that skill) in an output of Skill Name, Number of Skilled Employees

8. A list of employee IDs with a second column “Equipment Loans” showing the number of pieces of equipment currently on loan to them (note only employees with loans should be shown not employees with no loans)

9. As 8 but the second column is “All Time Loans” and is the total of all loans (current and historic) for that employee

10. Identifying for a given period payments made to employees who did not have a current contract (period for query is 2017 i.e. 01-01-2017 to 31-12-2017 inclusive) and outputting a list of EmployeeIDs and PayslipIDs for any found – note that for the date range the Due date for a contract to finish is fine to use


Note: Feel free to add custom data and own queries.


Relationships (Cardinality) Description based on set system requirements: 

* An Employee may have zero or more FileItems (arbitrary items stored relating to the employee) and each FileItem must be linked to one Employee.

* An Employee must have a Grade of employment and each Grade of employment may have zero or more Employees.

* An Employee may have zero or more Skills and each Skill may be linked to zero or more Employees through the EmployeeSkill entity i.e. an Employee may have zero or more EmployeeSkills but each EmployeeSkill must be linked to one Employee, a Skill may have zero or more EmployeeSkills and each EmployeeSkill must be linked to one Skill.

* An Employee may have zero or more Assignments but each Assignment must have one Employee.

* A project may have zero or more Assignments but each Assignment must have one linked Project

* An Employee may have zero or more sub-ordinate Employees that they manage and an Employee may have zero or one line managers (another Employee who manages them).

* An Employee may have zero or more Expense claims, each Expense claim must be for one Employee. Expense claims may be linked against one project (or not) and so each Project may have zero or more Expense claims linked to it.

* An Employee may have zero or more Payslips and each Payslip must be linked to one Employee.

* An employee may have zero or more employment Contracts and each Contract must be linked to one Employee.

* An Employee may have zero or more EquipmentLoans and each EquipmentLoan must be linked to one Employee. Each item of Equipment may have zero or more EquipmentLoans recorded against it and each EquipmentLoan is for one piece of Equipment.
