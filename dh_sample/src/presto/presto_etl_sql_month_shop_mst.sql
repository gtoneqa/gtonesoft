insert into month_shop_mst
select %(batch_date)s as acq_dt,
                  t_month_shop_mst.SUPERVISOR_CD as supervisor_cd,
                  t_month_shop_mst.SHOP_CD as shop_cd,
                  t_month_shop_mst.SHOP_NAME as shop_name,
                  t_month_shop_mst.SHOP_SHORT_NAME as shop_short_name,
                  t_month_shop_mst.REGION_CD as region_cd,
                  t_month_shop_mst.SHOP_REGION_CD as shop_region_cd,
                  t_month_shop_mst.SHOP_REGION_NAME as shop_region_name,
                  t_month_shop_mst.SHOP_HANDLE_CD as shop_handle_cd,
                  t_month_shop_mst.SHOP_POSTAL_CD as shop_postal_cd,
                  t_month_shop_mst.SHOP_PREF_CD as shop_pref_cd,
                  t_month_shop_mst.SHOP_CITY_CD as shop_city_cd,
                  t_month_shop_mst.SHOP_CLS as shop_cls,
                  t_month_shop_mst.INSTAL_SALE_CLS as instal_sale_cls,
                  t_month_shop_mst.AU_AGENCY_CLS as au_agency_cls,
                  t_month_shop_mst.MVNO_CLS as mvno_cls,
                  t_month_shop_mst.GROUP_CD_SV as group_cd_sv,
                  t_month_shop_mst.GROUP_CD_SHOP as group_cd_shop,
                  t_month_shop_mst.GROUP_CLS as group_cls,
                  t_month_shop_mst.DIST_AF_SHOP as dist_af_shop,
                  t_month_shop_mst.MONOPOLY_CLS as monopoly_cls,
                  case
                      when SHOP_CLS like 'A%%' then 'Shop'
                      when SHOP_CLS like 'B%%' then 'Etc'
                      when SHOP_CLS like 'C%%' then 'pipit'
                      when SHOP_CLS like 'D%%'
                           and (DIST_AF_SHOP like '5%%'
                                or DIST_AF_SHOP = '') then 'a general store'
                      when SHOP_CLS like 'D%%'
                           and (DIST_AF_SHOP like '1%%'
                                or DIST_AF_SHOP like '2%%'
                                or DIST_AF_SHOP like '3%%'
                                or DIST_AF_SHOP like '4%%'
                                or DIST_AF_SHOP like '6%%'
                                or DIST_AF_SHOP like '7%%'
                                or DIST_AF_SHOP like '8%%'
                                or DIST_AF_SHOP like '9%%') then 'mass retailer'
                      when SHOP_CLS like 'Z0%%'
                           or SHOP_CLS like 'Z1%%' then 'company'
                      when SHOP_CLS like 'W00%%'
                           or SHOP_CLS like 'Z90%%'
                           or SHOP_CLS like 'Z91%%' then 'solution'
                      else 'ª½ªÎöâ'
                  end as sales_channel1,
                  case
                      when SHOP_CLS like 'A%%' then 'Shop'
                      when SHOP_CLS like 'B%%' then 'Other Shop'
                      when SHOP_CLS like 'C%%' then 'pipit'
                      when SHOP_CLS like 'D%%'
                           and (DIST_AF_SHOP like '5%%'
                                or DIST_AF_SHOP = '') then 'a general store'
                      when SHOP_CLS like 'D%%'
                           and DIST_AF_SHOP like '1%%' then 'electronics retailer'
                      when SHOP_CLS like 'D%%'
                           and DIST_AF_SHOP like '2%%' then 'camera retailer'
                      when SHOP_CLS like 'D%%'
                           and DIST_AF_SHOP like '3%%' then 'volume distributor'
                      when SHOP_CLS like 'D%%'
                           and (DIST_AF_SHOP like '4%%'
                                or DIST_AF_SHOP like '6%%'
                                or DIST_AF_SHOP like '7%%'
                                or DIST_AF_SHOP like '8%%'
                                or DIST_AF_SHOP like '9%%') then 'Etc'
                      when SHOP_CLS like 'Z0%%'
                           or SHOP_CLS like 'Z1%%' then 'company'
                      when SHOP_CLS like 'W00%%'
                           or SHOP_CLS like 'Z90%%'
                           or SHOP_CLS like 'Z91%%' then 'solution'
                      else 'Other'
                  end as sales_channel2,
                  %(y)s as y,
                  %(m)s as m
from t_month_shop_mst
where t_month_shop_mst.y = %(y)s and t_month_shop_mst.m = %(m)s
