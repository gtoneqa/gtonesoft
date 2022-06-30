insert into k_month_dele_subs
select %(batch_date)s as acq_dt,
   IFTMS3007.YM as ym,
   IFTMS3007.CUST_ID as cust_id,
   IFTMS3007.SUBS_CLS as subs_cls,
   IFTMS3007.DELE_SUBS_ID as dele_subs_id,
   IFTMS3007.ACTIVE_DT as active_dt,
   IFTMS3007.ACTIVE_TM as active_tm,
   IFTMS3007.INVALID_DT as invalid_dt,
   IFTMS3007.INVALID_TM as invalid_tm,
   IFTMS3007.INVALID_FLG as invalid_flg,
   %(y)s as y,
   %(m)s as m
from IFTMS3007
where IFTMS3007.dt = %(batch_date)s
