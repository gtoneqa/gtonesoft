insert into month_cust_inf_shop
with WK000001 as
  ( select t_month_cust_inf.YM as ym,
           t_month_cust_inf.JOIN_REGION_CLS as join_region_cls,
           t_month_cust_inf.SUBS_RK as subs_rk,
           t_month_cust_inf.BILL_CD as bill_cd,
           t_month_cust_inf.SUBS_TYPE as subs_type,
           t_month_cust_inf.AU_TEL_NO_H as au_tel_no_h,
           t_month_cust_inf.SUBS_POSTAL_CD as subs_postal_cd,
           t_month_cust_inf.SUBS_PREF_CD as subs_pref_cd,
           t_month_cust_inf.JOIN_CITY_CD as join_city_cd,
           t_month_cust_inf.CONTACT_CLS as contact_cls,
           t_month_cust_inf.SUBS_AGE as subs_age,
           t_month_cust_inf.SUBS_GENDER_CLS as subs_gender_cls,
		   case
		       when t_month_cust_inf.target_birth_dt = '' then null
		       else date(date_parse(t_month_cust_inf.target_birth_dt, '%%Y%%m%%d'))
		   end as target_birth_dt,
           t_month_cust_inf.TAX_FREE_CLS as tax_free_cls,
           t_month_cust_inf.CUR_PRICE_PLAN_CD as cur_price_plan_cd,
           t_month_cust_inf.CUR_PRICE_PLAN_START_DT as cur_price_plan_start_dt,
           t_month_cust_inf.CUR_PRICE_PLAN_USE_PRD as cur_price_plan_use_prd,
           t_month_cust_inf.NEW_PRICE_PLAN_CD as new_price_plan_cd,
           t_month_cust_inf.NEW_PRICE_PLAN_REGIST_DT as new_price_plan_regist_dt,
           t_month_cust_inf.NEW_PRICE_PLAN_START_DT as new_price_plan_start_dt,
           t_month_cust_inf.NEW_JOIN_ACCEPT_SV_AGENCY_CD as new_join_accept_sv_agency_cd,
           t_month_cust_inf.NEW_JOIN_ACCEPT_SHOP_CD as new_join_accept_shop_cd,
           t_month_cust_inf.NEW_JOIN_DELIVERY_SV_AGENCY_CD as new_join_delivery_sv_agency_cd,
           t_month_cust_inf.NEW_JOIN_DELIVERY_SHOP_CD as new_join_delivery_shop_cd,
           t_month_cust_inf.LATEST_ACCEPT_SV_AGENCY_CD as latest_accept_sv_agency_cd,
           t_month_cust_inf.LATEST_ACCEPT_SHOP_CD as latest_accept_shop_cd,
           t_month_cust_inf.LATEST_DELIVERY_SV_AGENCY_CD as latest_delivery_sv_agency_cd,
           t_month_cust_inf.LATEST_DELIVERY_SHOP_CD as latest_delivery_shop_cd,
           t_month_cust_inf.LUMP_CLS as lump_cls,
           t_month_cust_inf.TYPE as type,
           t_month_cust_inf.SERIAL_NO as serial_no,
           t_month_cust_inf.EQUIP_RK as equip_rk,
           case
		       when t_month_cust_inf.use_model_start_dt = '' then null
			   else date(date_parse(t_month_cust_inf.use_model_start_dt, '%%Y%%m%%d'))
		   end as use_model_start_dt,
           t_month_cust_inf.USE_MODEL_USE_PERIOD as use_model_use_period,
           t_month_cust_inf.CHRG_START_DT as chrg_start_dt,
           t_month_cust_inf.COUNTING_START_DT as counting_start_dt,
           t_month_cust_inf.SVC_STATUS_L_CLS as svc_status_l_cls,
           t_month_cust_inf.SVC_STATUS_S_CLS as svc_status_s_cls,
           t_month_cust_inf.SUSPENSION_DT as suspension_dt,
           t_month_cust_inf.RE_USE_DT as re_use_dt,
           t_month_cust_inf.SUBS_TRANS_DT as subs_trans_dt,
           t_month_cust_inf.SUBS_REOPEN_DT as subs_reopen_dt,
           t_month_cust_inf.CLOSE_DT as close_dt,
           t_month_cust_inf.CLOSE_REASON as close_reason,
           t_month_cust_inf.OPERATION_DAYS as operation_days,
           t_month_cust_inf.USE_PRD_TOTAL as use_prd_total,
           t_month_cust_inf.SVC_CLS as svc_cls,
           t_month_cust_inf.CALL_WIDE_FLG as call_wide_flg,
           t_month_cust_inf.GROUP_DSC_FLG as group_dsc_flg,
           t_month_cust_inf.MULTI_Y_DSC_CLS as multi_y_dsc_cls,
           t_month_cust_inf.WIN_MULTI_CABLE_DSC_FLG as win_multi_cable_dsc_flg,
           t_month_cust_inf.AU_HOME_DSC_REGIST_FLG as au_home_dsc_regist_flg,
           t_month_cust_inf.PRIORITY_JOINER_FLG as priority_joiner_flg,
           t_month_cust_inf.PRICE_CALL_STOP_TOTAL_CNT as price_call_stop_total_cnt,
           t_month_cust_inf.TEMP_STOP as temp_stop,
           t_month_cust_inf.MODEL_CHANGE_CNT as model_change_cnt,
           t_month_cust_inf.MODEL_TROUBLE_CNT as model_trouble_cnt,
           t_month_cust_inf.TROUBLE_CNT_TOTAL as trouble_cnt_total,
           t_month_cust_inf.USED_MODEL_CLS as used_model_cls,
           t_month_cust_inf.WIDE_SPT_APPLY_FLG as wide_spt_apply_flg,
           t_month_cust_inf.SUBS_STUDENT_AGE as subs_student_age,
           t_month_cust_inf.MARU_BUSI_DSC_FLG as maru_busi_dsc_flg,
           t_month_cust_inf.OTHER_COMPANY_JOIN_CLS as other_company_join_cls,
           t_month_cust_inf.FROM_COMPANY_CD as from_company_cd,
           t_month_cust_inf.TO_COMPANY_CD as to_company_cd,
           t_month_cust_inf.G_CALL_DSC_CLS as g_call_dsc_cls,
           t_month_cust_inf.PERMISSION_CLS as permission_cls,
           t_month_cust_inf.HITORI_FLG as hitori_flg,
           t_month_cust_inf.MARU_BUSI_CO_CLS as maru_busi_co_cls,
           t_month_cust_inf.SHOP_PURCHASE_METHOD as shop_purchase_method,
		   case 
			   when t_month_cust_inf.result_trans_dt = '' then null
			   else date(date_parse(t_month_cust_inf.result_trans_dt, '%%Y%%m%%d'))
		   end as result_trans_dt,
           t_month_cust_inf.BF_TRANS_RESULT_CLS as bf_trans_result_cls,
           t_month_cust_inf.AF_TRANS_RESULT_CLS as af_trans_result_cls,
           t_month_cust_inf.FIRST_CHRG_START_DT as first_chrg_start_dt,
           t_month_cust_inf.COLLABO_COMPANY_FLG as collabo_company_flg
   from t_month_cust_inf
   where t_month_cust_inf.y = %(y)s
     and t_month_cust_inf.m = %(m)s ),
     WK000002 as
  ( select k_month_cust_inf.SUBS_RK as subs_rk,
           k_month_cust_inf.INTEGRATE_BILL_ACCOUNT as integrate_bill_account
   from k_month_cust_inf
   where k_month_cust_inf.y = %(y)s
     and k_month_cust_inf.m = %(m)s ),
     WK000003 as
  ( select month_shop_mst.SUPERVISOR_CD as supervisor_cd,
           month_shop_mst.SHOP_CD as shop_cd,
           month_shop_mst.SHOP_PREF_CD as shop_pref_cd,
           month_shop_mst.SHOP_CITY_CD as shop_city_cd,
           month_shop_mst.MVNO_CLS as mvno_cls,
           month_shop_mst.SALES_CHANNEL1 as sales_channel1,
           month_shop_mst.SALES_CHANNEL2 as sales_channel2
   from month_shop_mst
   where month_shop_mst.y = %(y)s
     and month_shop_mst.m = %(m)s ),
     WK000004 as
  ( select WK000001.YM as ym,
           WK000001.JOIN_REGION_CLS as join_region_cls,
           WK000001.SUBS_RK as subs_rk,
           WK000001.BILL_CD as bill_cd,
           WK000001.SUBS_TYPE as subs_type,
           WK000001.AU_TEL_NO_H as au_tel_no_h,
           WK000001.SUBS_POSTAL_CD as subs_postal_cd,
           WK000001.SUBS_PREF_CD as subs_pref_cd,
           WK000001.JOIN_CITY_CD as join_city_cd,
           WK000001.CONTACT_CLS as contact_cls,
           WK000001.SUBS_AGE as subs_age,
           WK000001.SUBS_GENDER_CLS as subs_gender_cls,
           WK000001.TARGET_BIRTH_DT as target_birth_dt,
           WK000001.TAX_FREE_CLS as tax_free_cls,
           WK000001.CUR_PRICE_PLAN_CD as cur_price_plan_cd,
           WK000001.CUR_PRICE_PLAN_START_DT as cur_price_plan_start_dt,
           WK000001.CUR_PRICE_PLAN_USE_PRD as cur_price_plan_use_prd,
           WK000001.NEW_PRICE_PLAN_CD as new_price_plan_cd,
           WK000001.NEW_PRICE_PLAN_REGIST_DT as new_price_plan_regist_dt,
           WK000001.NEW_PRICE_PLAN_START_DT as new_price_plan_start_dt,
           WK000001.NEW_JOIN_ACCEPT_SV_AGENCY_CD as new_join_accept_sv_agency_cd,
           WK000001.NEW_JOIN_ACCEPT_SHOP_CD as new_join_accept_shop_cd,
           WK000001.NEW_JOIN_DELIVERY_SV_AGENCY_CD as new_join_delivery_sv_agency_cd,
           WK000001.NEW_JOIN_DELIVERY_SHOP_CD as new_join_delivery_shop_cd,
           WK000001.LATEST_ACCEPT_SV_AGENCY_CD as latest_accept_sv_agency_cd,
           WK000001.LATEST_ACCEPT_SHOP_CD as latest_accept_shop_cd,
           WK000001.LATEST_DELIVERY_SV_AGENCY_CD as latest_delivery_sv_agency_cd,
           WK000001.LATEST_DELIVERY_SHOP_CD as latest_delivery_shop_cd,
           WK000001.LUMP_CLS as lump_cls,
           WK000001.TYPE as type,
           WK000001.SERIAL_NO as serial_no,
           WK000001.EQUIP_RK as equip_rk,
           WK000001.USE_MODEL_START_DT as use_model_start_dt,
           WK000001.USE_MODEL_USE_PERIOD as use_model_use_period,
           WK000001.CHRG_START_DT as chrg_start_dt,
           WK000001.COUNTING_START_DT as counting_start_dt,
           WK000001.SVC_STATUS_L_CLS as svc_status_l_cls,
           WK000001.SVC_STATUS_S_CLS as svc_status_s_cls,
           WK000001.SUSPENSION_DT as suspension_dt,
           WK000001.RE_USE_DT as re_use_dt,
           WK000001.SUBS_TRANS_DT as subs_trans_dt,
           WK000001.SUBS_REOPEN_DT as subs_reopen_dt,
           WK000001.CLOSE_DT as close_dt,
           WK000001.CLOSE_REASON as close_reason,
           WK000001.OPERATION_DAYS as operation_days,
           WK000001.USE_PRD_TOTAL as use_prd_total,
           WK000001.SVC_CLS as svc_cls,
           WK000001.CALL_WIDE_FLG as call_wide_flg,
           WK000001.GROUP_DSC_FLG as group_dsc_flg,
           WK000001.MULTI_Y_DSC_CLS as multi_y_dsc_cls,
           WK000001.WIN_MULTI_CABLE_DSC_FLG as win_multi_cable_dsc_flg,
           WK000001.AU_HOME_DSC_REGIST_FLG as au_home_dsc_regist_flg,
           WK000001.PRIORITY_JOINER_FLG as priority_joiner_flg,
           WK000001.PRICE_CALL_STOP_TOTAL_CNT as price_call_stop_total_cnt,
           WK000001.TEMP_STOP as temp_stop,
           WK000001.MODEL_CHANGE_CNT as model_change_cnt,
           WK000001.MODEL_TROUBLE_CNT as model_trouble_cnt,
           WK000001.TROUBLE_CNT_TOTAL as trouble_cnt_total,
           WK000001.USED_MODEL_CLS as used_model_cls,
           WK000001.WIDE_SPT_APPLY_FLG as wide_spt_apply_flg,
           WK000001.SUBS_STUDENT_AGE as subs_student_age,
           WK000001.MARU_BUSI_DSC_FLG as maru_busi_dsc_flg,
           WK000001.OTHER_COMPANY_JOIN_CLS as other_company_join_cls,
           WK000001.FROM_COMPANY_CD as from_company_cd,
           WK000001.TO_COMPANY_CD as to_company_cd,
           WK000001.G_CALL_DSC_CLS as g_call_dsc_cls,
           WK000001.PERMISSION_CLS as permission_cls,
           WK000001.HITORI_FLG as hitori_flg,
           WK000001.MARU_BUSI_CO_CLS as maru_busi_co_cls,
           WK000001.SHOP_PURCHASE_METHOD as shop_purchase_method,
           WK000001.RESULT_TRANS_DT as result_trans_dt,
           WK000001.BF_TRANS_RESULT_CLS as bf_trans_result_cls,
           WK000001.AF_TRANS_RESULT_CLS as af_trans_result_cls,
           WK000001.FIRST_CHRG_START_DT as first_chrg_start_dt,
           WK000001.COLLABO_COMPANY_FLG as collabo_company_flg,
           case
               when WK000002.INTEGRATE_BILL_ACCOUNT is null then ''
               else WK000002.INTEGRATE_BILL_ACCOUNT
           end as integrate_bill_account
   from WK000001
   left join WK000002 on WK000001.SUBS_RK = WK000002.SUBS_RK
   where WK000001.CUR_PRICE_PLAN_CD != 'RA84'
     and WK000001.NEW_PRICE_PLAN_CD != 'RA84' )
