view: consoles {
  sql_table_name: lookvr_vg.consoles ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: manufacturer {
    type: string
    sql: ${TABLE}.developer ;;
  }

  dimension: games {
    type: number
    hidden: yes
    sql: ${TABLE}.games ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    link: {
      url: "/dashboards/3?Console%20Name={{ value | url_encode }}"
      label: "Console Lookup Dashboard"
    }
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: release_year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: console_image {
     group_label: "Images"
     sql: ${name} ;;
     html: <img src="http://feeling-lucky-looker.herokuapp.com/api.php?q={{value | url_param_escape }}%25console"  style="max-height: 300px; max-width: 300px; border-radius: 20px; margin-bottom: 5px;" />
      ;;
   }

   dimension: console_image_with_title {
     group_label: "Images"
     sql:  ${name} ;;
     html: <div style="width: 100px; text-align: center; margin: auto">
     <img src="http://feeling-lucky-looker.herokuapp.com/api.php?q={{value | url_param_escape }}%25console"
     alt="{{value}}" style="height: 100px; width: 100px; border-radius: 8px; margin-bottom: 5px;" />
     </br>{{ value }}
     </div>
     ;;
   }

   dimension: manufacturer_picture {
     group_label: "Images"
     sql: ${manufacturer} ;;
     html: <img src="http://feeling-lucky-looker.herokuapp.com/api.php?q={{value | url_param_escape }}%25logo"  style="max-height: 300px; max-width: 300px; border-radius: 20px; margin-bottom: 5px;" />
       ;;   }

  dimension: name_bucketed {
     description: "All computer games are bucketed together when you use this dimension"
     drill_fields: [manufacturer, name, platform, release_year]
     type: string
     sql: CASE WHEN ${platform} = 'Computer' THEN 'Computer'
       ELSE ${name} END;;
   }

  measure: count {
    type: count
    drill_fields: [name, manufacturer, platform, release_year  ]
  }
}
