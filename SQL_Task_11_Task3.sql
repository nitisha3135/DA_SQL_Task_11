-- SQL Task 11.3

create or replace function get_avg_discount(in_ship_mode varchar)
returns double precision as $$
declare
    avg_discount double precision ;
begin
    select avg(discount) into avg_discount
	from sales
	where sales.ship_mode=in_ship_mode;

if avg_discount is null then
        avg_discount := 0;
    end if;
    return avg_discount;
end;
$$ language plpgsql;

select get_avg_discount('Standard Class');


select order_id, sum(profit) as total_profitfrom sales
group by order_id
order by total_profit DESC
limit 5;
