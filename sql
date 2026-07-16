use healthcare_project;
SELECT * FROM healthcare_project.healthcare_data_processed;
-- now for basic functions-
-- 1. number of patients-
select count(distinct patient_id) as tot_patients_number from healthcare_data_processed;

-- 2. averge treatment cost -
select avg(treatment_cost) as Avg_Treatment_cost from healthcare_data_processed;

-- 3. most commnon disease -
select count(*) as most_occured_disease, disease from healthcare_data_processed group by disease order by most_occured_disease desc limit 1 offset 0;

-- 4. revenue by city-
select * from healthcare_data_processed;
select sum(final_bill) as revenue, city from healthcare_data_processed group by city;

-- 5. average stay by department -
select hospital_department, avg(length_of_stay) as Avg_Stay from healthcare_data_processed group by hospital_department;

-- 6. top 5 highest cost patients-
select patient_id as top_5_costliest_patients ,treatment_cost from healthcare_data_processed order by treatment_cost desc limit 5 offset 0;

-- 7. patients with long stay i.e greater than 10 days-
select distinct patient_id, length_of_stay as days_spent from healthcare_data_processed where length_of_stay>10;

-- 8. number of patients who stayed for more than 10 days-
select count(distinct patient_id) as number_of_patients from healthcare_data_processed where length_of_stay>10;

-- 9. revenue by disease-
select disease,sum(final_bill) as revenue_generated from healthcare_data_processed group by disease;

-- 10. To create a view -
create view high_cost_patients as select * from healthcare_data_processed where treatment_cost > 30000;

-- 11. now for the table having high cost patients where treatment_cost>30000 - 
SELECT * FROM high_cost_patients;
