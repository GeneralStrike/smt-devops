smt-devops
==========


Devops for the Shoreline Monitoring Toolbox (SMT).

Follow these steps to set up an instance of the SMT on a Webfaction server.


Step 1: Install your SSH key on the server
------------------------------------------

See Webfaction's instructions:
https://docs.webfaction.com/user-guide/access.html?highlight=ssh#using-ssh-keys


Step 2: Add environment variables file
--------------------------------------
Make a copy of ``temp/environment_variables.yml.example`` named
``temp/environment_variables.yml``.

In the new file, replace all the values of ``****replace_this****`` with long
pseudo-random values.

DO NOT commit the new file to this repository.


Step 3: Create the database
---------------------------

Log in to the Webfaction control panel at https://my.webfaction.com/

Create a new PostgreSQL database and its owner at
https://my.webfaction.com/new-database

Use the values from the ``environment_variables.yml`` file you created in the
last step for the database name and owner details.


Step 4: Create the application scaffolding
------------------------------------------

Create a new Webfaction application here:
https://my.webfaction.com/new-application

Use these details::

    Name: smt
    App category: Custom
    App type: Custom app (listening on port)

Click on the app you've just created on this page:
https://my.webfaction.com/applications

Note the value of "Port" for the new application.

Make a copy of ``temp/webfaction_config.yml.example`` named
``temp/webfaction_config.yml``.

In the new file, set the value of ``app_port`` to the application's Port value.

DO NOT commit the new file to this repository.


Step 5: Connect the app to a domain and website
-----------------------------------------------

Connect the app to a website, then connect the website to a domain.

See Webfaction's website instructions:
https://docs.webfaction.com/user-guide/websites.html#creating-a-website

See Webfaction's domain instructions:
https://docs.webfaction.com/user-guide/domains.html#domains


Step 6: Check the hosts file
----------------------------

The ``hosts`` file assumes that we are deploying to the
``web518.webfaction.com`` server.

Check under the "Web Server" heading here: https://my.webfaction.com/

If this is no longer the correct server, edit the ``hosts`` file with the
correct server.


Step 7: Ensure you have a copy of the SMT app repository
--------------------------------------------------------

Make sure you have a copy of the SMT app repo in the same directory as this
repo.

If you don't, issue these commands::

    $ cd ..
    $ git clone git@github.com:sureL/shoreline-monitoring-toolbox.git
    $ cd smt-devops


Step 8: Run Ansible playbook
----------------------------

::

    $ ansible-playbook -i hosts provision.yml
