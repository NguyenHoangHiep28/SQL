CREATE DATABASE Lab10

USE AdventureWorks2019
SELECT * INTO Lab10.dbo.WorkOrder FROM Production.WorkOrder
USE Lab10
SELECT * INTO WorkOrderIX FROM WorkOrder

SELECT * FROM WorkOrder
SELECT * FROM WorkOrderIX

CREATE INDEX IX_WorkOrderID ON WorkOrderIX(WorkOrderID)
DROP INDEX IX_WorkOrderID ON WorkOrderIX
SELECT * FROM WorkOrder WHERE WorkOrderID = 72000
SELECT * FROM WorkOrderIX WHERE WorkOrderID = 72000