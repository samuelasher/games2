view: ped_cross_physical {
  sql_table_name: UK_Car_Crashes.Ped_Cross_Physical ;;

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
