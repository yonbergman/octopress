---
layout: post
title: "Upgrading Postgres.app from 9.2 to 9.3"
date: 2013-11-04 14:53
comments: true
categories: tips postgres database
---

{% img right http://postgresapp.com/images/netsuke.png 200 %}

I love [Postgres.app](http://postgresapp.com/) it really is the quickest and easiest way to get a postgres database running on your mac.  
But I just had some bad time upgrading from Postgres.app 9.2 to 9.3.  
So I wrote this short step by step guide to help you upgrade your database without losing all the data you already have there.

* **Step 1** - Make sure your PG binaries are linked correctly into your PATH and that you'll be using the correct `psql` and `pg_upgrade` commands by checking that the following line appears in your `.profile`, `.bashrc`, `.zshrc` (which ever you use)  

```
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
```
* **Step 2** - Open a new terminal window and run `which psql` it should point to `/Applications/Postgres.app/Contents/MacOS/bin/psql` - If it doesn't check Step 0 again.
* **Step 3** - Download the new [Postgres.app](http://postgresapp.com/)
* **Step 4** - Close the Postgres.app if it's currently running
* **Step 5** - Move your old 9.2 Postgres.app from /Applications to your desktop
* **Step 6** - Move the newly downloaded Postgres.app to /Applications and launch it
* **Step 7** - Run `psql` and connect to the db
* **Step 8** - In the psql run `\l` to get a list of tables. You should have 4 tables: postgres, 2 template tables and one table for your username.
* **Step 9** - Run `\c postgres` to move to the postgres table from your user's table
* **Step 10** - Run `DROP DATABASE username;` (replace username with your **username**) to remove your user's table.
* **Step 11** - Run `\q` to close psql
* **Step 12** - Close Postgres.app
* **Step 13** - In the terminal run the following command making sure that all the locations are correct

```
pg_upgrade --old-datadir ~/Library/Application\ Support/Postgres/var \
--new-datadir ~/Library/Containers/com.heroku.postgres/Data/Library/Application\ Support/Postgres/var  \
--old-bindir ~/Desktop/Postgres.app/Contents/MacOS/bin \
--new-bindir /Applications/Postgres.app/Contents/MacOS/bin
```
* **Step 14** - Let the upgrade command run, once it's finished successfully it will print out `Upgrade Complete`
* **Step 15** - Start Up Postgres.app again
* **Step 16** - Run `./analyze_new_cluster.sh` to get your DB ready for business

---
_(Optional Last Step)_ - Run `./delete_old_cluster.sh` to remove the old 9.2 data and delete the old Postgres.app from your desktop.

### I'm still having problems - what to do?
This is what I did whenever I had issues during the upgrade process and needed a hard-reset.

* _Step -1_ - Close the Postgres.app
* _Step -2_ - Delete the `~/Library/Containers/com.heroku.postgres/Data/Library/Application Support/Postgres/var` directory 
* _Step -3_ - Reopen the Postgres.app let it rebuild the directory and start again from **Step 7** in the guide.

### Pro Tip #3 - Postgres Client for Mac

I've been looking a long time for a Postgres client for Mac that will be even a fraction of what [Sequel Pro](http://www.sequelpro.com/) is for MySQL.   

Well, I just found out about a pretty new client that shows a lot of potential and is really good (at least for my uses)  
[PG Commander](https://eggerapps.at/pgcommander/) you should definitely check it out.

### Sources
* [Postgresapp Documentation](http://postgresapp.com/documentation)
* [NathenY's post on upgrading 9.1-9.2](http://nathany.com/upgrading-postgres/)
* [Stefl's comment on GitHub](https://github.com/PostgresApp/PostgresApp/issues/86#issuecomment-24309379)

----

Hope this helps a few people.  
You can always find me on twitter [@yonbergman](http://twitter.com/yonbergman).


