insert into k_month_site_cust_link
select %(batch_date)s as acq_dt,
   IFTMS3006.YM as ym,
   IFTMS3006.CUST_ID as cust_id,
   IFTMS3006.SUBS_CLS as subs_cls,
   IFTMS3006.SUBS_ID as subs_id,
   IFTMS3006.LINK_CLS as link_cls,
   IFTMS3006.ACTIVE_DT as active_dt,
   IFTMS3006.ACTIVE_TM as active_tm,
   IFTMS3006.INVALID_DT as invalid_dt,
   IFTMS3006.INVALID_TM as invalid_tm,
   IFTMS3006.SUBS_LINK_STATUS_CD as subs_link_status_cd,
   IFTMS3006.INVALID_FLG as invalid_flg,
   %(y)s as y,
   %(m)s as m
from IFTMS3006
where IFTMS3006.dt = %(batch_date)s
