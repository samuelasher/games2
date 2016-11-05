connection: "video_games"
include: "*.view.lkml"
include: "*.dashboard.lkml"
#persist_for: "99999 hours"
explore: games {
  sql_always_where: NOT ${is_virtual_console} ;;
  join: consoles {
    relationship: many_to_one
    sql_on: ${games.console} = ${consoles.name} ;;
    type: left_outer
  }
  join: sales_by_console {
    from: sales
    relationship: many_to_one
    sql_on: ${consoles.name} = ${sales_by_console.console} ;;
  }
  join: sales_by_game {
    from: sales
    relationship: one_to_one
    sql_on: ${games.console} = ${sales_by_game.console} AND ${games.year} = ${sales_by_game.year}
      AND ${games.name} = ${sales_by_game.name};;
  }
}
explore: consoles {}
explore: sales {  join: consoles {
    relationship: many_to_one
    sql_on: ${sales.console} = ${consoles.name} ;;
    type: left_outer
  }}

explore: sales_ranks {
  join: sales_ranks_eu {
    sql_on: ${sales_ranks_eu.rank} = ${sales_ranks.rank} ;;
    relationship: one_to_one
    type: inner
  }
  join: sales_ranks_jp {
    sql_on: ${sales_ranks_jp.rank} = ${sales_ranks.rank} ;;
    relationship: one_to_one
    type: inner
  }
  join: sales_ranks_na {
    sql_on: ${sales_ranks_na.rank} = ${sales_ranks.rank} ;;
    relationship: one_to_one
    type: inner
  }
}
