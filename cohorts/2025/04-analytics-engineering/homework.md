## Module 4 Homework  (DRAFT)

In this homework, we'll use the models developed during the week 4 videos and enhance the already presented dbt project using the already loaded Taxi data for fhv vehicles for year 2019 in our DWH.

This means that in this homework we use the following data [Datasets list](https://github.com/DataTalksClub/nyc-tlc-data/)
* Yellow taxi data - Years 2019 and 2020
* Green taxi data - Years 2019 and 2020 
* fhv data - Year 2019. 

We will use the data loaded for:

* Building a source table: `stg_fhv_tripdata`
* Building a fact table: `fact_fhv_trips`
* Create a dashboard 

If you don't have access to GCP, you can do this locally using the ingested data from your Postgres database
instead. If you have access to GCP, you don't need to do it for local Postgres - only if you want to.

> **Note**: if your answer doesn't match exactly, select the closest option 

### Question 1: 

**What happens when we execute dbt build --vars '{'is_test_run':'true'}'**
You'll need to have completed the ["Build the first dbt models"](https://www.youtube.com/watch?v=UVI30Vxzd6c) video. 

- It applies a _limit 100_ only to our staging models


### Question 2: 

**What is the code that our CI job will run? Where is this code coming from?**  

- The code from the development branch we are requesting to merge to main


### Question 3 (2 points)

**What is the count of records in the model fact_fhv_trips after running all dependencies with the test run variable disabled (:false)?**  
Create a staging model for the fhv data, similar to the ones made for yellow and green data. Add an additional filter for keeping only records with pickup time in year 2019.
Do not add a deduplication step. Run this models without limits (is_test_run: false).

Create a core model similar to fact trips, but selecting from stg_fhv_tripdata and joining with dim_zones.
Similar to what we've done in fact_trips, keep only records with known pickup and dropoff locations entries for pickup and dropoff locations. 
Run the dbt model without limits (is_test_run: false).

- 22998722

<img width="827" alt="image" src="https://github.com/user-attachments/assets/fccb3af4-f0fb-46e4-82f4-bb753bec803f" />

<img width="857" alt="image" src="https://github.com/user-attachments/assets/51cafffc-c888-4f41-a2e2-238888b2b8b3" />

<img width="765" alt="image" src="https://github.com/user-attachments/assets/aea06012-86dc-4dc5-8e09-a3d3fae4c028" />

### Question 4 (2 points)

**What is the service that had the most rides during the month of July 2019 month with the biggest amount of rides after building a tile for the fact_fhv_trips table and the fact_trips tile as seen in the videos?**

Create a dashboard with some tiles that you find interesting to explore the data. One tile should show the amount of trips per month, as done in the videos for fact_trips, including the fact_fhv_trips data.

- Yellow

![image](https://github.com/user-attachments/assets/e41da9bd-33e3-446c-a1ed-980eae5165c1)

![image](https://github.com/user-attachments/assets/f462cfe1-343e-4d55-ad42-e818538781c5)

![image](https://github.com/user-attachments/assets/5d9d82c3-01f3-498f-89c3-c07683f0ed74)



## Submitting the solutions

* Form for submitting: https://courses.datatalks.club/de-zoomcamp-2024/homework/hw4

Deadline: 22 February (Thursday), 22:00 CET


## Solution

To be published after deadline
