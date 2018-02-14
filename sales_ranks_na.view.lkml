include: "sales_ranks.view.lkml"
view: sales_ranks_na {
  extends: [sales_ranks]
  derived_table: {
    sql: select platform , cast(@curRank := @curRank + 1 as signed) as rank
        from (
          select platform
          from lookvr_vg.sales
          group by platform
          order by sum(na_sales) desc
        ) ordered_list
        , (select @curRank := 0) r ;;
  }
}
