
insert into t_month_shop_mst
select %(batch_date)s as acq_dt,
           IFTMS3003.SUPERVISOR_CD as supervisor_cd,
           IFTMS3003.SHOP_CD as shop_cd,
           IFTMS3003.SHOP_NAME as shop_name,
           IFTMS3003.SHOP_SHORT_NAME as shop_short_name,
           IFTMS3003.REGION_CD as region_cd,
           IFTMS3003.SHOP_REGION_CD as shop_region_cd,
           IFTMS3003.SHOP_REGION_NAME as shop_region_name,
           IFTMS3003.SHOP_HANDLE_CD as shop_handle_cd,
           IFTMS3003.SHOP_POSTAL_CD as shop_postal_cd,
           IFTMS3003.SHOP_PREF_CD as shop_pref_cd,
           IFTMS3003.SHOP_CITY_CD as shop_city_cd,
           IFTMS3003.SHOP_CLS as shop_cls,
           IFTMS3003.INSTAL_SALE_CLS as instal_sale_cls,
           IFTMS3003.AU_AGENCY_CLS as au_agency_cls,
           IFTMS3003.MVNO_CLS as mvno_cls,
           IFTMS3003.GROUP_CD_SV as group_cd_sv,
           IFTMS3003.GROUP_CD_SHOP as group_cd_shop,
           IFTMS3003.GROUP_CLS as group_cls,
           IFTMS3003.DIST_AF_SHOP as dist_af_shop,
           IFTMS3003.MONOPOLY_CLS as monopoly_cls,
           %(y)s as y,
           %(m)s as m
from IFTMS3003
where IFTMS3003.dt = %(batch_date)s
