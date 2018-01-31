connection: "events_ecommerce"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

datagroup: nightly_etl {
  sql_trigger: select current_date ;;
  max_cache_age: "24 hours"
}

persist_for: "24 hours"

explore: order_items {
  label: "Online Transactions"
#   fields: [ALL_FIELDS*,-order_items.total_revenue_from_under_21_custom, -order_items.total_revenue_from_under_21]
  persist_with: nightly_etl
  join: users {
    view_label: "Ordering Users"
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  join: user_facts {
    type: left_outer
    sql_on:  ${users.id} = ${user_facts.user_id} ;;
    relationship: one_to_one
  }
  join: user_facts_ndt {
    type: left_outer
    sql_on: ${users.id} = ${user_facts_ndt.user_id}  ;;
    relationship: one_to_one
  }
}

# If necessary, uncomment the line below to include explore_source.
# include: "1_30_san_diego.model.lkml"

view: user_facts_ndt {
  derived_table: {
    explore_source: order_items {
      column: user_id {}
      column: total_revenue {}
    }
  }
  dimension: user_id {
    type: number
    primary_key: yes
    hidden: yes
  }
  dimension: total_revenue {
    hidden: yes
    value_format: "$#,##0.00"
    type: number
  }
  measure: average_lifetime_revenue {
    type: average
    sql: ${total_revenue} ;;
  }


}
