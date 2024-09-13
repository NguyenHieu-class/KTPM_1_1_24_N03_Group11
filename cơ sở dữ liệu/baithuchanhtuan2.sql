use classicmodels;
/* bai1 */
select amount, amount + 2 as amount_new from payments;
select amount, amount - 2 as amount_new from payments;
select amount, amount * 2 as amount_new from payments;
select amount, amount / 2 as amount_new from payments;
select amount, amount % 2 as amount_new from payments;

/* bai2 */
select * from customers where contactFirstName > 'nick';
select * from customers where contactFirstName < 'nick';
select * from customers where contactFirstName = 'nick';
select * from customers where contactFirstName != 'nick';
select * from customers where contactFirstName <> 'nick';

/* bai3 */
select * from customers where contactFirstName in ('nick','ed');
select * from customers where contactFirstName between 'nick' and 'ed';
select * from customers where contactFirstName like 'nick';
select * from customers where contactFirstName = 'nick' or contactFirstName = 'ed';
select * from customers where contactFirstName not in ('nick','ed');
select * from customers where contactFirstName not between 'nick' and 'ed';
select * from customers where contactFirstName not like 'nick';