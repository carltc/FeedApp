USE [FeedMeDataBase]
GO

/****** Object: Table [dbo].[LiveMeals] Script Date: 30/01/2018 16:34:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[LiveMeals];


GO
CREATE TABLE [dbo].[LiveMeals] (
    [MealID]            INT            IDENTITY(1,1) PRIMARY KEY,
    [MealName]          TEXT           NOT NULL,
    [ChefID]            NVARCHAR (128) NOT NULL,
    [ChefName]          TEXT           NOT NULL,
    [MealPrice]         MONEY          NULL DEFAULT 0,
    [MealLocation]      TEXT           NULL DEFAULT 'n/a',
    [MealTime]          DATETIME       NULL ,
    [dietary_Meat]      BIT            NOT NULL DEFAULT 0,
    [dietary_Shellfish] BIT            NOT NULL DEFAULT 0,
    [dietary_Fish]      BIT            NOT NULL DEFAULT 0,
    [dietary_Gluten]    BIT            NOT NULL DEFAULT 0,
    [dietary_Nut]       BIT            NOT NULL DEFAULT 0,
    [dietary_Dairy]     BIT            NOT NULL DEFAULT 0,
    [dietary_Egg]       BIT            NOT NULL DEFAULT 0,
    [MealSpaces]        INT            NOT NULL DEFAULT 1
);


