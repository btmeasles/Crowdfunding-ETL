-- select * from backers-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 


select backers_count, cf_id, outcome from campaign
where outcome = 'live'
group by cf_id
order by backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.


select cf_id, count(backer_id) from backers
group by cf_id
order by count(backer_id) DESC



-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

create table email_contacts_remaining_goal_amount as
select con.contact_id, con.first_name, con.last_name, con.email, cam.company_name, cam.goal - cam.pledged as "Remaining Goal Amount"
from contacts as con
inner join campaign as cam
on con.contact_id = cam.contact_id
where outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC





-- Check the table

select * from email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

create table email_backers_remaining_goal_amount AS
select b.email, b.first_name, b.last_name, c.cf_id, 
	c.company_name, c.description, c.end_date, c.goal - c.pledged as "Left of Goal"
from backers as b
inner join campaign as c
on b.cf_id = c.cf_id
order by b.last_name



-- Check the table
select * from email_backers_remaining_goal_amount

