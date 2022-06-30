insert into k_month_auid
select %(batch_date)s as acq_dt,
   IFTMS3004.YM as ym,
   IFTMS3004.AU_ID as au_id,
   IFTMS3004.AU_ID_PWD_UPD_DT as au_id_pwd_upd_dt,
   IFTMS3004.AU_ID_PWD_UPD_TM as au_id_pwd_upd_tm,
   IFTMS3004.PWD_INITIAL_CHANGE_CLS as pwd_initial_change_cls,
   IFTMS3004.APPLY_LOCK_CLS as apply_lock_cls,
   IFTMS3004.APPLY_LOCK_REASON_CLS as apply_lock_reason_cls,
   IFTMS3004.AU_ID_TRANS_DETER_CLS as au_id_trans_deter_cls,
   IFTMS3004.ALIAS_AU_ID_CHG_CNT as alias_au_id_chg_cnt,
   IFTMS3004.AU_ID_INTERGRATE_SP_CNT as au_id_intergrate_sp_cnt,
   IFTMS3004.IOT_ID_CLS as iot_id_cls,
   IFTMS3004.ACTIVE_DT as active_dt,
   IFTMS3004.ACTIVE_TM as active_tm,
   IFTMS3004.INVALID_DT as invalid_dt,
   IFTMS3004.INVALID_TM as invalid_tm,
   IFTMS3004.INVALID_FLG as invalid_flg,
   IFTMS3004.CHURN_IN_DT as churn_in_dt,
   IFTMS3004.CHURN_IN_SUBS_RK as churn_in_subs_rk,
   %(y)s as y,
   %(m)s as m
from IFTMS3004
where IFTMS3004.dt = %(batch_date)s
