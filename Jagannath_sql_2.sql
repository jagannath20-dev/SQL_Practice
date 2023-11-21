set global max_allowed_packet = 209715200;
Show databases;
Use ineuron;

DELIMITER $$
create function add_to_col(a INT)
returns Int
DETERMINISTsysIC
BEGIN
           Declare b int;
           set b = a + 10;
           return b;
end;

select  * from sales1;
 
select max(sales) from sales1;
 
select quantity, add_to_col(quantity) from sales1;

DELIMITER $$
create function final_profit(profit int, discount int)
returns Int
DETERMINISTIC 
BEGIN
        Declare final_profit int;
        set final_profit = profit - discount;
        return final_profit;
end ;

select quantity, add_to_col(quantity) from sales1;

drop Database dress;

select profit, discount, final_profit(profit,discount) from sales1;

DELIMITER $$
create function final_profit_real(profit int, discount int, sales int)
returns int
DETERMINISTIC
Begin
         Declare final_profit_1 int;
         set final_profit_1 = profit - sales * discount;
         return final_profit_1;
end $$

select final_profit(profit
