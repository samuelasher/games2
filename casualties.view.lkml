view: casualties {
  sql_table_name: UK_Car_Crashes.Casualties ;;

  dimension: accident_index {
    type: string
    sql: ${TABLE}.Accident_Index ;;
  }

  dimension: age_band_of_casualty {
    type: string
    sql: ${TABLE}.Age_Band_of_Casualty ;;
  }

  dimension: age_of_casualty {
    type: string
    sql: ${TABLE}.Age_of_Casualty ;;
  }

  dimension: bus_or_coach_passenger {
    type: string
    sql: ${TABLE}.Bus_or_Coach_Passenger ;;
  }

  dimension: car_passenger {
    type: string
    sql: ${TABLE}.Car_Passenger ;;
  }

  dimension: casualty_class {
    type: string
    sql: ${TABLE}.Casualty_Class ;;
  }

  dimension: casualty_home_area_type {
    type: string
    sql: ${TABLE}.Casualty_Home_Area_Type ;;
  }

  dimension: casualty_reference {
    type: string
    sql: ${TABLE}.Casualty_Reference ;;
  }

  dimension: casualty_severity {
    type: string
    sql: ${TABLE}.Casualty_Severity ;;
  }

  dimension: casualty_type {
    type: string
    sql: ${TABLE}.Casualty_Type ;;
  }

  dimension: pedestrian_location {
    type: string
    sql: ${TABLE}.Pedestrian_Location ;;
  }

  dimension: pedestrian_movement {
    type: string
    sql: ${TABLE}.Pedestrian_Movement ;;
  }

  dimension: pedestrian_road_maintenance_worker {
    type: string
    sql: ${TABLE}.Pedestrian_Road_Maintenance_Worker ;;
  }

  dimension: sex_of_casualty {
    type: string
    sql: ${TABLE}.Sex_of_Casualty ;;
  }

  dimension: vehicle_reference {
    type: string
    sql: ${TABLE}.Vehicle_Reference ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
