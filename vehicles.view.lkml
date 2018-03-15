view: vehicles {
  sql_table_name: UK_Car_Crashes.Vehicles ;;

  dimension: accident_index {
    type: string
    sql: ${TABLE}.Accident_Index ;;
  }

  dimension: age_band_of_driver {
    type: string
    sql: ${TABLE}.Age_Band_of_Driver ;;
  }

  dimension: age_of_driver {
    type: string
    sql: ${TABLE}.Age_of_Driver ;;
  }

  dimension: age_of_vehicle {
    type: string
    sql: ${TABLE}.Age_of_Vehicle ;;
  }

  dimension: driver_home_area_type {
    type: string
    sql: ${TABLE}.Driver_Home_Area_Type ;;
  }

  dimension: driver_imd_decile {
    type: string
    sql: ${TABLE}.Driver_IMD_Decile ;;
  }

  dimension: engine_capacity {
    type: string
    sql: ${TABLE}.Engine_Capacity ;;
  }

  dimension: first_point_of_impact {
    type: string
    sql: ${TABLE}.First_Point_of_Impact ;;
  }

  dimension: hit_object_in_carriageway {
    type: string
    sql: ${TABLE}.Hit_Object_in_Carriageway ;;
  }

  dimension: hit_object_off_carriageway {
    type: string
    sql: ${TABLE}.Hit_Object_off_Carriageway ;;
  }

  dimension: journey_purpose_of_driver {
    type: string
    sql: ${TABLE}.Journey_Purpose_of_Driver ;;
  }

  dimension: junction_location {
    type: string
    sql: ${TABLE}.Junction_Location ;;
  }

  dimension: propulsion_code {
    type: string
    sql: ${TABLE}.Propulsion_Code ;;
  }

  dimension: sex_of_driver {
    type: string
    sql: ${TABLE}.Sex_of_Driver ;;
  }

  dimension: skidding_and_overturning {
    type: string
    sql: ${TABLE}.Skidding_and_Overturning ;;
  }

  dimension: towing_and_articulation {
    type: string
    sql: ${TABLE}.Towing_and_Articulation ;;
  }

  dimension: vehicle_leaving_carriageway {
    type: string
    sql: ${TABLE}.Vehicle_Leaving_Carriageway ;;
  }

  dimension: vehicle_location_restricted_lane {
    type: string
    sql: ${TABLE}.Vehicle_Location_Restricted_Lane ;;
  }

  dimension: vehicle_manoeuvre {
    type: string
    sql: ${TABLE}.Vehicle_Manoeuvre ;;
  }

  dimension: vehicle_reference {
    type: string
    sql: ${TABLE}.Vehicle_Reference ;;
  }

  dimension: vehicle_type {
    type: string
    sql: ${TABLE}.Vehicle_Type ;;
  }

  dimension: was_vehicle_left_hand_drive {
    type: string
    sql: ${TABLE}.Was_Vehicle_Left_Hand_Drive ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
