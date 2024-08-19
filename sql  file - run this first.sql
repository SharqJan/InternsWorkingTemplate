
--            DROP DATABASE TestDB

CREATE DATABASE ThemeCRUD
GO

USE [ThemeCRUD]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15-07-2024 10:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Email] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Address] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 15-07-2024 10:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[AddEmployee]   
    @Name NVARCHAR(100),  
    @Description NVARCHAR(MAX),  
    @Email NVARCHAR(100),  
    @PhoneNumber NVARCHAR(20),  
    @Address NVARCHAR(200)  
AS  
BEGIN  
    SET NOCOUNT ON;  
  
    INSERT INTO Employee (Name, Description, Email, PhoneNumber, Address)  
    VALUES (@Name, @Description, @Email, @PhoneNumber, @Address);  
  
    -- Optionally, you can return the EmployeeId of the newly inserted record  
    RETURN SCOPE_IDENTITY();  
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteAllEmployees]    Script Date: 15-07-2024 10:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployeeById]    Script Date: 15-07-2024 10:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[DeleteEmployeeById]  
    @EmployeeId INT  
AS  
BEGIN  
    SET NOCOUNT ON;  
  
    -- Check if the employee exists  
    IF EXISTS (SELECT 1 FROM Employee WHERE EmployeeId = @EmployeeId)  
    BEGIN  
        -- Employee exists, delete the record  
        DELETE FROM Employee  
        WHERE EmployeeId = @EmployeeId;  
  
        -- Optionally, return success message or affected rows count  
        Return @EmployeeId
    END  
    ELSE  
    BEGIN  
        -- Employee does not exist, handle error or return appropriate message  
        -- Example: THROW 51000, 'Employee with this EmployeeId does not exist', 1;  
        -- For simplicity, returning 0 here  
       Return 0; 
    END  
END;  
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeById]    Script Date: 15-07-2024 10:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployeeById]
    @EmployeeId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT EmployeeId, Name, Description, Email, PhoneNumber, Address
    FROM Employee
    WHERE EmployeeId = @EmployeeId;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeList]    Script Date: 15-07-2024 10:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetEmployeeList]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT EmployeeId, Name, Description, Email, PhoneNumber, Address
    FROM Employee;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 15-07-2024 10:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateEmployee]
    @EmployeeId INT,
    @Name NVARCHAR(100),
    @Description NVARCHAR(MAX),
    @Email NVARCHAR(100),
    @PhoneNumber NVARCHAR(20),
    @Address NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the employee exists
    IF EXISTS (SELECT 1 FROM Employee WHERE EmployeeId = @EmployeeId)
    BEGIN
        -- Employee exists, update the record
        UPDATE Employee
        SET Name = @Name,
            Description = @Description,
            Email = @Email,
            PhoneNumber = @PhoneNumber,
            Address = @Address
        WHERE EmployeeId = @EmployeeId;
		Return 1;
    END
END;
GO


