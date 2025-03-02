# Module 5 Homework

In this homework we'll put what we learned about Spark in practice.

For this homework we will be using the Yellow 2024-10 data from the official website: 

```bash
wget https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-10.parquet
```


## Question 1: Install Spark and PySpark

- Install Spark
- Run PySpark
- Create a local spark session
- Execute spark.version.

What's the output?

The PySpark 3.5.5 version is running...

> [!NOTE]
> To install PySpark follow this [guide](https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/05-batch/setup/pyspark.md)


## Question 2: Yellow October 2024

Read the October 2024 Yellow into a Spark Dataframe.

Repartition the Dataframe to 4 partitions and save it to parquet.

What is the average size of the Parquet (ending with .parquet extension) Files that were created (in MB)? Select the answer which most closely matches.


- 25MB

<img width="710" alt="image" src="https://github.com/user-attachments/assets/10d454da-699c-4f8e-aeb5-9d846955e311" />



## Question 3: Count records 

How many taxi trips were there on the 15th of October?

Consider only trips that started on the 15th of October.

- 128909

<img width="1105" alt="image" src="https://github.com/user-attachments/assets/f69f3954-5b1e-47bf-82e8-5cdf43b9b4e2" />



## Question 4: Longest trip

What is the length of the longest trip in the dataset in hours?

- 162

  <img width="1051" alt="image" src="https://github.com/user-attachments/assets/ea942071-bd47-4b42-a71d-991f1524a6fb" />

## Question 5: User Interface

Spark’s User Interface which shows the application's dashboard runs on which local port?

- 4040


## Question 6: Least frequent pickup location zone

Load the zone lookup data into a temp view in Spark:

```bash
wget https://d37ci6vzurychx.cloudfront.net/misc/taxi_zone_lookup.csv
```

Using the zone lookup data and the Yellow October 2024 data, what is the name of the LEAST frequent pickup location Zone?

- Governor's Island/Ellis Island/Liberty Island

<img width="1041" alt="image" src="https://github.com/user-attachments/assets/67d294fa-8026-46ba-be1b-3dcc8f06da3d" />


## Submitting the solutions

- Form for submitting: https://courses.datatalks.club/de-zoomcamp-2025/homework/hw5
- Deadline: See the website
