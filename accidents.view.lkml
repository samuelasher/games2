view: accidents {
  sql_table_name: UK_Car_Crashes.Accidents ;;

  dimension: _1st_road_class {
    type: number
    sql: ${TABLE}._1st_Road_Class ;;
  }

  dimension: _1st_road_number {
    type: number
    sql: ${TABLE}._1st_Road_Number ;;
  }

  dimension: _2nd_road_class {
    type: number
    sql: ${TABLE}._2nd_Road_Class ;;
  }

  dimension: _2nd_road_number {
    type: number
    sql: ${TABLE}._2nd_Road_Number ;;
  }

  dimension: accident_index {
    type: string
    sql: ${TABLE}.Accident_Index ;;
  }

  dimension: accident_severity {
    type: number
    sql: ${TABLE}.Accident_Severity ;;
  }

  dimension: carriageway_hazards {
    type: number
    sql: ${TABLE}.Carriageway_Hazards ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension: day_of_week {
    type: number
    sql: ${TABLE}.Day_of_Week ;;
  }

  dimension: did_police_officer_attend_scene_of_accident {
    type: number
    sql: ${TABLE}.Did_Police_Officer_Attend_Scene_of_Accident ;;
  }

  dimension: junction_control {
    type: number
    sql: ${TABLE}.Junction_Control ;;
  }

  dimension: junction_detail {
    type: number
    sql: ${TABLE}.Junction_Detail ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.Latitude ;;
  }

  dimension: light_conditions {
    type: number
    sql: ${TABLE}.Light_Conditions ;;
  }

  dimension: local_authority__district_ {
    type: number
    sql: ${TABLE}.Local_Authority__District_ ;;
  }

  dimension: local_authority__highway_ {
    type: string
    sql: ${TABLE}.Local_Authority__Highway_ ;;
  }

  dimension: location_easting_osgr {
    type: number
    sql: ${TABLE}.Location_Easting_OSGR ;;
  }

  dimension: location_northing_osgr {
    type: number
    sql: ${TABLE}.Location_Northing_OSGR ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.Longitude ;;
  }

  dimension: lsoa_of_accident_location {
    type: string
    sql: ${TABLE}.LSOA_of_Accident_Location ;;
  }

  dimension: number_of_casualties {
    type: number
    sql: ${TABLE}.Number_of_Casualties ;;
  }

  dimension: number_of_vehicles {
    type: number
    sql: ${TABLE}.Number_of_Vehicles ;;
  }

  dimension: pedestrian_crossing_human_control {
    type: number
    sql: ${TABLE}.Pedestrian_Crossing_Human_Control ;;
  }

  dimension: pedestrian_crossing_physical_facilities {
    type: number
    sql: ${TABLE}.Pedestrian_Crossing_Physical_Facilities ;;
  }

  dimension: police_force {
    type: number
    sql: ${TABLE}.Police_Force ;;
  }

  dimension: road_surface_conditions {
    type: number
    sql: ${TABLE}.Road_Surface_Conditions ;;
  }

  dimension: road_type {
    type: number
    sql: ${TABLE}.Road_Type ;;
  }

  dimension: special_conditions_at_site {
    type: number
    sql: ${TABLE}.Special_Conditions_at_Site ;;
  }

  dimension: speed_limit {
    type: number
    sql: ${TABLE}.Speed_limit ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.Time ;;
  }

  dimension: urban_or_rural_area {
    type: number
    sql: ${TABLE}.Urban_or_Rural_Area ;;
  }

  dimension: weather_conditions {
    type: number
    sql: ${TABLE}.Weather_Conditions ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
