view: sales_ranks {
  derived_table: {
    sql: select platform , cast(@curRank := @curRank + 1 as signed) as rank
        from (
          select platform
          from lookvr_vg.sales
          group by platform
          order by sum(global_sales) desc
        ) ordered_list
        , (select @curRank := 0) r ;;
  }

  dimension: platform {
    html: <p style="font-size:23px"> {{value}} </p> ;;
  }
  dimension: rank {
    primary_key: yes
    type: number
  }
}
