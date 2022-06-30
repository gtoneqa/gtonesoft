insert into month_1_gender_age
with WK000001 as
  ( select month_0_key.AU_ID as au_id,
           month_0_key.SUBS_RK as subs_rk
   from month_0_key
   where month_0_key.y = %(y)s 
   and month_0_key.m = %(m)s 
   and month_0_key.DELE_AU_SUBS_JOIN_FLG = '1' 
   and month_0_key.SUSPENSION_CLOSE_FLG = '0' 
   and (month_0_key.MONTH_SVC_FLG = '1' or month_0_key.CUR_CLOSE_FLG = '1' or month_0_key.MONTH_SUSPENSION_FLG = '1' ))
select %(batch_date)s as acq_dt,
       WK000001.AU_ID as au_id,
       month_cust_inf_base.SUBS_AGE as subs_age,
       month_cust_inf_base.SUBS_GENDER_CLS as subs_gender_cls,
       month_cust_inf_base.SUBS_STUDENT_AGE as subs_student_age,
       month_cust_inf_base.USER_AGE as user_age,
       month_cust_inf_base.USER_STUDENT_AGE as user_student_age,
       %(y)s as y,
       %(m)s as m
from WK000001
inner join month_cust_inf_base on WK000001.SUBS_RK = month_cust_inf_base.SUBS_RK
where month_cust_inf_base.y = %(y)s
  and month_cust_inf_base.m = %(m)s
