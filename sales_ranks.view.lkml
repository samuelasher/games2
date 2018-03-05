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
     link: {
      url: "/dashboards/3?Console%20Name={{ value | url_encode }}"
      label: "Console Lookup Dashboard"
    }
  }
  dimension: rank {
    primary_key: yes
    type: number
    html: <p style="font-size:30px; text-align:center"> {{value}} </p> ;;
  }
}
