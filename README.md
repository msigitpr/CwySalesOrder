STEPS TO INSTALL

1. Install <a href="https://www.python.org/download"/>Phyton</a>
2. Install <a href="https://docs.djangoproject.com/en/1.8/topics/install/#installing-official-release">Django</a>
3. Import coway.sql into mysql database
3. configure database configuration in coway/settings.py
4. from the root folder, run "py manage.py runserver". 
5. then server will run in localhost:8000


DEFAULT DB CONFIGURATION
{
    'NAME': 'coway',
    'USER': 'root',
    'PASSWORD': '',
    'HOST': 'localhost',   
    'PORT': '3306',
}


APPLICATION FLOW

there are 3 user role registered in the app:
- Sales Staff (username: salesstaff, password: admin007)
- Sales Admin (username: salesadmin, password: admin007)
- Technician (username: technician, password: admin007)

1. Sales Staff would register customer information from menu "Master > Customer -> Add"
2. Sales Staff would create new Sales Order based on registered customer from menu "Sales Order -> Add"
3. Sales Staff entry Sales Order Data and apply promotion code if there is any. list of available promotion code can be check in Master -> Promotion Code
3. Sales Admin would review all the Sales Order in the same menu then check the detail of each sales order (Sales Order -> click detail icon of sales order)
4. Sales admin would confirm the data to customer. then assign the technician and installation date from the Sales Order Detail page.
5. after technician finish installing the unit, technician will record the unit serial number from the Sales Order Detail page
