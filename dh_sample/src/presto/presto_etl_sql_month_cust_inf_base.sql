insert into month_cust_inf_base
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
               when t_month_cust_inf.TARGET_BIRTH_DT = '' then null
               else date(date_parse(t_month_cust_inf.TARGET_BIRTH_DT, '%%Y%%m%%d'))
           end as target_birth_dt,
           t_month_cust_inf.TAX_FREE_CLS as tax_free_cls,
           t_month_cust_inf.CUR_PRICE_PLAN_CD as cur_price_plan_cd,
           case
               when t_month_cust_inf.CUR_PRICE_PLAN_START_DT = '' then null
               else date(date_parse(t_month_cust_inf.CUR_PRICE_PLAN_START_DT, '%%Y%%m%%d'))
           end as cur_price_plan_start_dt,
           t_month_cust_inf.CUR_PRICE_PLAN_USE_PRD as cur_price_plan_use_prd,
           t_month_cust_inf.NEW_PRICE_PLAN_CD as new_price_plan_cd,
           case
               when t_month_cust_inf.NEW_PRICE_PLAN_REGIST_DT = '' then null
               else date(date_parse(t_month_cust_inf.NEW_PRICE_PLAN_REGIST_DT, '%%Y%%m%%d'))
           end as new_price_plan_regist_dt,
           case
               when t_month_cust_inf.NEW_PRICE_PLAN_START_DT = '' then null
               else date(date_parse(t_month_cust_inf.NEW_PRICE_PLAN_START_DT, '%%Y%%m%%d'))
           end as new_price_plan_start_dt,
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
               when t_month_cust_inf.USE_MODEL_START_DT = '' then null
               else date(date_parse(t_month_cust_inf.USE_MODEL_START_DT, '%%Y%%m%%d'))
           end as use_model_start_dt,
           t_month_cust_inf.USE_MODEL_USE_PERIOD as use_model_use_period,
           t_month_cust_inf.CHRG_START_DT as chrg_start_dt,
           t_month_cust_inf.COUNTING_START_DT as counting_start_dt,
           t_month_cust_inf.SVC_STATUS_L_CLS as svc_status_l_cls,
           t_month_cust_inf.SVC_STATUS_S_CLS as svc_status_s_cls,
           case
               when t_month_cust_inf.SUSPENSION_DT = '' then null
               else date(date_parse(t_month_cust_inf.SUSPENSION_DT, '%%Y%%m%%d'))
           end as suspension_dt,
           t_month_cust_inf.RE_USE_DT as re_use_dt,
           t_month_cust_inf.SUBS_TRANS_DT as subs_trans_dt,
           t_month_cust_inf.SUBS_REOPEN_DT as subs_reopen_dt,
           case
               when t_month_cust_inf.CLOSE_DT = '' then null
               else date(date_parse(t_month_cust_inf.CLOSE_DT, '%%Y%%m%%d'))
           end as close_dt,
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
               when t_month_cust_inf.RESULT_TRANS_DT = '' then null
               else date(date_parse(t_month_cust_inf.RESULT_TRANS_DT, '%%Y%%m%%d'))
           end as result_trans_dt,
           t_month_cust_inf.BF_TRANS_RESULT_CLS as bf_trans_result_cls,
           t_month_cust_inf.AF_TRANS_RESULT_CLS as af_trans_result_cls,
           case
               when t_month_cust_inf.FIRST_CHRG_START_DT = '' then null
               else date(date_parse(t_month_cust_inf.FIRST_CHRG_START_DT, '%%Y%%m%%d'))
           end as first_chrg_start_dt,
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
     and WK000001.NEW_PRICE_PLAN_CD != 'RA84' ),
     WK000004 as
  ( select WK000003.JOIN_REGION_CLS as join_region_cls,
           WK000003.SUBS_RK as subs_rk,
           WK000003.SUBS_TYPE as subs_type,
           WK000003.CONTACT_CLS as contact_cls,
           case
               when WK000003.SUBS_AGE = 999
                    or WK000003.SUBS_TYPE != '1' then null
               else WK000003.SUBS_AGE
           end as subs_age,
           WK000003.SUBS_GENDER_CLS as subs_gender_cls,
           WK000003.CUR_PRICE_PLAN_CD as cur_price_plan_cd,
           WK000003.CUR_PRICE_PLAN_START_DT as cur_price_plan_start_dt,
           WK000003.CUR_PRICE_PLAN_USE_PRD as cur_price_plan_use_prd,
           WK000003.NEW_PRICE_PLAN_CD as new_price_plan_cd,
           WK000003.NEW_PRICE_PLAN_REGIST_DT as new_price_plan_regist_dt,
           WK000003.NEW_PRICE_PLAN_START_DT as new_price_plan_start_dt,
           WK000003.SVC_STATUS_L_CLS as svc_status_l_cls,
           WK000003.SUSPENSION_DT as suspension_dt,
           WK000003.CLOSE_DT as close_dt,
           WK000003.CLOSE_REASON as close_reason,
           WK000003.AU_HOME_DSC_REGIST_FLG as au_home_dsc_regist_flg,
           WK000003.PRIORITY_JOINER_FLG as priority_joiner_flg,
           case
               when WK000003.SUBS_STUDENT_AGE = 999
                    or WK000003.SUBS_TYPE != '1' then null
               else WK000003.SUBS_STUDENT_AGE
           end as subs_student_age,
           WK000003.FROM_COMPANY_CD as from_company_cd,
           WK000003.TO_COMPANY_CD as to_company_cd,
           WK000003.PERMISSION_CLS as permission_cls,
           WK000003.FIRST_CHRG_START_DT as first_chrg_start_dt,
           date_diff('year', WK000003.TARGET_BIRTH_DT, date_add('day', -1, date_add('month', 1, date_trunc('month', date(date_parse(%(batch_date)s, '%%Y%%m')))))) as user_age,
           case
               when month(date(date_parse(%(batch_date)s, '%%Y%%m')))<=3
                    and month(WK000003.TARGET_BIRTH_DT)>=4 then year(date(date_parse(%(batch_date)s, '%%Y%%m'))) - year(WK000003.TARGET_BIRTH_DT) - 1
               when month(date(date_parse(%(batch_date)s, '%%Y%%m')))>=4
                    and month(WK000003.TARGET_BIRTH_DT)<=3 then year(date(date_parse(%(batch_date)s, '%%Y%%m'))) - year(WK000003.TARGET_BIRTH_DT) + 1
               else year(date(date_parse(%(batch_date)s, '%%Y%%m'))) - year(WK000003.TARGET_BIRTH_DT)
           end as user_student_age,
           case
               when WK000003.SVC_STATUS_L_CLS = 'P' then 'P'
               else WK000003.SVC_STATUS_S_CLS
           end as svc_status_group_cls,
           case
               when WK000003.SVC_STATUS_L_CLS = 'O'
                    and WK000003.SVC_STATUS_S_CLS = 'N'
                    and ((WK000003.LATEST_ACCEPT_SV_AGENCY_CD = 'E998'
                          and WK000003.LATEST_ACCEPT_SHOP_CD = '007')
                         or (WK000003.LATEST_ACCEPT_SV_AGENCY_CD = 'N000'
                             and WK000003.LATEST_ACCEPT_SHOP_CD = '002')
                         or (WK000003.LATEST_ACCEPT_SV_AGENCY_CD = 'D998'
                             and WK000003.LATEST_ACCEPT_SHOP_CD = '001')
                         or (WK000003.LATEST_ACCEPT_SV_AGENCY_CD = 'T998'
                             and WK000003.LATEST_ACCEPT_SHOP_CD = '001')
                         or (WK000003.LATEST_ACCEPT_SV_AGENCY_CD = 'H998'
                             and WK000003.LATEST_ACCEPT_SHOP_CD = '001')
                         or (WK000003.LATEST_ACCEPT_SV_AGENCY_CD = 'K998'
                             and WK000003.LATEST_ACCEPT_SHOP_CD = '001')
                         or (WK000003.LATEST_ACCEPT_SV_AGENCY_CD = 'C998'
                             and WK000003.LATEST_ACCEPT_SHOP_CD = '001')
                         or (WK000003.LATEST_ACCEPT_SV_AGENCY_CD = 'S998'
                             and WK000003.LATEST_ACCEPT_SHOP_CD = '001')
                         or (WK000003.LATEST_ACCEPT_SV_AGENCY_CD = 'Q998'
                             and WK000003.LATEST_ACCEPT_SHOP_CD = '001')
                         or (WK000003.LATEST_ACCEPT_SV_AGENCY_CD = 'R998'
                             and WK000003.LATEST_ACCEPT_SHOP_CD = '001')) then '1'
               else '0'
           end as suspension_close_flg,
           case
               when WK000003.RESULT_TRANS_DT > date_add('day', -1, date_add('month', 1, date(date_parse(%(batch_date)s, '%%Y%%m'))))
                    and WK000003.BF_TRANS_RESULT_CLS != '' then WK000003.BF_TRANS_RESULT_CLS
               when WK000003.RESULT_TRANS_DT > date_add('day', -1, date_add('month', 1, date(date_parse(%(batch_date)s, '%%Y%%m'))))
                    and WK000003.BF_TRANS_RESULT_CLS = '' then '0'
               when WK000003.RESULT_TRANS_DT <= date_add('day', -1, date_add('month', 1, date(date_parse(%(batch_date)s, '%%Y%%m'))))
                    and WK000003.AF_TRANS_RESULT_CLS != '' then WK000003.AF_TRANS_RESULT_CLS
               when WK000003.RESULT_TRANS_DT <= date_add('day', -1, date_add('month', 1, date(date_parse(%(batch_date)s, '%%Y%%m'))))
                    and WK000003.AF_TRANS_RESULT_CLS = '' then '0'
           end as subs_depart_flg,
           case
               when WK000003.SHOP_PURCHASE_METHOD in ('10',
                                                      '11',
                                                      '12') then '1'
               when WK000003.SHOP_PURCHASE_METHOD in ('AF',
                                                      'AJ',
                                                      'AK',
                                                      'AL',
                                                      'AM',
                                                      'AN',
                                                      'AW',
                                                      'AX',
                                                      'AY',
                                                      'FM',
                                                      'FN',
                                                      'FP',
                                                      'FS',
                                                      'FT',
                                                      'FU') then '2'
               else '0'
           end as simple_usage_cls,
           WK000003.USE_MODEL_START_DT as use_model_start_dt
   from WK000003 )
