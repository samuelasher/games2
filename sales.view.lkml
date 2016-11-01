view: sales {
  sql_table_name: lookvr_vg.sales ;;

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: eu_sales {
    type: number
    sql: ${TABLE}.eu_sales ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  dimension: global_sales {
    type: number
    sql: ${TABLE}.global_sales ;;
  }

  dimension: jp_sales {
    type: number
    sql: ${TABLE}.jp_sales ;;
  }

  dimension: na_sales {
    type: number
    sql: ${TABLE}.na_sales ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: other_sales {
    type: number
    sql: ${TABLE}.other_sales ;;
  }

  dimension: console {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: console_manufacturer {
    type: string
    sql: ${TABLE}.publisher ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id, name]
  }
}
