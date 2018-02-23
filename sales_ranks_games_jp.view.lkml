include: "sales_ranks_games.view.lkml"
view: sales_ranks_games_jp {
  extends: [sales_ranks_games]
  derived_table: {
    sql: select name , cast(@curRank := @curRank + 1 as signed) as rank
        from (
          select name
          from lookvr_vg.sales
          group by name
          order by sum(jp_sales) desc
        ) ordered_list
        , (select @curRank := 0) r ;;
  }
}
