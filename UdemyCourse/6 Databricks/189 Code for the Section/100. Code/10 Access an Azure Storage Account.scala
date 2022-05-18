// Getting data from Azure Data Lake

// We can now set the configuration and access the key from the key vault

// Here we input our datalake name, our databricks scope name and our secret stored in key vault name

spark.conf.set(
    "fs.azure.account.key.appdatalake7000.dfs.core.windows.net",
    dbutils.secrets.get(scope="data-lake-key",key="datalakekey"))

val df = spark.read.format("csv").option("header","true").load("abfss://databricks@appdatalake7000.dfs.core.windows.net/Log.csv")

display(df)