select %(batch_date)s as acq_dt,
       WK000004.SUBS_RK as subs_rk,
       WK000004.NEW_JOIN_ACCEPT_SV_AGENCY_CD as new_join_accept_sv_agency_cd,
       WK000004.NEW_JOIN_ACCEPT_SHOP_CD as new_join_accept_shop_cd,
       case
           when shop1.SALES_CHANNEL1 is null then ''
           else shop1.SALES_CHANNEL1
       end as new_join_accept_channel1,
       case
           when shop1.SALES_CHANNEL2 is null then ''
           else shop1.SALES_CHANNEL2
       end as new_join_accept_channel2,
       case
           when shop1.MVNO_CLS is null then ''
           else shop1.MVNO_CLS
       end as new_join_accept_mvno_cls,
       case
           when shop1.SHOP_PREF_CD is null then ''
           else shop1.SHOP_PREF_CD
       end as new_join_accept_pref_cd,
       case
           when shop1.SHOP_CITY_CD is null then ''
           else shop1.SHOP_CITY_CD
       end as new_join_accept_city_cd,
       WK000004.NEW_JOIN_DELIVERY_SV_AGENCY_CD as new_join_delivery_sv_agency_cd,
       WK000004.NEW_JOIN_DELIVERY_SHOP_CD as new_join_delivery_shop_cd,
       case
           when shop2.SALES_CHANNEL1 is null then ''
           else shop2.SALES_CHANNEL1
       end as new_join_delivery_channel1,
       case
           when shop2.SALES_CHANNEL2 is null then ''
           else shop2.SALES_CHANNEL2
       end as new_join_delivery_channel2,
       case
           when shop2.MVNO_CLS is null then ''
           else shop2.MVNO_CLS
       end as new_join_delivery_mvno_cls,
       case
           when shop2.SHOP_PREF_CD is null then ''
           else shop2.SHOP_PREF_CD
       end as new_join_delivery_pref_cd,
       case
           when shop2.SHOP_CITY_CD is null then ''
           else shop2.SHOP_CITY_CD
       end as new_join_delivery_city_cd,
       WK000004.LATEST_ACCEPT_SV_AGENCY_CD as latest_accept_sv_agency_cd,
       WK000004.LATEST_ACCEPT_SHOP_CD as latest_accept_shop_cd,
       case
           when shop3.SALES_CHANNEL1 is null then ''
           else shop3.SALES_CHANNEL1
       end as latest_accept_channel1,
       case
           when shop3.SALES_CHANNEL2 is null then ''
           else shop3.SALES_CHANNEL2
       end as latest_accept_channel2,
       case
           when shop3.MVNO_CLS is null then ''
           else shop3.MVNO_CLS
       end as latest_accept_mvno_cls,
       case
           when shop3.SHOP_PREF_CD is null then ''
           else shop3.SHOP_PREF_CD
       end as latest_accept_pref_cd,
       case
           when shop3.SHOP_CITY_CD is null then ''
           else shop3.SHOP_CITY_CD
       end as latest_accept_city_cd,
       WK000004.LATEST_DELIVERY_SV_AGENCY_CD as latest_delivery_sv_agency_cd,
       WK000004.LATEST_DELIVERY_SHOP_CD as latest_delivery_shop_cd,
       case
           when shop4.SALES_CHANNEL1 is null then ''
           else shop4.SALES_CHANNEL1
       end as latest_delivery_channel1,
       case
           when shop4.SALES_CHANNEL2 is null then ''
           else shop4.SALES_CHANNEL2
       end as latest_delivery_channel2,
       case
           when shop4.MVNO_CLS is null then ''
           else shop4.MVNO_CLS
       end as latest_delivery_mvno_cls,
       case
           when shop4.SHOP_PREF_CD is null then ''
           else shop4.SHOP_PREF_CD
       end as latest_delivery_pref_cd,
       case
           when shop4.SHOP_CITY_CD is null then ''
           else shop4.SHOP_CITY_CD
       end as latest_delivery_city_cd,
       %(y)s as y,
       %(m)s as m
from WK000004
left join WK000003 as shop1 on WK000004.NEW_JOIN_ACCEPT_SV_AGENCY_CD = shop1.SUPERVISOR_CD
and WK000004.NEW_JOIN_ACCEPT_SHOP_CD = shop1.SHOP_CD
left join WK000003 as shop2 on WK000004.NEW_JOIN_DELIVERY_SV_AGENCY_CD = shop2.SUPERVISOR_CD
and WK000004.NEW_JOIN_DELIVERY_SHOP_CD = shop2.SHOP_CD
left join WK000003 as shop3 on WK000004.LATEST_ACCEPT_SV_AGENCY_CD = shop3.SUPERVISOR_CD
and WK000004.LATEST_ACCEPT_SHOP_CD = shop3.SHOP_CD
left join WK000003 as shop4 on WK000004.LATEST_DELIVERY_SV_AGENCY_CD = shop4.SUPERVISOR_CD
and WK000004.LATEST_DELIVERY_SHOP_CD = shop4.SHOP_CD