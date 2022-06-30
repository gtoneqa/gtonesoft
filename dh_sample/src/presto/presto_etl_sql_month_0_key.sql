insert into month_0_key
with WK000001 as
  ( select month_au_cust_auid_mst.AU_ID as au_id,
           month_au_cust_auid_mst.SUBS_RK as subs_rk,
           month_au_cust_auid_mst.DELE_AU_SUBS_JOIN_FLG as dele_au_subs_join_flg
   from month_au_cust_auid_mst
   where month_au_cust_auid_mst.y = %(y)s
     and month_au_cust_auid_mst.m = %(m)s
     and month_au_cust_auid_mst.SUBS_RK != '' ),
     WK000002 as
  ( select month_cust_inf_base.SUBS_RK as subs_rk,
           month_cust_inf_base.SUBS_TYPE as subs_type,
           month_cust_inf_base.SVC_STATUS_L_CLS as svc_status_l_cls,
           month_cust_inf_base.SUSPENSION_DT as suspension_dt,
           month_cust_inf_base.CLOSE_DT as close_dt,
           month_cust_inf_base.SUSPENSION_CLOSE_FLG as suspension_close_flg
   from month_cust_inf_base
   where month_cust_inf_base.y = %(y)s
     and month_cust_inf_base.m = %(m)s )
select %(batch_date)s as acq_dt,
       WK000001.AU_ID as au_id,
       WK000001.SUBS_RK as subs_rk,
       WK000001.DELE_AU_SUBS_JOIN_FLG as dele_au_subs_join_flg,
       case
           when WK000002.SUBS_TYPE is null then ''
           else WK000002.SUBS_TYPE
       end as subs_type,
       case
           when WK000002.SUSPENSION_CLOSE_FLG is null then ''
           else WK000002.SUSPENSION_CLOSE_FLG
       end as suspension_close_flg,
       case
           when WK000002.SUBS_TYPE = 'S' then '1'
           else '0'
       end as month_svc_flg,
	   case
	       when year(WK000002.CLOSE_DT) = year( date(date_parse(%(batch_date)s, '%%Y%%m')))
		        and month(WK000002.CLOSE_DT) = month( date(date_parse(%(batch_date)s, '%%Y%%m'))) then '1'
	       else '0'
	   end as cur_close_flg,
	   case 
	       when year(WK000002.SUSPENSION_DT) = year( date(date_parse(%(batch_date)s, '%%Y%%m')))
		        and month(WK000002.SUSPENSION_DT) = month( date(date_parse(%(batch_date)s, '%%Y%%m'))) then '1'
	       else '0'
	   end as month_suspension_flg,
       %(y)s as y,
       %(m)s as m
from WK000001
left join WK000002 on WK000001.SUBS_RK = WK000002.SUBS_RK
