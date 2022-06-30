insert into month_2_house_area
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
	   month_cust_inf_shop.NEW_JOIN_ACCEPT_PREF_CD as new_join_accept_pref_cd,
	   month_cust_inf_shop.LATEST_DELIVERY_PREF_CD as latest_delivery_pref_cd,
	   %(y)s as y,
	   %(m)s as m
   from WK000001
   inner join month_cust_inf_shop on WK000001.SUBS_RK = month_cust_inf_shop.SUBS_RK
   where month_cust_inf_shop.y = %(y)s
     and month_cust_inf_shop.m = %(m)s
