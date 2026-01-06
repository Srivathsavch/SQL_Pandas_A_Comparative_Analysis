#=============================
# Load the data from csv file
#=============================
import pandas as pd
Customer_Table = pd.read_csv('/content/cust.csv', usecols=['customer_id','customer_name','city','signup_date','customer_type'])
print(Customer_Table)
Orders_Table = pd.read_csv('/content/ords.csv',usecols=['order_id','customer_id','order_date','product','order_amount','payment_mode'])
print(Orders_Table)

#===================
# Filter by columns
#===================
print(Customer_Table[['customer_id','customer_name']]) # using column names
------------------------------------------------------------------------------
print(Customer_Table.iloc[:,:2]) # using iloc
------------------------------------------------------------------------------
print(Customer_Table.loc[:,['customer_id','customer_name']]) # using loc

#=====================
# Filter by condition
#=====================
print(Customer_Table[Customer_Table['customer_type']=='Premium'])
--------------------------------------------------------------------
print(Customer_Table.query('customer_type=="Premium"'))
--------------------------------------------------------------------
c=Customer_Table['customer_type']=='Premium'
print(Customer_Table.where(cond=c))

#============================
# Filter with two conditions
#============================
c1=Customer_Table['customer_type']=='Premium'
c2=Customer_Table['city']=='Delhi'
print(Customer_Table[c1&c2])
------------------------------------------------------------------------
print(Orders_Table[Orders_Table['order_amount'].between(3000,15000)])
------------------------------------------------------------------------
print(Orders_Table[Orders_Table['product'].isin(['Mobile','Headphones'])])

#===================
# Adding new column
#===================
Customer_Table['phone_num']='9999999999'
print(Customer_Table)
---------------------------------------------------
Customer_Table.insert(3,'phone_num',9999999999)
print(Customer_Table)

#===================
# Dropping a column
#===================
del Customer_Table['phone_num']
--------------------------------------------------------
Customer_Table.drop('phone_num',axis=1,inplace=True)
--------------------------------------------------------
Customer_Table.pop('phone_num')

#===================
# Select top 5 rows
#===================
print(Customer_Table.head(n=5))

#============
# Extracting
#============
print(Customer_Table.loc[3,'city'])
---------------------------------------
print(Customer_Table.iloc[3,2])

#========================
# Select which are nulls
#========================
print(Customer_Table[Customer_Table['city'].isnull()]) # isna()

#============================
# Select which are not nulls
#============================
print(Customer_Table[Customer_Table['city'].notnull()]) # notna()

#============
# Drop nulls
#============
print(Customer_Table['city'].dropna())
------------------------------------------------
print(Customer_Table.dropna(axis=0,how='any'))

#============
# Fill nulls
#============
print(Customer_Table.fillna({'customer_name':'no_name','city':'no_city','signup_date':'no_date','customer_type':'no_data'},inplace=False))

#=============
# Sort values
#=============
print(Customer_Table.sort_values(by='signup_date')) # sort by values
-----------------------------------------------------------------------
print(Customer_Table.sort_index(ascending=False)) # sort by index

#=================
# Find duplicates
#=================
print(Customer_Table[Customer_Table.duplicated(keep='first')])

#=================
# Drop Duplicates
#=================
print(Customer_Table.drop_duplicates(keep='first',inplace=False,ignore_index=True))

#======
# Rank
#======
Customer_Table['rank']=Customer_Table['customer_id'].rank().astype(int)
print(Customer_Table.sort_values(by='rank'))

#====================
# Add product amount
#====================
Orders_Table['order_amount']=Orders_Table['order_amount'].apply([lambda a: a+50])
print(Orders_Table)

#============================================
# Combining two tables using with duplicates
#============================================
Extra_cust=Extra_cust.rename(columns={'cust_id':'customer_id','name':'customer_name','place':'city','join_date':'signup_date','customer_type':'customer_type'}) # Data standardization
print(pd.concat(objs=[Customer_Table,Extra_cust],axis=0,join='outer',verify_integrity=False,keys=['cust','extra_cust']))

#===============================================
# Combining two tables using without duplicates
#===============================================
Extra_cust=Extra_cust.rename(columns={'cust_id':'customer_id','name':'customer_name','place':'city','join_date':'signup_date','customer_type':'customer_type'}) # Data standardization
print(pd.concat(objs=[Customer_Table,Extra_cust],axis=0,join='outer',verify_integrity=False,keys=['cust','extra_cust']).drop_duplicates())

#============
# Inner Join
#============
merge_df = pd.merge(left = Customer_Table, right = Orders_Table,left_on=Customer_Table.customer_id,right_on=Orders_Table.customer_id).drop_duplicates()
print(merge_df)

#===========
# Left Join
#===========
merge_df = pd.merge(left=Customer_Table, right=Orders_Table, how='left', left_on=Customer_Table.customer_id, right_on=Orders_Table.customer_id, suffixes=('_cust_T','_ord_T')).drop_duplicates()
print(merge_df)

#================
# Data Wrangling
#================
Customer_Table['customer_name'] = Customer_Table['customer_name'].str.strip().str.replace('_',' ')
Customer_Table = Customer_Table.fillna({'customer_name':'no_name','city':'no_city','signup_date':'no_date','customer_type':'no_type'})
print(Customer_Table)
