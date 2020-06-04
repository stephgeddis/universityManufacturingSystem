SELECT Equipment.`EquipmentID`, Equipment.`Make`,Equipment.`Model`,Equipment.`Description` FROM `Equipment` Left JOIN `EquipmentLoan` ON Equipment.EquipmentID = EquipmentLoan.EquipmentID 
WHERE Equipment.`Damaged` = 0 AND (Equipment.`Description` LIKE '%video%' 
OR Equipment.`Type` LIKE '%video%') AND (EquipmentLoan.Current = 0 OR 
EquipmentLoan.Current IS NULL);



SELECT Employee.EmployeeID, Employee.FirstName,Employee.LastName FROM `Employee`
Left JOIN `Contract` ON Employee.EmployeeID = Contract.EmployeeID WHERE
Contract.DueFinish BETWEEN '2019/01/01' AND '2019/12/31' AND Contract.ActualFinish IS NULL and Employee.Left IS NULL;


SELECT p.Title, e.Expenses
  FROM Project as p
  	LEFT JOIN (SELECT ProjectID, SUM(Amount) AS Expenses
          FROM Expense
         GROUP BY ProjectID
       ) AS e ON p.ProjectID = e.ProjectID;


SELECT Employee.FirstName,Employee.LastName,Employee.Email,Grade.Title FROM `Employee`
Left JOIN `Grade` ON Grade.GradeID = Employee.EmployeeID 
JOIN `EmployeeSkill` ON EmployeeSkill.EmployeeID = Employee.EmployeeID 
Left Join `Skill`on Skill.SkillID = EmployeeSkill.SkillID 
where Skill.Title LIKE '%video%'
GROUP BY Employee.EmployeeID;



SELECT DISTINCT p.Title, a.Number_of_Employees from `Employee`, Project as p LEFT JOIN (SELECT ProjectID, Count(EmployeeID) AS Number_of_Employees FROM Assignment GROUP BY ProjectID ) AS a ON p.ProjectID = a.ProjectID WHERE a.Number_of_Employees > 2 AND p.Internal = 0 AND Employee.Current =0;

SELECT Employee.EmployeeID, Employee.FirstName,Employee.LastName FROM Employee WHERE EmployeeID NOT IN(SELECT EmployeeID FROM Assignment);

SELECT s.Title,e.Number_of_Skilled_Employees FROM Skill as s LEFT JOIN (SELECT SkillID, Count(EmployeeID) AS Number_of_Skilled_Employees FROM EmployeeSkill GROUP BY SkillID ) AS e ON s.SkillID = e.SkillID
where e.Number_of_Skilled_Employees > 0;

SELECT e.EmployeeID,loan.Equipment_Loan FROM Employee as e JOIN (SELECT EmployeeID, 
SUM(CASE WHEN EquipmentLoan.`current` = '1' THEN 1 ELSE 0 END) as Equipment_Loan FROM EquipmentLoan GROUP BY EmployeeID) AS loan ON e.EmployeeID = loan.EmployeeID where loan.Equipment_Loan >0;

SELECT e.EmployeeID,loan.All_Time_Loans FROM Employee as e
JOIN (SELECT EmployeeID, Count(EmployeeID) AS All_Time_Loans FROM EquipmentLoan GROUP BY EmployeeID) 
AS loan ON e.EmployeeID = loan.EmployeeID;


SELECT Payslip.EmployeeID, Payslip.PayslipID FROM `Payslip`
LEFT Join `Contract`on Contract.EmployeeID = Payslip.EmployeeID 
WHERE (Contract.Start not between '2017/01/01' and '2017/12/31') or (Payslip.EmployeeID NOT IN(SELECT EmployeeID FROM `Contract`)  AND Payslip.Payday between '2017/01/01' and '2017/12/31');
