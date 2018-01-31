view: order_items {
  sql_table_name: public.order_items ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

# Example composite primary key
#   dimension: pk {
#     type: string
#     sql:  ${id} || '-' || ${user_id};;
#   primary_key: yes
#   }


  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      day_of_month,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    label: "1) Sale Price"
    type: number
    sql: ${TABLE}.sale_price *.85 ;;
  }

  dimension: sale_price_normal {
    label: "1) Sale Price"
    type: number
    sql: ${TABLE}.sale_price ;;
  }


  dimension_group: shipped_at {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: hello {
    hidden: yes
    type: string
    sql: 1 ;;
    html:
    Hello, {{ _user_attributes["first_name"] }} !
    ;;
  }



  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
#     html:
#     <p> <a href="/dashboards/923?User%20ID={{value}}">{{ value }} </a></p>
#     ;;
    link: {
      label: "Go to Personal Dashboard for {{ users.first_name }}"
      url: "/dashboards/1_30_san_diego::130_training?User%20ID={{value}}"
      icon_url: "http://looker.com/favicon.ico"
    }
  }

  measure: total_revenue {
    type: sum
    value_format_name: usd
    sql:
      {% if status._in_query %}
       ${sale_price}
      {% else %}
       ${sale_price_normal}
      {% endif %}
    ;;
  }

  measure: total_revenue_from_under_21 {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
    filters: {
      field: users.can_drink
      value: "no"
    }
  }

  measure: revenue_share_under_21 {
    type: number
    sql:  ${total_revenue_from_under_21} * 1.0 / nullif(${total_revenue},0) ;;
    value_format_name: percent_2
  }






  measure: count {
    type: count
    drill_fields: [id]
  }
}
