view: point_of_impact {
  sql_table_name: UK_Car_Crashes.Point_of_Impact ;;

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
