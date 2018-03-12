# bookmark-manager

## User Stories

```
As a user
So that I can access different websites
I want to see a list of links

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager
```

## Domain Model
|Objects | Messages |
|--------|----------|
|user||
|links|list_links|

```
User <--- list_links ---> array of Links
```

|Objects | Messages |
|--------|----------|
|User||
|BookmarkManager|add_site_address|
||add_site_title|

```
BookmarkManager ---> add_site_address
                ---> add_site_title
```
