view: road_accident_safety_data_guide {
  sql_table_name: UK_Car_Crashes.Road_Accident_Safety_Data_Guide ;;

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
