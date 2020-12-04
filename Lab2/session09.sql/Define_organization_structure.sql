CREATE TABLE DesignationDetails
(
	[DesignationHID] [hierarchyid] PRIMARY KEY,
	[DesignationId] [int] NULL, [Designation] [varchar](50) NULL
)
GO
INSERT INTO DesignationDetails(DesignationHID, DesignationId,
Designation)
VALUES(hierarchyid::GetRoot(), 1, 'President')
GO
SELECT * FROM DesignationDetails
GO