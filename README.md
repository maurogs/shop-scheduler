# Shop Scheduler

## Description

`shop-scheduler` allows you to store shops and corresponding schedules. 

### Requirements

**Ruby version:** 2.7.2

**Database:** Postgresql

## How to run

#### **Install dependencies**

```
bundle install
```

#### **Create database**

```
rake db:create
```

#### **Run migrations**

```
rake db:migrate
```

#### **Load shops data**

```
rake db:seed
```

#### **Run the tests**

```
rspec
```

#### **Added Gems**

`rspec-rails`, `rails-i18n`

## Improvements

- Add create/edit views.
- Allow users to search by availability.
- Add indexes to improve queries performance.


