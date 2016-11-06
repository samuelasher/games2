view: sales_ranks_games {
  derived_table: {
    sql: select name , cast(@curRank := @curRank + 1 as signed) as rank
        from (
          select name
          from lookvr_vg.sales
          group by name
          order by sum(global_sales) desc
        ) ordered_list
        , (select @curRank := 0) r ;;
  }

  dimension: name {
 #   html: <p style="font-size:16px">  {{value}}  </p> ;;
  }
  dimension: rank {
    primary_key: yes
    type: number
  #  html: <p style="font-size:30px; text-align:center"> {{value}} </p> ;;
  }
}
