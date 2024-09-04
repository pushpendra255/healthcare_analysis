use p401;
-- Number of Patients across various summaries
SELECT "Number of patients included in the transfusion summary" as metric, sum(`Number of patients included in the transfusion summary`) from  `dialysis - i` 
group by metric
Union 
SELECT "Number of patients in hypercalcemia summary" as metric, sum(`Number of patients in hypercalcemia summary`) from `dialysis - i`
group by metric
UNION 
SELECT "Number of patient-months in hypercalcemia summary" as metric, sum(`Number of patient-months in hypercalcemia summary`) from `dialysis - i`
group by metric
Union 
SELECT "Number of patients in Serum phosphorus summary" as metric, sum(`Number of patients in Serum phosphorus summary`) from `dialysis - i`
group by metric
Union 
SELECT "Number of patient-months in Serum phosphorus summary" as metric, sum(`Number of patient-months in Serum phosphorus summary`) from `dialysis - i`
group by metric
Union 
SELECT "Number of patients included in hospitalization summary" as metric, sum(`Number of patients included in hospitalization summary`) from `dialysis - i`
group by metric
Union 
SELECT "Number of Patients included in survival summary" as metric, sum(`Number of Patients included in survival summary`) from `dialysis - i`
group by metric
Union 
SELECT "Number of hospitalizations included in hospital readmission summ" as metric, sum(`Number of hospitalizations included in hospital readmission summ`) from `dialysis - i`
group by metric
Union 
SELECT "Number of Patients included in fistula summary" as metric, sum(`Number of Patients included in fistula summary`) from `dialysis - i`
group by metric
Union 
SELECT "Number of patients in long term catheter summary" as metric, sum(`Number of patients in long term catheter summary`) from `dialysis - i`
group by metric
Union 
SELECT "Number of patient months in long term catheter summary" as metric, sum(`Number of patient months in long term catheter summary`) from `dialysis - i`
group by metric
Union 
SELECT "Number of patients in nPCR summary" as metric, sum(`Number of patients in nPCR summary`) from `dialysis - i`
group by metric;

 
-- 2 Profit Vs Non-Profit Stats
select `profit or non-profit` ,count(state) as no_of_states from `dialysis - i` group by `profit or non-profit`;

-- 3 Chain Organizations w.r.t. Total Performance Score as No Score
select `chain organization`,count(`total performance score`) as total_performance_no_source from `dialysis - ii` as d2 join `dialysis - i` as d1
on d1.`provider number` = d2.`CMS Certification Number (CCN)`
where `ich cahps measure score`="no score" group by `chain organization` order by total_performance_no_source desc
limit 5;

-- 4 Dialysis Stations Stats
select state,count(`# of Dialysis Stations`) as dialysis_stations from `dialysis - i`group by state order by dialysis_stations desc
limit 5;

-- 5 # of Category Text  - As Expected
 select state,count(`provider number`) as no_of_patients from `dialysis - i` where `patient hospitalization category text` = "as expected"
 group by state order by no_of_patients desc limit 5;
 
 -- 6 Average Payment Reduction Rate
 select avg(`PY2020 Payment Reduction Percentage`) from `dialysis - ii`;


