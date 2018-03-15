connection: "sam_mysql"
include: "*.view.lkml"
include: "*.dashboard.lkml"
persist_for: "99999 hours"
explore: games {
  sql_always_where: NOT ${is_virtual_console} ;;
  join: consoles {
    relationship: many_to_one
    sql_on: ${games.console} = ${consoles.name} ;;
    type: left_outer
  }
  join: sales_by_game {
    from: sales
    view_label: "Sales by Game (SLOW)"
    relationship: one_to_one
    sql_on: ${games.console} = ${sales_by_game.console} AND ${games.year} = ${sales_by_game.year}
      AND ${games.name} = ${sales_by_game.name};;
  }
}
explore: consoles {
  join: sales_ranks {
    sql_on: ${sales_ranks.platform} = ${consoles.name} ;;
    relationship: one_to_one
    type: inner
  }
  join: sales_ranks_eu {
    sql_on: ${sales_ranks_eu.platform} = ${consoles.name} ;;
    relationship: one_to_one
    type: inner
  }
  join: sales_ranks_jp {
    sql_on: ${sales_ranks_jp.platform} = ${consoles.name} ;;
    relationship: one_to_one
    type: inner
  }
  join: sales_ranks_na {
    sql_on: ${sales_ranks_na.platform} = ${consoles.name} ;;
    relationship: one_to_one
    type: inner
  }
}
explore: sales {  join: consoles {
    relationship: many_to_one
    sql_on: ${sales.console} = ${consoles.name} ;;
    type: left_outer
  }}

explore: sales_ranks {
  hidden: yes
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

explore:  sales_ranks_games {
  hidden: yes
  join: sales_ranks_games_eu {
    sql_on: ${sales_ranks_games_eu.rank} = ${sales_ranks_games.rank} ;;
    relationship: one_to_one
    type: inner
  }
  join: sales_ranks_games_jp {
    sql_on: ${sales_ranks_games_jp.rank} = ${sales_ranks_games.rank} ;;
    relationship: one_to_one
    type: inner
  }
  join: sales_ranks_games_na {
    sql_on: ${sales_ranks_games_na.rank} = ${sales_ranks_games.rank} ;;
    relationship: one_to_one
    type: inner
  }
}

explore:  games_base {
  from:  games
  join: consoles {
    relationship: many_to_one
    sql_on: ${games_base.console} = ${consoles.name} ;;
    type: left_outer
  }
}