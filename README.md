## BallotNest

Introducing our cutting-edge Voting System web application, crafted with Django to revolutionize the voting process for organizations and institutions. This advanced e-voting platform mirrors the efficiency of traditional voting systems but with the power of automation and online convenience.

# Key Features:

Seamless Administration: Admins can effortlessly manage and populate the system with positions, candidates, and voter details, ensuring a smooth setup and operation.
Effortless Voting: Voters can cast their votes through a user-friendly online interface, reducing the time and hassle associated with manual voting.
Automatic Vote Tallying: Say goodbye to manual vote counting! Our system automatically calculates and displays results, ensuring accuracy and efficiency.
Dual Interfaces: Experience a streamlined process with distinct interfaces for administrators and voters. Admins handle system management, while voters enjoy a straightforward, intuitive voting experience.
Perfect for schools, organizations, and any institution looking to enhance their voting process, this system simplifies and speeds up elections, providing a modern solution to traditional voting challenges.


## Features:

- [x] Vote preview
- [x] Multiple votes
- [x] Result tally via Horizontal Bar Chart
- [x] Print voting results in PDF
- [x] Changeable order of positions to show in the ballot
- [x] CRUD voters
- [x] CRUD candidates
- [x] CRUD positions
- [x] Plugins
- [x] AdminLTE Template

### A. Admin Users Can
1. See Overall Summary Charts of Votes
2. Reset Votes
4. Manage Voters (CRUD)
5. Manage Candidates (CRUD)
6. Manage Positions (CRUD)
7. Change Ballot Style (Ballot Position)
8. Update/Change Ballot Title

### B. Voters Can
1. Register
2. Login
3. Verify with OTP (This can be overwritten in `settings.py` file)
4. Votes for their favourite candidates
5. View candidates they voted for

## 📸 ScreenShots
<figure>
  <figcaption>Database Design</figcaption>
  <img
  src="ss/DB.png"
  alt="The beautiful MDN logo.">
  
</figure>

| Login| Signup|
|------|-------|
|<img src="https://github.com/Nafeessidd1/BallotNest/blob/master/ss/login.png" width="700">|<img src="https://github.com/Nafeessidd1/BallotNest/blob/master/ss/register.png" width="700">|

# ADMIN
<figure>
  <img
  src="ss/admin/Screenshot 2024-08-10 at 3.32.23 PM.png"
  alt="The beautiful MDN logo.">
</figure>
<figure>
  <img
  src="ss/admin/Screenshot 2024-08-10 at 3.30.04 PM.png"
  alt="The beautiful MDN logo.">
</figure>
<figure>
  <img
  src="ss/admin/Screenshot 2024-08-10 at 3.30.13 PM.png"
  alt="The beautiful MDN logo.">
</figure>

# VOTER
<figure>
  <img
  src="ss/voter/Screenshot 2024-08-10 at 3.31.33 PM.png"
  alt="The beautiful MDN logo.">
</figure>



### Pre-Requisites:
1. Install Git Version Control
[ https://git-scm.com/ ]

2. Install Python Latest Version
[ https://www.python.org/downloads/ ]

3. Install Pip (Package Manager)
[ https://pip.pypa.io/en/stable/installing/ ]

*Alternative to Pip is Homebrew*


### Installation
**1. Create a Folder where you want to save the project**

**2. Create a Virtual Environment and Activate**

Install Virtual Environment First
```
$  pip install virtualenv
```

Create Virtual Environment

For Windows
```
$  python -m venv venv
```
For Mac
```
$  python3 -m venv venv
```
For Linux
```
$  virtualenv .
```

Activate Virtual Environment

For Windows
```
$  source venv/scripts/activate
```

For Mac
```
$  source venv/bin/activate
```

For Linux
```
$  source bin/activate
```

**3. Clone this project**
```
$  git clone https://github.com/jobic10/e-voting-with-django.git
```

Then, Enter the project
```
$  cd e-voting-with-django
```

**4. Install Requirements from 'requirements.txt'**
```python
$  pip3 install -r requirements.txt
```

**5. Run migrations and migrate**
```python manage.py makemigrations```
```python manage.py migrate```

**6. Now Run Server**

Command for PC:
```python
$ python manage.py runserver
```

Command for Mac:
```python
$ python3 manage.py runserver
```

Command for Linux:
```python
$ python3 manage.py runserver
```

**7. Login Credentials**

Create Super User (HOD)
Command for PC:
```
$  python manage.py createsuperuser
```

Command for Mac:
```
$  python3 manage.py createsuperuser
```

Command for Linux:
```
$  python3 manage.py createsuperuser
```



Then Add Email and Password

**or Use Default Credentials**

*For HOD /SuperAdmin*
Email: admin@admin.com
Password: admin





