insert into month_au_cust_auid_mst
with WK000001 as
  ( select k_month_auid.AU_ID as au_id,
           k_month_auid.PWD_INITIAL_CHANGE_CLS as pwd_initial_change_cls,
           case
               when k_month_auid.ACTIVE_DT = ''
                    or k_month_auid.ACTIVE_TM = '' then null
               else date_parse(concat(k_month_auid.ACTIVE_DT, ' ', date_format(date_parse(k_month_auid.ACTIVE_TM, '%%H%%i%%S%%f'), '%%T')), '%%Y-%%m-%%d %%T')
           end as active_dt
   from k_month_auid
   where k_month_auid.y = %(y)s
   and k_month_auid.m = %(m)s 
   and k_month_auid.YM = %(batch_date)s 
   and k_month_auid.INVALID_FLG != '1' ),
     WK000002 as
  ( select k_month_site_cust.CUST_ID as cust_id,
           k_month_site_cust.AU_ID as au_id,
           k_month_site_cust.DELE_AU_SUBS_RK as dele_au_subs_rk,
           case
               when k_month_site_cust.ACTIVE_DT = '' then null
               else date(k_month_site_cust.ACTIVE_DT)
           end as active_dt
   from k_month_site_cust
   where k_month_site_cust.y = %(y)s 
   and k_month_site_cust.m = %(m)s 
   and k_month_site_cust.YM = %(batch_date)s 
   and k_month_site_cust.INVALID_FLG != '1' ),
     WK000003 as
  ( select k_month_site_cust_link.CUST_ID as cust_id,
           k_month_site_cust_link.SUBS_ID as subs_id,
           k_month_site_cust_link.LINK_CLS as link_cls,
           case
               when k_month_site_cust_link.ACTIVE_DT = ''
                    or k_month_site_cust_link.ACTIVE_TM = '' then null
               else date_parse(concat(k_month_site_cust_link.ACTIVE_DT, ' ', date_format(date_parse(k_month_site_cust_link.ACTIVE_TM, '%%H%%i%%S%%f'), '%%T')), '%%Y-%%m-%%d %%T')
           end as active_dt
   from k_month_site_cust_link
   where k_month_site_cust_link.y = %(y)s 
   and k_month_site_cust_link.m = %(m)s 
   and k_month_site_cust_link.YM = %(batch_date)s 
   and k_month_site_cust_link.INVALID_FLG != '1' ),
     WK000004 as
  ( select k_month_dele_subs.CUST_ID as cust_id,
           k_month_dele_subs.SUBS_CLS as subs_cls,
           k_month_dele_subs.DELE_SUBS_ID as dele_subs_id,
           case
               when k_month_dele_subs.ACTIVE_DT = ''
                    or k_month_dele_subs.ACTIVE_TM = '' then null
               else date_parse(concat(k_month_dele_subs.ACTIVE_DT, ' ', date_format(date_parse(k_month_dele_subs.ACTIVE_TM, '%%H%%i%%S%%f'), '%%T')), '%%Y-%%m-%%d %%T')
           end as active_dt
   from k_month_dele_subs
   where k_month_dele_subs.YM = %(batch_date)s
     and k_month_dele_subs.INVALID_FLG != '1' ),
     WK000005 as
  ( select WK000001.AU_ID as au_id,
           max(WK000001.ACTIVE_DT) as max_active_dt
   from WK000001
   group by WK000001.AU_ID ),
     WK000006 as
  ( select WK000001.AU_ID as au_id,
           WK000001.PWD_INITIAL_CHANGE_CLS as pwd_initial_change_cls
   from WK000001
   inner join WK000005 on WK000001.AU_ID = WK000005.AU_ID
   and WK000001.ACTIVE_DT = WK000005.MAX_ACTIVE_DT ),
     WK000007 as
  ( select WK000002.AU_ID as au_id,
           max(WK000002.ACTIVE_DT) as max_active_dt
   from WK000002
   group by WK000002.AU_ID ),
     WK000008 as
  ( select WK000002.CUST_ID as cust_id,
           WK000002.AU_ID as au_id,
           WK000002.DELE_AU_SUBS_RK as dele_au_subs_rk
   from WK000002
   inner join WK000007 on WK000002.AU_ID = WK000007.AU_ID
   and WK000002.ACTIVE_DT = WK000007.MAX_ACTIVE_DT ),
     WK000009 as
  ( select WK000006.AU_ID as au_id,
           WK000008.CUST_ID as cust_id,
           WK000006.PWD_INITIAL_CHANGE_CLS as pwd_initial_change_cls,
           WK000008.DELE_AU_SUBS_RK as dele_au_subs_rk
   from WK000006
   inner join WK000008 on WK000006.AU_ID = WK000008.AU_ID ),
     WK000010 as
  ( select WK000003.SUBS_ID as subs_id,
           count(WK000003.ACTIVE_DT) as duplicate_id_cnt
   from WK000003
   group by WK000003.SUBS_ID ),
     WK000011 as
  ( select WK000003.CUST_ID as cust_id,
           WK000003.SUBS_ID as subs_id,
           WK000003.LINK_CLS as link_cls,
           WK000003.ACTIVE_DT as active_dt
   from WK000003
   left join WK000010 on WK000003.SUBS_ID = WK000010.SUBS_ID
   where WK000010.DUPLICATE_ID_CNT = 1 ),
     WK000012 as
  ( select WK000003.CUST_ID as cust_id,
           WK000003.SUBS_ID as subs_id,
           WK000003.LINK_CLS as link_cls,
           WK000003.ACTIVE_DT as active_dt
   from WK000003
   left join WK000010 on WK000003.SUBS_ID = WK000010.SUBS_ID
   where WK000010.DUPLICATE_ID_CNT >= 2 ),
     WK000013 as
  ( select WK000012.SUBS_ID as subs_id,
           max(WK000012.ACTIVE_DT) as max_active_dt
   from WK000012
   group by WK000012.SUBS_ID ),
     WK000014 as
  ( select WK000012.CUST_ID as cust_id,
           WK000012.SUBS_ID as subs_id,
           WK000012.LINK_CLS as link_cls,
           WK000012.ACTIVE_DT as active_dt
   from WK000012
   inner join WK000013 on WK000012.SUBS_ID = WK000013.SUBS_ID
   and WK000012.ACTIVE_DT = WK000013.MAX_ACTIVE_DT 
   where WK000012.ACTIVE_DT <= date_add('day', -1, date_add('month', 1, date_trunc('month', date(date_parse(%(batch_date)s, '%%Y%%m'))))) ),
     WK000015 as
  ( select WK000011.CUST_ID as cust_id,
           WK000011.SUBS_ID as subs_id,
           WK000011.LINK_CLS as link_cls,
           WK000011.ACTIVE_DT as active_dt
   from WK000011 
   union all 
   select WK000014.CUST_ID as cust_id,
           WK000014.SUBS_ID as subs_id,
           WK000014.LINK_CLS as link_cls,
           WK000014.ACTIVE_DT as active_dt
   from WK000014 ),
     WK000016 as
  ( select WK000009.AU_ID as au_id,
           WK000009.CUST_ID as cust_id,
		   case
		       when WK000015.SUBS_ID is null then ''
		       else WK000015.SUBS_ID
		   end as subs_rk,
		   case
			   when WK000015.LINK_CLS is null then ''
			   else WK000015.LINK_CLS
		   end as link_cls,
           case
               when WK000009.DELE_AU_SUBS_RK != ''
                    and WK000015.SUBS_ID != ''
                    and WK000009.DELE_AU_SUBS_RK = WK000015.SUBS_ID then '1'
               else '0'
           end as dele_au_subs_join_flg,
           WK000009.PWD_INITIAL_CHANGE_CLS as pwd_initial_change_cls
   from WK000009
   left join WK000015 on WK000009.CUST_ID = WK000015.CUST_ID ),
     WK000017 as
  ( select WK000004.CUST_ID as cust_id,
           max(WK000004.ACTIVE_DT) as max_active_dt
   from WK000004
   group by WK000004.CUST_ID ),
     WK000018 as
  ( select WK000004.CUST_ID as cust_id,
           WK000004.SUBS_CLS as subs_cls,
           WK000004.DELE_SUBS_ID as dele_subs_id,
           WK000004.ACTIVE_DT as active_dt
   from WK000004
   inner join WK000017 on WK000004.CUST_ID = WK000017.CUST_ID
   and WK000004.ACTIVE_DT = WK000017.MAX_ACTIVE_DT ) 
select %(batch_date)s as acq_dt,
	   WK000016.AU_ID as au_id,
	   WK000016.CUST_ID as cust_id,
	   WK000016.SUBS_RK as subs_rk,
	   WK000016.LINK_CLS as link_cls,
	   WK000016.DELE_AU_SUBS_JOIN_FLG as dele_au_subs_join_flg,
	   WK000016.PWD_INITIAL_CHANGE_CLS as pwd_initial_change_cls,
	   case
		   when WK000018.SUBS_CLS = '1'
				and WK000016.SUBS_RK = WK000018.DELE_SUBS_ID then '1'
		   else '0'
	   end as dele_subs_flg,
	   %(y)s as y,
	   %(m)s as m
from WK000016
left join WK000018 on WK000016.CUST_ID = WK000018.CUST_ID
