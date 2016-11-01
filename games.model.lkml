connection: "video_games"
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
}
explore: consoles {}
