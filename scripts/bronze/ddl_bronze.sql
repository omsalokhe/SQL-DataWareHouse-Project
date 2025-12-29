/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
	BEGIN TRY
		TRUNCATE TABLE bronze.crm_cust_info;

		BULK INSERT bronze.crm_cust_info
		FROM 'F:\Backend\database\sql\microsoftsqlserver\DWH\dataset\source_crm\cust_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.crm_prd_info;

		BULK INSERT bronze.crm_prd_info
		FROM 'F:\Backend\database\sql\microsoftsqlserver\DWH\dataset\source_crm\prd_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.crm_sales_details;

		BULK INSERT bronze.crm_sales_details
		FROM 'F:\Backend\database\sql\microsoftsqlserver\DWH\dataset\source_crm\sales_details.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.erp_CUST_AZ12;

		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'F:\Backend\database\sql\microsoftsqlserver\DWH\dataset\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.erp_LOC_A101;

		BULK INSERT bronze.erp_LOC_A101
		FROM 'F:\Backend\database\sql\microsoftsqlserver\DWH\dataset\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;

		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'F:\Backend\database\sql\microsoftsqlserver\DWH\dataset\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
	END TRY

	BEGIN CATCH
	PRINT '=========================='
	PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
	PRINT 'ERROR MESSAGE '+ERROR_MESSAGE(); 
	PRINT 'ERROR MESSAGE '+CAST(ERROR_NUMBER() AS NVARCHAR);
	PRINT '=========================='
	END CATCH
END
