
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/02/2022 00:49:24
-- Generated from EDMX file: C:\Users\Aslihan\OneDrive\Masaüstü\projects\EtütOtomasyonu\EtutOtomasyonu(KayaEğitimKurumları)_ModelFirst\EtutOtomasyonu(KayaEğitimKurumları)_ModelFirst\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Model1];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_KullanicilarEtutSalonu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EtutSalonuSet] DROP CONSTRAINT [FK_KullanicilarEtutSalonu];
GO
IF OBJECT_ID(N'[dbo].[FK_EtutSalonuSayisalEtutSalonu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SayisalEtutSalonuSet] DROP CONSTRAINT [FK_EtutSalonuSayisalEtutSalonu];
GO
IF OBJECT_ID(N'[dbo].[FK_EtutSalonuSozelEtutSalonu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SozelEtutSalonuSet] DROP CONSTRAINT [FK_EtutSalonuSozelEtutSalonu];
GO
IF OBJECT_ID(N'[dbo].[FK_EtutSalonuBilisimEtutSalonu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BilisimEtutSalonuSet] DROP CONSTRAINT [FK_EtutSalonuBilisimEtutSalonu];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[KullanicilarSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KullanicilarSet];
GO
IF OBJECT_ID(N'[dbo].[EtutSalonuSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EtutSalonuSet];
GO
IF OBJECT_ID(N'[dbo].[SayisalEtutSalonuSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SayisalEtutSalonuSet];
GO
IF OBJECT_ID(N'[dbo].[SozelEtutSalonuSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SozelEtutSalonuSet];
GO
IF OBJECT_ID(N'[dbo].[BilisimEtutSalonuSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BilisimEtutSalonuSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'KullanicilarSet'
CREATE TABLE [dbo].[KullanicilarSet] (
    [KullaniciNo] int IDENTITY(1,1) NOT NULL,
    [KullaniciAdi] nvarchar(max)  NOT NULL,
    [Sifre] nvarchar(max)  NOT NULL,
    [Mail] nvarchar(max)  NOT NULL,
    [Telefon] nvarchar(max)  NOT NULL,
    [Adres] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EtutSalonuSet'
CREATE TABLE [dbo].[EtutSalonuSet] (
    [SalonNo] int IDENTITY(1,1) NOT NULL,
    [SalonAdi] nvarchar(max)  NOT NULL,
    [KullaniciNo] nvarchar(max)  NOT NULL,
    [KullanicilarKullaniciNo] int  NOT NULL
);
GO

-- Creating table 'SayisalEtutSalonuSet'
CREATE TABLE [dbo].[SayisalEtutSalonuSet] (
    [SaySalonNo] int IDENTITY(1,1) NOT NULL,
    [Tarih] int  NOT NULL,
    [Saat] int  NOT NULL,
    [SalonNo] int  NOT NULL,
    [EtutSalonuSalonNo] int  NOT NULL
);
GO

-- Creating table 'SozelEtutSalonuSet'
CREATE TABLE [dbo].[SozelEtutSalonuSet] (
    [SozSalonNo] int IDENTITY(1,1) NOT NULL,
    [Tarih] int  NOT NULL,
    [Saat] int  NOT NULL,
    [SalonNo] nvarchar(max)  NOT NULL,
    [EtutSalonuSalonNo] int  NOT NULL
);
GO

-- Creating table 'BilisimEtutSalonuSet'
CREATE TABLE [dbo].[BilisimEtutSalonuSet] (
    [BilSalonNo] int IDENTITY(1,1) NOT NULL,
    [Tarih] int  NOT NULL,
    [Saat] int  NOT NULL,
    [SalonNo] nvarchar(max)  NOT NULL,
    [EtutSalonuSalonNo] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [KullaniciNo] in table 'KullanicilarSet'
ALTER TABLE [dbo].[KullanicilarSet]
ADD CONSTRAINT [PK_KullanicilarSet]
    PRIMARY KEY CLUSTERED ([KullaniciNo] ASC);
GO

-- Creating primary key on [SalonNo] in table 'EtutSalonuSet'
ALTER TABLE [dbo].[EtutSalonuSet]
ADD CONSTRAINT [PK_EtutSalonuSet]
    PRIMARY KEY CLUSTERED ([SalonNo] ASC);
GO

-- Creating primary key on [SaySalonNo] in table 'SayisalEtutSalonuSet'
ALTER TABLE [dbo].[SayisalEtutSalonuSet]
ADD CONSTRAINT [PK_SayisalEtutSalonuSet]
    PRIMARY KEY CLUSTERED ([SaySalonNo] ASC);
GO

-- Creating primary key on [SozSalonNo] in table 'SozelEtutSalonuSet'
ALTER TABLE [dbo].[SozelEtutSalonuSet]
ADD CONSTRAINT [PK_SozelEtutSalonuSet]
    PRIMARY KEY CLUSTERED ([SozSalonNo] ASC);
GO

-- Creating primary key on [BilSalonNo] in table 'BilisimEtutSalonuSet'
ALTER TABLE [dbo].[BilisimEtutSalonuSet]
ADD CONSTRAINT [PK_BilisimEtutSalonuSet]
    PRIMARY KEY CLUSTERED ([BilSalonNo] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [KullanicilarKullaniciNo] in table 'EtutSalonuSet'
ALTER TABLE [dbo].[EtutSalonuSet]
ADD CONSTRAINT [FK_KullanicilarEtutSalonu]
    FOREIGN KEY ([KullanicilarKullaniciNo])
    REFERENCES [dbo].[KullanicilarSet]
        ([KullaniciNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KullanicilarEtutSalonu'
CREATE INDEX [IX_FK_KullanicilarEtutSalonu]
ON [dbo].[EtutSalonuSet]
    ([KullanicilarKullaniciNo]);
GO

-- Creating foreign key on [EtutSalonuSalonNo] in table 'SayisalEtutSalonuSet'
ALTER TABLE [dbo].[SayisalEtutSalonuSet]
ADD CONSTRAINT [FK_EtutSalonuSayisalEtutSalonu]
    FOREIGN KEY ([EtutSalonuSalonNo])
    REFERENCES [dbo].[EtutSalonuSet]
        ([SalonNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EtutSalonuSayisalEtutSalonu'
CREATE INDEX [IX_FK_EtutSalonuSayisalEtutSalonu]
ON [dbo].[SayisalEtutSalonuSet]
    ([EtutSalonuSalonNo]);
GO

-- Creating foreign key on [EtutSalonuSalonNo] in table 'SozelEtutSalonuSet'
ALTER TABLE [dbo].[SozelEtutSalonuSet]
ADD CONSTRAINT [FK_EtutSalonuSozelEtutSalonu]
    FOREIGN KEY ([EtutSalonuSalonNo])
    REFERENCES [dbo].[EtutSalonuSet]
        ([SalonNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EtutSalonuSozelEtutSalonu'
CREATE INDEX [IX_FK_EtutSalonuSozelEtutSalonu]
ON [dbo].[SozelEtutSalonuSet]
    ([EtutSalonuSalonNo]);
GO

-- Creating foreign key on [EtutSalonuSalonNo] in table 'BilisimEtutSalonuSet'
ALTER TABLE [dbo].[BilisimEtutSalonuSet]
ADD CONSTRAINT [FK_EtutSalonuBilisimEtutSalonu]
    FOREIGN KEY ([EtutSalonuSalonNo])
    REFERENCES [dbo].[EtutSalonuSet]
        ([SalonNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EtutSalonuBilisimEtutSalonu'
CREATE INDEX [IX_FK_EtutSalonuBilisimEtutSalonu]
ON [dbo].[BilisimEtutSalonuSet]
    ([EtutSalonuSalonNo]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------