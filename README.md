# Running

An easy to setup database environment for learning and testing! :tada:

```bash
./run.sh mysecretpassword ./seed.sql
```

## Tables

**Boards**

| Column            | Type                  | Collation | Nullable | Default                      |
| ----------------- | --------------------- | --------- | -------- | ---------------------------- |
| board_id          | integer               |           | not null | generated always as identity |
| board_name        | character varying(50) |           | not null |                              |
| board_description | text                  |           | not null |                              |

**comment**
| Column | Type | Collation | Nullable | Default |
|-------------|---------------------------|-----------|----------|------------------------------|
| comment_id | integer | | not null | generated always as identity |
| user_id | integer | | | |
| board_id | integer | | | |
| comment | text | | not null | |
| time | timestamp without time zone | | | |

**rich_content**
| Column | Type | Collation | Nullable | Default |
|------------|-------------------------|-----------|----------|------------------------------|
| content_id | integer | | not null | generated always as identity |
| comment_id | integer | | | |
| content | jsonb | | not null | |

**users**
| Column | Type | Collation | Nullable | Default |
|------------|---------------------------|-----------|----------|------------------------------|
| user_id | integer | | not null | generated always as identity |
| username | character varying(25) | | not null | |
| email | character varying(50) | | not null | |
| full_name | character varying(100) | | not null | |
| last_login | timestamp without time zone | | | |
| created_on | timestamp without time zone | | not null | |

Checkout examples.sql for some common queries.

## Requirements

- Docker
