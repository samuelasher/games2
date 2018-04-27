view: junction_control {
  sql_table_name: UK_Car_Crashes.Junction_Control ;;

  dimension: code {
    type: number
    sql: ${TABLE}.code ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
