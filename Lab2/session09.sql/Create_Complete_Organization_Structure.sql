CREATE PROCEDURE InsertDesignationDetails(@OrgId AS INT, @DesignationId AS INT, @Designation VARCHAR(50)) AS
BEGIN
DECLARE @OrgHID AS hierarchyid
DECLARE @LastOrgID AS hierarchyid
DECLARE @DesignationHID AS hierarchyid
SELECT @OrgHID = DesignationHID FROM DesignationDetails WHERE
DesignationId = @OrgId
SELECT @LastOrgID = Max(DesignationHID) FROM DesignationDetails
WHERE DesignationHID.GetAncestor(1) = @OrgHID
INSERT INTO DesignationDetails VALUES
(@OrgHID.GetDescendant(@LastOrgID, Null), @DesignationId, @Designation)
RETURN @@RowCount
END
GO
EXEC InsertDesignationDetails 1,2,'General Manager'
EXEC InsertDesignationDetails 2,3,'Sales Manager'
EXEC InsertDesignationDetails 3,6,'Regional Head'
EXEC InsertDesignationDetails 6,8,'Section Head'
EXEC InsertDesignationDetails 8,9,'Salesman'
EXEC InsertDesignationDetails 2,4,'Production Manager'
EXEC InsertDesignationDetails 4,7,'Supervisor'
EXEC InsertDesignationDetails 2,5,'Finance Manager'
SELECT * FROM DesignationDetails
SELECT DesignationHID.ToString() AS Hierarchy, * FROM DesignationDetails
GO