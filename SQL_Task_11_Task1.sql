-- Task SQL 11.1

-- function no 1: identify whether the employee is young, middle age, old or underage
	
select * from customer
	
create or replace function iden_emp(age integer)
returns varchar as $$
	declare output varchar;
begin
	if age between 18 and 29 then output:='Younger_employee';
    elsif age between 30 and 49 then output:='Middle_age_employee';
	elsif age>49 then output:='Older_employee';
    else output:='underage';
   end if;
   return output;
end;
$$
language plpgsql;

select iden_emp(25)
select * from iden_emp(10)

-- function no 2: function to calculate profit margin percentage

select * from sales
	
create or replace function profit_margin(sales double precision, profit double precision)
returns double precision as $$
begin
    return case
        when sales > 0 then (profit / sales) * 100
        else 0  
    end;
end;
$$ language plpgsql;

select profit_margin(500, 50);  


-- function no 3: calculate price after discount

select * from sales 

create or replace function final_price(original_price double precision, discount double precision)
returns double precision as $$
begin
    return case
        when discount >= 0.5 then original_price * 0.5
        when discount >= 0.3 then original_price * 0.7
        when discount >= 0.1 then original_price * 0.9
        else original_price
    end;
end;
$$ language plpgsql;

select final_price(1000, 0.2);  

-- function no 4: This function categorizes products into different profit groups based on the profit margin

create or replace function categorize_product_by_profit(profit_margin double precision)
returns varchar as $$
begin
    return case
        when profit_margin > 50 then 'High Profit'
        when profit_margin >= 30 then 'Medium Profit'
        when profit_margin >= 10 then 'Low Profit'
        else 'Loss-making'
    end;
end;
$$ language plpgsql;

select categorize_product_by_profit(40); 

-- function no 5: determine the shipping priority by ship mode

create or replace function shipping_priority(ship_mode varchar)
returns varchar as $$
begin
    return case 
        when ship_mode = 'Same Day' then 'High Priority'
        when ship_mode = 'First Class' then 'Medium Priority'
        when ship_mode = 'Second Class' then 'Low Priority'
        when ship_mode = 'Standard Class' then 'Economy Priority'
        else 'Unknown Priority'
    end;
end;
$$ language plpgsql;

select shipping_priority('First Class');
select shipping_priority('Second Class');
select shipping_priority('Standard Class');
select shipping_priority('Same Day');