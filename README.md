# Bookmark Manager

**Bookmark Manager** is a web application that allows users to store and manage URLs they want to revisit. 

This program was built using **TDD** as part of [**Makers Academy Coding Bootcamp's**]([http://makers.tech](http://makers.tech/)) RPS Challenge.

## User stories

```
As a website user
So I can see the bookmarks I have stored
I want to see a list of bookmarks
```

## Domain Model

| Class    | Method |
| -------- | ------ |
| Bookmark | list   |

![Bookmark Manager domain model](https://github.com/makersacademy/course/blob/master/bookmark_manager/images/bookmark_manager_1.png)

## Connect to database

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager;`
4. Run the query in file: `db/migrations/01_create_bookmarks_table.sql`

