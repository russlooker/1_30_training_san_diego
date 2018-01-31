view: user_facts {
  derived_table: {
    sql: SELECT
        OI.user_id
        ,sum(OI.sale_price) as lifetime_revenue
      FROM
        order_items OI
      GROUP BY 1
       ;;
    sql_trigger_value:  select current_date;;
#     persist_for: "24 hours"
#  datagroup_trigger: nightly_etl

sortkeys: ["user_id"]
distribution_style: even

  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: user_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: lifetime_revenue {
    hidden: yes
    type: string
    sql: ${TABLE}.lifetime_revenue ;;
  }

  measure: average_lifetime_revenue {
    label: "Average Spend"
    view_label: "Ordering Users"
    description: "This is the average revenue for all time on a per user basis"
    type: average
    value_format_name: usd
    sql:  ${lifetime_revenue} ;;
  }

  set: detail {
    fields: [user_id, lifetime_revenue]
  }
}
