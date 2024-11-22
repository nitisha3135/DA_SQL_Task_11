-- SQL Task 11.2

-- function 1: To check food products rating
	
create or replace function checkRating(rating numeric)
returns varchar as $$ 
declare 
    output varchar;
begin 
    if rating > 4.00 then
        output := 'good rating';
    else
        output := 'low rating';
    end if;
    return output;
end;
$$ language plpgsql;

select checkRating(4.6);

select product_id, product_name, rating, checkRating(rating) as rating_status
from food_products;


-- function : To check food expiration date 

create or replace function checkExpiration(expiration_date date)
returns varchar as $$ 
declare 
    output varchar;
begin 
    if expiration_date < current_date then
        output := 'expired';
    else
        output := 'valid';
    end if;
    return output;
end;
$$ language plpgsql;

select checkExpiration('2029-03-31')

select product_id, product_name, expiration_date, checkExpiration(expiration_date) as expiration_status
from food_products;

