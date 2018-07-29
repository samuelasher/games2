view: ped_cross_human {
  sql_table_name: UK_Car_Crashes.Ped_Cross_Human ;;

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
