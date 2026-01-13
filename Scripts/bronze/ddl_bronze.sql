DDL Scripts: Create Bronze Tables
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
    
    Create table Bronze.crm_cust_info (
cst_id int,
cst_key nvarchar (60),
cst_firstname nvarchar (60),
cst_lastname nvarchar (60),
cst_material_status nvarchar (50),
cst_gender nvarchar (50),
cst_create_Date Date
);
Go

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info (
    prd_id       INT,
    prd_key      NVARCHAR(50),
    prd_nm       NVARCHAR(50),
    prd_cost     INT,
    prd_line     NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);
Go

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);
Go


IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101 (
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);
Go

IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);

Go

IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50)
);

Go

Create or alter  procedure bronze.load_bronze as
  
begin
   
    Truncate table bronze.crm_cust_info
    Bulk insert bronze.crm_cust_info
    From 'C:\Users\vadhiraj\OneDrive\Desktop\CRM\cust_info.csv'
    with (
    firstrow = 2,
    fieldterminator = ',',
    tablock
    );

    Select *
    From bronze.crm_cust_info

    Select
    COUNT(*)
    From bronze.crm_cust_info

    Truncate table bronze.crm_prd_info
    Bulk insert bronze.crm_prd_info
    From 'C:\Users\vadhiraj\OneDrive\Desktop\CRM\prd_info.csv'
    with (
    firstrow = 2,
    fieldterminator = ',',
    tablock
    );

    Select
    COUNT(*)
    From bronze.crm_prd_info

    Truncate table bronze.crm_sales_details
    Bulk insert bronze.crm_sales_details
    From 'C:\Users\vadhiraj\OneDrive\Desktop\CRM\sales_details.csv'
    with (
    firstrow = 2,
    fieldterminator = ',',
    tablock
    );

    Select
    COUNT(*)
    From bronze.crm_sales_details

    Truncate table bronze.erp_loc_a101
    Bulk insert bronze.erp_loc_a101
    From 'C:\Users\vadhiraj\OneDrive\Desktop\PRD\LOC_A101.csv'
    with (
    firstrow = 2,
    fieldterminator = ',',
    tablock
    );

    Select
    COUNT(*)
    From bronze.erp_loc_a101

    Truncate table bronze.erp_px_cat_g1v2
    Bulk insert bronze.erp_px_cat_g1v2
    From 'C:\Users\vadhiraj\OneDrive\Desktop\PRD\PX_CAT_G1V2.csv'
    with (
    firstrow = 2,
    fieldterminator = ',',
    tablock
    );

    Select
    COUNT(*)
    From bronze.erp_px_cat_g1v2

    Truncate table bronze.erp_cust_az12
    Bulk insert bronze.erp_cust_az12
    From 'C:\Users\vadhiraj\OneDrive\Desktop\PRD\CUST_AZ12.csv'
    with (
    firstrow = 2,
    fieldterminator = ',',
    tablock
    );

    Select
    *
    From bronze.erp_cust_az12;

    Select COUNT(*)
    From bronze.crm_cust_info
    
End