select %(batch_date)s as acq_dt,
       WK000004.JOIN_REGION_CLS as join_region_cls,
       WK000004.SUBS_RK as subs_rk,
       WK000004.SUBS_TYPE as subs_type,
       WK000004.CONTACT_CLS as contact_cls,
       WK000004.SUBS_AGE as subs_age,
       WK000004.SUBS_GENDER_CLS as subs_gender_cls,
       WK000004.CUR_PRICE_PLAN_CD as cur_price_plan_cd,
       WK000004.CUR_PRICE_PLAN_START_DT as cur_price_plan_start_dt,
       WK000004.CUR_PRICE_PLAN_USE_PRD as cur_price_plan_use_prd,
       WK000004.NEW_PRICE_PLAN_CD as new_price_plan_cd,
       WK000004.NEW_PRICE_PLAN_REGIST_DT as new_price_plan_regist_dt,
       WK000004.NEW_PRICE_PLAN_START_DT as new_price_plan_start_dt,
       WK000004.SVC_STATUS_L_CLS as svc_status_l_cls,
       WK000004.SUSPENSION_DT as suspension_dt,
       WK000004.CLOSE_DT as close_dt,
       WK000004.CLOSE_REASON as close_reason,
       WK000004.AU_HOME_DSC_REGIST_FLG as au_home_dsc_regist_flg,
       WK000004.PRIORITY_JOINER_FLG as priority_joiner_flg,
       WK000004.SUBS_STUDENT_AGE as subs_student_age,
       WK000004.FROM_COMPANY_CD as from_company_cd,
       WK000004.TO_COMPANY_CD as to_company_cd,
       WK000004.PERMISSION_CLS as permission_cls,
       WK000004.FIRST_CHRG_START_DT as first_chrg_start_dt,
       WK000004.USER_AGE as user_age,
       WK000004.USER_STUDENT_AGE as user_student_age,
       WK000004.SVC_STATUS_GROUP_CLS as svc_status_group_cls,
       WK000004.SUSPENSION_CLOSE_FLG as suspension_close_flg,
       WK000004.SUBS_DEPART_FLG as subs_depart_flg,
       WK000004.SIMPLE_USAGE_CLS as simple_usage_cls,
       case
           when WK000004.SIMPLE_USAGE_CLS in ('1',
                                              '2') then date_diff('month', WK000004.USE_MODEL_START_DT, date(date_parse(%(batch_date)s, '%%Y%%m'))) + 1
           when WK000004.SIMPLE_USAGE_CLS = '0' then null
       end as simple_usage_prd,
       case
           when WK000004.SIMPLE_USAGE_CLS = '2'
                and date_diff('month', WK000004.USE_MODEL_START_DT, date(date_parse(%(batch_date)s, '%%Y%%m'))) + 1 < 25 then 24 - date_diff('month', WK000004.USE_MODEL_START_DT, date(date_parse(%(batch_date)s, '%%Y%%m')))
           else null
       end as spt_spc_usage_renewal_prd,
       %(y)s as y,
       %(m)s as m
from WK000004