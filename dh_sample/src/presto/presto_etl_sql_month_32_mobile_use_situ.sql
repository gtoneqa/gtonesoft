insert into month_32_mobile_use_situ
with WK000001 as
  ( select month_0_key.AU_ID as au_id,
           month_0_key.SUBS_RK as subs_rk
   from month_0_key
   where month_0_key.y = %(y)s 
   and month_0_key.m = %(m)s 
   and month_0_key.DELE_AU_SUBS_JOIN_FLG = '1' 
   and month_0_key.SUSPENSION_CLOSE_FLG = '0' 
   and (month_0_key.MONTH_SVC_FLG = '1' or month_0_key.CUR_CLOSE_FLG = '1' or month_0_key.MONTH_SUSPENSION_FLG = '1' )),
     WK000002 as
  ( select month_cust_inf_base.SUBS_RK as subs_rk,
       month_cust_inf_base.JOIN_REGION_CLS as join_region_cls,
       month_cust_inf_base.CONTACT_CLS as contact_cls,
       month_cust_inf_base.NEW_PRICE_PLAN_CD as new_price_plan_cd,
       month_cust_inf_base.NEW_PRICE_PLAN_REGIST_DT as new_price_plan_regist_dt,
       month_cust_inf_base.NEW_PRICE_PLAN_START_DT as new_price_plan_start_dt,
       month_cust_inf_base.CLOSE_DT as close_dt,
       month_cust_inf_base.CLOSE_REASON as close_reason,
       month_cust_inf_base.AU_HOME_DSC_REGIST_FLG as au_home_dsc_regist_flg,
       month_cust_inf_base.PRIORITY_JOINER_FLG as priority_joiner_flg,
       month_cust_inf_base.FROM_COMPANY_CD as from_company_cd,
       month_cust_inf_base.TO_COMPANY_CD as to_company_cd,
       month_cust_inf_base.FIRST_CHRG_START_DT as first_chrg_start_dt,
       month_cust_inf_base.SVC_STATUS_GROUP_CLS as svc_status_group_cls
   from month_cust_inf_base
   where month_cust_inf_base.y = %(y)s
   and month_cust_inf_base.m = %(m)s),
     WK000003 as
  ( select month_cust_inf_shop.SUBS_RK as subs_rk,
           month_cust_inf_shop.NEW_JOIN_ACCEPT_SV_AGENCY_CD as new_join_accept_sv_agency_cd,
           month_cust_inf_shop.NEW_JOIN_ACCEPT_SHOP_CD as new_join_accept_shop_cd,
           month_cust_inf_shop.NEW_JOIN_DELIVERY_SV_AGENCY_CD as new_join_delivery_sv_agency_cd,
           month_cust_inf_shop.NEW_JOIN_DELIVERY_SHOP_CD as new_join_delivery_shop_cd,
           month_cust_inf_shop.LATEST_ACCEPT_SV_AGENCY_CD as latest_accept_sv_agency_cd,
           month_cust_inf_shop.LATEST_ACCEPT_SHOP_CD as latest_accept_shop_cd,
           month_cust_inf_shop.LATEST_DELIVERY_SV_AGENCY_CD as latest_delivery_sv_agency_cd,
           month_cust_inf_shop.LATEST_DELIVERY_SHOP_CD as latest_delivery_shop_cd,
           month_cust_inf_shop.NEW_JOIN_ACCEPT_CHANNEL1 as new_join_accept_channel1,
           month_cust_inf_shop.NEW_JOIN_ACCEPT_CHANNEL2 as new_join_accept_channel2,
           month_cust_inf_shop.NEW_JOIN_ACCEPT_MVNO_CLS as new_join_accept_mvno_cls,
           month_cust_inf_shop.NEW_JOIN_ACCEPT_CITY_CD as new_join_accept_city_cd,
           month_cust_inf_shop.LATEST_ACCEPT_CHANNEL1 as latest_accept_channel1,
           month_cust_inf_shop.LATEST_ACCEPT_CHANNEL2 as latest_accept_channel2,
           month_cust_inf_shop.LATEST_ACCEPT_MVNO_CLS as latest_accept_mvno_cls,
           month_cust_inf_shop.LATEST_DELIVERY_CHANNEL1 as latest_delivery_channel1,
           month_cust_inf_shop.LATEST_DELIVERY_CHANNEL2 as latest_delivery_channel2,
           month_cust_inf_shop.LATEST_DELIVERY_MVNO_CLS as latest_delivery_mvno_cls,
           month_cust_inf_shop.LATEST_DELIVERY_CITY_CD as latest_delivery_city_cd
   from month_cust_inf_shop
   where month_cust_inf_shop.y = %(y)s
     and month_cust_inf_shop.m = %(m)s )
select %(batch_date)s as acq_dt,
       WK000001.AU_ID as au_id,
       WK000002.JOIN_REGION_CLS as join_region_cls,
       WK000002.CONTACT_CLS as contact_cls,
       WK000002.NEW_PRICE_PLAN_CD as new_price_plan_cd,
       WK000002.NEW_PRICE_PLAN_REGIST_DT as new_price_plan_regist_dt,
       WK000002.NEW_PRICE_PLAN_START_DT as new_price_plan_start_dt,
       WK000002.CLOSE_DT as close_dt,
       WK000002.CLOSE_REASON as close_reason,
       WK000002.AU_HOME_DSC_REGIST_FLG as au_home_dsc_regist_flg,
       WK000002.PRIORITY_JOINER_FLG as priority_joiner_flg,
       WK000002.FROM_COMPANY_CD as from_company_cd,
       WK000002.TO_COMPANY_CD as to_company_cd,
       WK000002.FIRST_CHRG_START_DT as first_chrg_start_dt,
       WK000002.SVC_STATUS_GROUP_CLS as svc_status_group_cls,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as new_join_accept_sv_agency_cd,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as new_join_accept_shop_cd,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as new_join_delivery_sv_agency_cd,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as new_join_delivery_shop_cd,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as latest_accept_sv_agency_cd,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as latest_accept_shop_cd,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as latest_delivery_sv_agency_cd,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as latest_delivery_shop_cd,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as new_join_accept_channel1,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as new_join_accept_channel2,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as new_join_accept_mvno_cls,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as new_join_accept_city_cd,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as latest_accept_channel1,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as latest_accept_channel2,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as latest_accept_mvno_cls,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as latest_delivery_channel1,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as latest_delivery_channel2,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as latest_delivery_mvno_cls,
       WK000003.NEW_JOIN_ACCEPT_SV_AGENCY_CD as latest_delivery_city_cd,
       %(y)s as y,
       %(m)s as m
from WK000001
inner join WK000002 on WK000001.SUBS_RK = WK000002.SUBS_RK
inner join WK000003 on WK000001.SUBS_RK = WK000003.SUBS_RK